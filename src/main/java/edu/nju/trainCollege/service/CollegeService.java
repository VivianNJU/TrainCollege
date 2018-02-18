package edu.nju.trainCollege.service;

import edu.nju.trainCollege.model.Classes;
import edu.nju.trainCollege.model.College;
import edu.nju.trainCollege.model.Lesson;

import java.util.List;

public interface CollegeService {
    public College login(String id, String password);

    public String register(College college);

    public int createLessonClass(Lesson lesson,List<Classes> classes);

    public List<Lesson> getLessonByStateCid(int cid,int state);

    public void saveLesson(Lesson lesson);

    public void saveClass(Classes c);

    public void deleteClass(int cid);

    public Lesson getLessonByLid(int lid);

    public Classes getClassesById(int id);

    public College getCollegeById(int cid);

    public List<Classes> getClassesByLid(int lid);
}
