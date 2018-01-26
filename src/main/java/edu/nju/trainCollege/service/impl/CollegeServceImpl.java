package edu.nju.trainCollege.service.impl;

import edu.nju.trainCollege.dao.CollegeDao;
import edu.nju.trainCollege.model.College;
import edu.nju.trainCollege.service.CollegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CollegeServceImpl implements CollegeService{
    @Autowired
    private CollegeDao collegeDao;

    private static final String ID_FORMATTER = "%07";

    public College login(String id, String password) {
        if(id.length()<7)
            return null;
        try{
            int cid = Integer.parseInt(id);
            return collegeDao.getByIdPwd(cid,password);
        }catch (Exception ex){
            return null;
        }
    }

    public String register(College college) {
        try{
            int id = collegeDao.save(college);
            return String.format(ID_FORMATTER,id);
        }catch (Exception e){
            return "";
        }

    }
}
