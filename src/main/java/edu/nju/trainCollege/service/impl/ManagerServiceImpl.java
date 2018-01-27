package edu.nju.trainCollege.service.impl;

import edu.nju.trainCollege.dao.ManagerDao;
import edu.nju.trainCollege.model.Manager;
import edu.nju.trainCollege.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerServiceImpl implements ManagerService {
    @Autowired
    private ManagerDao managerDao;
    public Manager login(String name, String password) {
        return managerDao.getByNamePwd(name,password);
    }
}
