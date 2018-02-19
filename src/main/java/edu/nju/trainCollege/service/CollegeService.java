package edu.nju.trainCollege.service;

import edu.nju.trainCollege.model.*;
import org.hibernate.service.spi.ServiceException;

import java.util.List;

public interface CollegeService {
    public College login(String id, String password);

    public String register(College college);

    public int createLessonClass(Lesson lesson,List<Classes> classes);

    public void enrollLesson(Orders order, LessonProgress progress)throws ServiceException;

    public List<LessonProgress> getLessonProByClassIdNo(int classId, int classNo);

    public List<Lesson> getLessonByStateCid(int cid,int state);

    public void saveLesson(Lesson lesson);

    public void saveClass(Classes c);

    public void deleteClass(int cid);

    public Lesson getLessonByLid(int lid);

    public Classes getClassesById(int id);

    public College getCollegeById(int cid);

    public List<Classes> getClassesByLid(int lid);
}
