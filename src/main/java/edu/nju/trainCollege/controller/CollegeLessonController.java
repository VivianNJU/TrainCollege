package edu.nju.trainCollege.controller;

import edu.nju.trainCollege.model.Classes;
import edu.nju.trainCollege.model.College;
import edu.nju.trainCollege.model.Lesson;
import edu.nju.trainCollege.model.MyData;
import edu.nju.trainCollege.service.CollegeService;
import edu.nju.trainCollege.tools.NumberTool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("college/")
public class CollegeLessonController {

    @Autowired
    private CollegeService collegeService;
    private static final SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    @RequestMapping(value = "show_classes",method = RequestMethod.GET)
    public String showClasses(HttpServletRequest request,ModelMap model){
        if(request.getParameter("lid")==null){
            return "redirect:/college/homepage";
        }
        int lid = Integer.parseInt(request.getParameter("lid"));
        Lesson lesson = collegeService.getLessonByLid(lid);
        model.addAttribute("lesson",lesson);
        return "/college/show_classes";
    }

    @RequestMapping(value = "show_students",method = RequestMethod.GET)
    public String showStudentsView(HttpServletRequest request,ModelMap model){
        if(request.getParameter("classId")==null){
            return "redirect:/college/homepage";
        }
        int classId = Integer.parseInt(request.getParameter("classId"));
        Classes classes = collegeService.getClassesById(classId);
        model.addAttribute("classes",classes);
        model.addAttribute("lesson",collegeService.getLessonByLid(classes.getLid()));
        if(request.getParameter("classNo").equals("all")){
            model.addAttribute("classNo",-1);
        }else{
            model.addAttribute("classNo",Integer.parseInt(request.getParameter("classNo")));
        }

        return "/college/show_students";
    }

    @RequestMapping(value = "show_lesson",method = RequestMethod.GET)
    public String showLesson(HttpServletRequest request,ModelMap model){
        if(request.getParameter("lid")==null){
            return "redirect:/college/homepage";
        }
        int lid = Integer.parseInt(request.getParameter("lid"));
        Lesson lesson = collegeService.getLessonByLid(lid);
        switch (lesson.getState()){
            case 0:
                model.addAttribute("lesson_state","未发布");
                break;
            case 1:
                model.addAttribute("lesson_state","已发布，报名中");
                break;
            case 2:
                model.addAttribute("lesson_state","报名截止，已开课");
                break;
            case 3:
                model.addAttribute("lesson_state","已结束");
                break;
        }
        model.addAttribute("lesson",lesson);
        model.addAttribute("classList",collegeService.getClassesByLid(lid));
        return "/college/show_lesson";
    }

    @RequestMapping(value = "change_lesson_state",method = RequestMethod.POST)
    @ResponseBody
    public boolean changeLessonState(HttpServletRequest request){
        try {
            int lid = Integer.parseInt(request.getParameter("lid"));
            Lesson lesson = collegeService.getLessonByLid(lid);
            lesson.setState(Integer.parseInt(request.getParameter("state")));
            collegeService.saveLesson(lesson);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    @RequestMapping(value = "get_class_by_id",method = RequestMethod.POST)
    @ResponseBody
    public Classes getClassById(HttpServletRequest request){
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            return collegeService.getClassesById(id);
        }catch (Exception e){
            e.printStackTrace();
            return new Classes();
        }
    }

    @RequestMapping(value = "delete_class",method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteClass(HttpServletRequest request){
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            collegeService.deleteClass(id);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    @RequestMapping(value = "modify_class",method = RequestMethod.POST)
    public String modifyClass(HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        Classes c;
        if(id>0){
            c = collegeService.getClassesById(id);
        }else{
            c = new Classes();
            c.setLid(Integer.parseInt(request.getParameter("lid")));
        }
        c.setName(request.getParameter("classname"));
        c.setTeacher(request.getParameter("teacher"));
        c.setPrice(Integer.parseInt(request.getParameter("price")));
        c.setNum(Integer.parseInt(request.getParameter("amount")));
        c.setSize(Integer.parseInt(request.getParameter("size")));
        collegeService.saveClass(c);
        return "redirect:/college/show_lesson?lid="+c.getLid();
    }

    @RequestMapping(value = "modify_lesson",method = RequestMethod.POST)
    public String modifyLesson(HttpServletRequest request){
        Lesson lesson = collegeService.getLessonByLid(Integer.parseInt(request.getParameter("lid")));
        lesson.setIntro(request.getParameter("intro"));
        lesson.setName(request.getParameter("name"));
        lesson.setWeekNum(Integer.parseInt(request.getParameter("weeks")));
        lesson.setTimePerWeek(Integer.parseInt(request.getParameter("times")));

        StringBuilder builder = new StringBuilder();
        for(String t:request.getParameterValues("type")){
            builder.append(t).append("/");
        }
        builder.deleteCharAt(builder.lastIndexOf("/"));
        lesson.setType(builder.toString());

        try {
            lesson.setStartDay(df.parse(request.getParameter("date_range").substring(0,10)));
            lesson.setEndDay(df.parse(request.getParameter("date_range").substring(13,23)));
        }catch (ParseException ex){
            ex.printStackTrace();
            lesson.setStartDay(new Date());
            lesson.setEndDay(new Date());
        }
        collegeService.saveLesson(lesson);
        return "redirect:/college/show_lesson?lid="+lesson.getId();
    }

    @RequestMapping(value = "create_lesson",method = RequestMethod.GET)
    public String createLessonView(){
        return "/college/create_lesson";
    }

    @RequestMapping(value = "create_lesson",method = RequestMethod.POST)
    public String createLesson(HttpServletRequest request,ModelMap model){
        Lesson lesson = new Lesson();
        lesson.setIntro(request.getParameter("intro"));
        lesson.setName(request.getParameter("name"));
        lesson.setWeekNum(Integer.parseInt(request.getParameter("weeks")));
        lesson.setTimePerWeek(Integer.parseInt(request.getParameter("times")));
        lesson.setCid(((College)request.getSession().getAttribute("college")).getId());

        StringBuilder builder = new StringBuilder();
        for(String t:request.getParameterValues("type")){
            builder.append(t).append("/");
        }
        builder.deleteCharAt(builder.lastIndexOf("/"));
        lesson.setType(builder.toString());

        try {
            lesson.setStartDay(df.parse(request.getParameter("date_range").substring(0,10)));
            lesson.setEndDay(df.parse(request.getParameter("date_range").substring(13,23)));
        }catch (ParseException ex){
            ex.printStackTrace();
            lesson.setStartDay(new Date());
            lesson.setEndDay(new Date());
        }

        List<Classes> classes = new ArrayList<Classes>(1);
        for(int i = 1;i<=Integer.parseInt(request.getParameter("class_num"));i++){
            Classes c = new Classes();
            c.setName(request.getParameter("classname"+i));
            c.setTeacher(request.getParameter("teacher"+i));
            c.setPrice(Integer.parseInt(request.getParameter("price"+i)));
            c.setNum(Integer.parseInt(request.getParameter("amount"+i)));
            c.setSize(Integer.parseInt(request.getParameter("size"+i)));
            classes.add(c);
        }

        int lid = collegeService.createLessonClass(lesson,classes);
        if(lid!=0){
            return "redirect:/college/show_lesson?lid="+lid;
        }else{
            model.addAttribute("error"," * 填写信息有误，请重新填写");
            return "/college/create_lesson";
        }
    }
}
