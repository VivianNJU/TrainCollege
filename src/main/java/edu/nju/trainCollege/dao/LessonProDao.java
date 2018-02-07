package edu.nju.trainCollege.dao;

import edu.nju.trainCollege.model.LessonProgress;

import java.util.List;

public interface LessonProDao extends BaseDao<LessonProgress,Integer> {
    public List<LessonProgress> getByOrderId(int oid);

    public List<LessonProgress> getByUserId(String uid);

    public List<LessonProgress> getByCollegeId(int cid);

    public List<LessonProgress> getByClassIdNo(int classId,int classNo);
}
