package edu.nju.trainCollege.dao;

import edu.nju.trainCollege.model.Student;

import java.util.List;

public interface StudentDao extends BaseDao<Student,Integer> {

    public Student getByEmailPwd(String email, String password);

    public Student getByEmail(String email);

    public List<Student> getStudent();

}
