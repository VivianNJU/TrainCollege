package edu.nju.trainCollege.dao;

import edu.nju.trainCollege.model.Student;

public interface StudentDao extends BaseDao<Student,Integer> {

    public Student getByEmailPwd(String email, String password);

    public Student getByEmail(String email);

}
