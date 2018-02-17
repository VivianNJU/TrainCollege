package edu.nju.trainCollege.controller;

import edu.nju.trainCollege.model.*;
import edu.nju.trainCollege.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("student/")
@SessionAttributes({"student"})
public class StudentNavController {
    @Autowired
    private StudentService studentService;

    @RequestMapping("homepage")
    public String homepage(ModelMap model){
        return "/student/homepage";
    }

    @RequestMapping(value = "get_student_by_email",method = RequestMethod.POST)
    @ResponseBody
    public boolean getStudentByEmail(HttpServletRequest request){
        String email = request.getParameter("email");
        return (studentService.getStudentByEmail(email)!=null);
    }

    @RequestMapping(value = "show_lesson",method = RequestMethod.GET)
    public String showLessonsView(HttpServletRequest request,ModelMap model){
        if(request.getParameter("lid")==null){
            return "redirect:/student/all_lessons";
        }
        int lid = Integer.parseInt(request.getParameter("lid"));
        Lesson lesson = studentService.getLessonByLid(lid);
        model.addAttribute("college",studentService.getCollegeById(lesson.getCid()));
        model.addAttribute("lesson",lesson);
        model.addAttribute("classList",studentService.getClassesByLid(lid));

        return "/student/show_lesson";
    }

    @RequestMapping(value = "all_lessons",method = RequestMethod.GET)
    public String allLessonsView(){
        return "/student/all_lessons";
    }

    @RequestMapping(value = "all_lessons",method = RequestMethod.POST)
    @ResponseBody
    public MyData getAllLessons(){
        return new MyData(studentService.getLessons());
    }
}
