package edu.nju.trainCollege.service.impl;

import edu.nju.trainCollege.dao.StudentDao;
import edu.nju.trainCollege.model.Student;
import edu.nju.trainCollege.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentDao studentDao;

    public String login(String email, String password) {
        if(studentDao.getByEmail(email)!=null)
            return "success";
        else
            return "fail";
    }

    public Integer register(Student student) {
        return studentDao.save(student);
    }

}
