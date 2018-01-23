package edu.nju.trainCollege.service;

import edu.nju.trainCollege.model.Student;

public interface StudentService {
    public String login(String email,String password);

    public Integer register(Student student);
}
