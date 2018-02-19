package edu.nju.trainCollege.dao;

import edu.nju.trainCollege.model.Attendance;
import edu.nju.trainCollege.model.LessonProgress;

import java.util.List;

public interface LessonProDao extends BaseDao<LessonProgress,Integer> {
    public List<LessonProgress> getByOrderId(int oid);

    public List<LessonProgress> getByUidState(String uid,int state);

    public List<LessonProgress> getByCollegeId(int cid);

    public void saveAttendance(Attendance attendance);

    public List<Attendance> getAttdByLessonProId(int lessonProId);

    /**
     * 默认搜索状态为已支付的报名，若班号为负，即为搜索所有班号
     * @param classId 班级ID
     * @param classNo 班号
     * @return
     */
    public List<LessonProgress> getByClassIdNo(int classId,int classNo);
}
