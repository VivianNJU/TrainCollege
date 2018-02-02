package edu.nju.trainCollege.service;

import edu.nju.trainCollege.model.College;
import edu.nju.trainCollege.model.Manager;

import java.util.List;

public interface ManagerService {
    public Manager login(String name, String password);

    public List<College> getAllColleges();

    public List<College> getUncheckedColleges();
}
