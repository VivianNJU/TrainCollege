package edu.nju.trainCollege.service.impl;

import edu.nju.trainCollege.dao.StudentDao;
import edu.nju.trainCollege.model.Student;
import edu.nju.trainCollege.service.StudentService;
import edu.nju.trainCollege.tools.SendEmail;
import org.hibernate.service.spi.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.mail.internet.ParseException;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentDao studentDao;

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

}
