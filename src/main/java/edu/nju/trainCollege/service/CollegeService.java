package edu.nju.trainCollege.service;

import edu.nju.trainCollege.model.College;

public interface CollegeService {
    public College login(String id, String password);

    public String register(College college);
}
