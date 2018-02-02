package edu.nju.trainCollege.service.impl;

import edu.nju.trainCollege.dao.CollegeDao;
import edu.nju.trainCollege.dao.ManagerDao;
import edu.nju.trainCollege.model.College;
import edu.nju.trainCollege.model.Manager;
import edu.nju.trainCollege.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ManagerServiceImpl implements ManagerService {
    @Autowired
    private ManagerDao managerDao;
    @Autowired
    private CollegeDao collegeDao;

    public Manager login(String name, String password) {
        return managerDao.getByNamePwd(name,password);
    }

    public List<College> getAllColleges() {
        return collegeDao.getCollegeByState(-1);
    }

    public List<College> getUncheckedColleges() {
        return collegeDao.getCollegeByState(0);
    }
}
