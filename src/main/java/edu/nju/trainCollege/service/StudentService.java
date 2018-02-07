package edu.nju.trainCollege.service;

import edu.nju.trainCollege.model.Classes;
import edu.nju.trainCollege.model.College;
import edu.nju.trainCollege.model.Lesson;
import edu.nju.trainCollege.model.Student;
import org.hibernate.service.spi.ServiceException;

import javax.mail.internet.ParseException;
import java.util.List;

public interface StudentService {
    public Student login(String email,String password);

    public boolean register(Student student);

    public void processActivate(String email , String validateCode)throws ServiceException;

    public List<Lesson> getLessons();

    public College getCollegeById(int cid);

    public Lesson getLessonByLid(int lid);

    public List<Classes> getClassesByLid(int lid);
}
