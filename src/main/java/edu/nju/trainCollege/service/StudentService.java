package edu.nju.trainCollege.service;

import edu.nju.trainCollege.model.Student;
import org.hibernate.service.spi.ServiceException;

import javax.mail.internet.ParseException;

public interface StudentService {
    public Student login(String email,String password);

    public boolean register(Student student);

    public void processActivate(String email , String validateCode)throws ServiceException;
}
