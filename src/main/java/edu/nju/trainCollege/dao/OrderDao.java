package edu.nju.trainCollege.dao;

import edu.nju.trainCollege.model.Orders;

import java.util.List;

public interface OrderDao extends BaseDao<Orders,Integer> {
    public List<Orders> getByStateUid(int uid, int state);

    public List<Orders> getByCollegeId(int cid);
}
