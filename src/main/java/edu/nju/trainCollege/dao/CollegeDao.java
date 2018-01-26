package edu.nju.trainCollege.dao;

import edu.nju.trainCollege.model.College;

public interface CollegeDao extends BaseDao<College,Integer> {
    public College getByIdPwd(int id, String password);

}
