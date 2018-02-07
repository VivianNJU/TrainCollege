package edu.nju.trainCollege.service.impl;

import edu.nju.trainCollege.dao.ClassesDao;
import edu.nju.trainCollege.dao.CollegeDao;
import edu.nju.trainCollege.dao.LessonDao;
import edu.nju.trainCollege.model.Classes;
import edu.nju.trainCollege.model.College;
import edu.nju.trainCollege.model.Lesson;
import edu.nju.trainCollege.service.CollegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CollegeServceImpl implements CollegeService{
    @Autowired
    private CollegeDao collegeDao;
    @Autowired
    private ClassesDao classesDao;
    @Autowired
    private LessonDao lessonDao;

    private static final String ID_FORMATTER = "%07d";

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
            if(id==0)
                return "";
            return String.format(ID_FORMATTER,id);
        }catch (Exception e){
            e.printStackTrace();
            return "";
        }

    }

    public int createLessonClass(Lesson lesson, List<Classes> classes) {
        int lid = lessonDao.save(lesson);
        if(lid==0)
            return 0;
        else{
            for(Classes c:classes){
                c.setLid(lid);
                classesDao.save(c);
            }
        }
        return lid;
    }

    public List<Lesson> getLessonByStateCid(int cid, int state) {
        List<Lesson> result =lessonDao.getByLessonStateCid(cid,state);
        if(result==null){
            return new ArrayList<Lesson>(0);
        }else
            return result;
    }

    public void saveLesson(Lesson lesson) {
        if(lesson.getId()<1){
            return;
        }
        lessonDao.saveOrUpdate(lesson);
    }

    public void saveClass(Classes c) {
        if(c.getLid()<1){
            return;
        }
        classesDao.saveOrUpdate(c);
    }

    public void deleteClass(int cid) {
        classesDao.delete(cid);
    }

    public Lesson getLessonByLid(int lid) {
        return lessonDao.get(lid);
    }

    public Classes getClassesById(int id) {
        return classesDao.get(id);
    }

    public List<Classes> getClassesByLid(int lid) {
        return classesDao.getByLessonId(lid);
    }
}
