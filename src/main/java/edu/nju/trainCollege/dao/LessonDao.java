package edu.nju.trainCollege.dao;

import edu.nju.trainCollege.model.Lesson;

import java.util.Date;
import java.util.List;

public interface LessonDao extends BaseDao<Lesson,Integer>  {
    public List<Lesson> getByCollegeId(int cid);

    public List<Lesson> getByName(String name);

    public List<Lesson> getByLessonType(String type);

    public List<Lesson> getBetweenDates(Date start, Date end);
}
