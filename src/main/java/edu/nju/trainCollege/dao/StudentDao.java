package edu.nju.trainCollege.dao;

import edu.nju.trainCollege.model.Student;

public interface StudentDao extends BaseDao<Student,Integer> {

    public Student getByEmail(String email);

}
