package edu.nju.trainCollege.service;

import edu.nju.trainCollege.model.Manager;

public interface ManagerService {
    public Manager login(String name, String password);
}
