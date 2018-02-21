package edu.nju.trainCollege.service.impl;

import edu.nju.trainCollege.dao.CollegeDao;
import edu.nju.trainCollege.dao.ManagerDao;
import edu.nju.trainCollege.dao.StudentDao;
import edu.nju.trainCollege.model.College;
import edu.nju.trainCollege.model.Manager;
import edu.nju.trainCollege.model.Student;
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
    @Autowired
    private StudentDao studentDao;

    public Manager login(String name, String password) {
        return managerDao.getByNamePwd(name,password);
    }

    public List<College> getAllColleges() {
        return collegeDao.getCollegeByState(-1);
    }

    public List<College> getUncheckedColleges() {
        return collegeDao.getCollegeByState(0);
    }

    public College getCollege(int id) {
        return collegeDao.get(id);
    }

    public boolean changeCollegeState(int id,int state) {
        try {
            College college = collegeDao.get(id);
            college.setState(state);
            collegeDao.saveOrUpdate(college);
            return true;
        }catch (Exception ex){
            return false;
        }
    }

    public List<Student> getAllStudents() {
        return studentDao.getStudent();
    }

    public Student getStudent(int id) {
        return studentDao.get(id);
    }
}
