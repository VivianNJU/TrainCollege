package edu.nju.trainCollege.service.impl;

import edu.nju.trainCollege.dao.*;
import edu.nju.trainCollege.model.*;
import edu.nju.trainCollege.service.StudentService;
import edu.nju.trainCollege.tools.LevelDiscount;
import edu.nju.trainCollege.tools.SendEmail;
import org.hibernate.service.spi.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentDao studentDao;
    @Autowired
    private LessonDao lessonDao;
    @Autowired
    private CollegeDao collegeDao;
    @Autowired
    private ClassesDao classesDao;
    @Autowired
    private LessonProDao lessonProDao;
    @Autowired
    private OrderDao orderDao;

    public Student login(String email, String password) {
        return studentDao.getByEmailPwd(email,password);
    }

    public boolean register(Student student) {
        if(studentDao.getByEmail(student.getEmail())!=null)
            return false;
        else{
            studentDao.save(student);
            ///邮件的内容
            StringBuffer sb=new StringBuffer("感谢您注册Train COLLEGE,点击下面链接激活账号，请尽快激活！<br>");
            sb.append("如果这不是您的注册行为，请不要点击!<br>");
            sb.append("<a href=\"http://localhost:8080/student/activate?email=");
            sb.append(student.getEmail());
            sb.append("&validateCode=");
            sb.append(student.getPassword());
            sb.append("\">点击此处激活账户");
            sb.append("</a>");

            //发送邮件
            SendEmail.send(student.getEmail(), sb.toString());
            return true;
        }
    }

    public void processActivate(String email, String validateCode) throws ServiceException {
        Student student = studentDao.getByEmail(email);
        if(student!=null){
            if(student.getState()==0){
                if(validateCode.equals(student.getPassword())) {
                    //激活成功，并更新用户的激活状态，为已激活
                    student.setState(1);//把状态改为激活
                    studentDao.saveOrUpdate(student);
                } else {
                    throw new ServiceException("激活码不正确");
                }
            }else if(student.getState()==1){
                throw new ServiceException("该邮箱已经激活！");
            }else{
                throw new ServiceException("该邮箱所注册账号已废弃，不可激活！");
            }
        }else{
            throw new ServiceException("该邮箱未注册（邮箱地址不存在）！");
        }
    }

    public void enrollLesson(Orders orders, List<LessonProgress> progresses) throws ServiceException {
        if(progresses==null||progresses.size()==0)
            throw new ServiceException("报名人数至少一人");
        int expr = studentDao.get(orders.getUid()).getExpr();
        double discount = LevelDiscount.getDiscount(expr);

        orders.setOrderTime(new Date());
        int lid = classesDao.get(progresses.get(0).getClassId()).getLid();
        orders.setLid(lid);

        int cid = lessonDao.get(lid).getCid();
        orders.setCid(cid);

        int totalPay = 0;
        for(LessonProgress lp:progresses){
            lp.setCid(cid);
            Classes classes = classesDao.get(lp.getClassId());
            lp.setPayment(new Double(classes.getPrice()*discount).intValue());
            totalPay+=lp.getPayment();

            int studentNum = lessonProDao.getByClassIdNo(classes.getId(),-1).size();
            if(studentNum>=classes.getNum()*classes.getSize()){
                throw new ServiceException(classes.getName()+" 报名人数已达上限，请重新选班");
            }else{
                int classNo = studentNum / classes.getSize()+1;
                lp.setClassNo(classNo);
            }
        }
        orders.setTotalPay(totalPay);

//        保存order，获得它的ID
        int oid = orderDao.save(orders);

        for(LessonProgress lp:progresses){
            lp.setOid(oid);
            lessonProDao.save(lp);
        }
    }

    public List<Lesson> getLessons() {
        return lessonDao.getByState(123);
    }

    public Student getStudentByEmail(String email) {
        return studentDao.getByEmail(email);
    }

    public College getCollegeById(int cid) {
        return collegeDao.get(cid);
    }

    public Lesson getLessonByLid(int lid) {
        return lessonDao.get(lid);
    }

    public List<Classes> getClassesByLid(int lid) {
        return classesDao.getByLessonId(lid);
    }

    public NormalStudent getNmStudent(String name, String phone) {
        NormalStudent ns = studentDao.getNmStudentByNamePhone(name,phone);
        if(ns==null) {
            ns = new NormalStudent();
            ns.setPhone(phone);
            ns.setUsername(name);
            ns.setId(studentDao.saveNmStudent(ns));
        }
        return ns;
    }

}
