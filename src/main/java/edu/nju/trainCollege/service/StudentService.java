package edu.nju.trainCollege.service;

import edu.nju.trainCollege.model.*;
import org.hibernate.service.spi.ServiceException;

import javax.mail.internet.ParseException;
import java.util.List;

public interface StudentService {
    public Student login(String email,String password);

    public boolean register(Student student);

    public void processActivate(String email , String validateCode)throws ServiceException;

    public void enrollLesson(Orders orders,List<LessonProgress> progresses)throws ServiceException;

    public List<Lesson> getLessons();

    public Student getStudentByEmail(String email);

    public College getCollegeById(int cid);

    public Lesson getLessonByLid(int lid);

    public List<Classes> getClassesByLid(int lid);

    /**
     * 如果非会员的信息不存在，就新建一条保存
     * @param name 学员名称
     * @param phone 学员联系方式
     * @return 非会员本人
     */
    public NormalStudent getNmStudent(String name,String phone);
}
