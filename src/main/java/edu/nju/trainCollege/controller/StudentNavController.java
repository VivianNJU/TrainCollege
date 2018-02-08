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

    @RequestMapping(value = "enroll_lesson_with_class",method = RequestMethod.POST)
    public String enrollLesson(HttpServletRequest request){
        int studentNum = Integer.parseInt(request.getParameter("studentNum"));
        Orders orders = new Orders();
//        orders.setUid(((Student) request.getSession().getAttribute("student")).getId());
        orders.setUid(1);
        List<LessonProgress> progresses = new ArrayList<LessonProgress>(studentNum);

        for(int i = 1;i<=studentNum;i++){
            LessonProgress lp = new LessonProgress();
            if(request.getParameter("type"+i).equals("1")){
//                是会员
                lp.setUid(Integer.toString(studentService.getStudentByEmail(request.getParameter("id"+i)).getId()));
            }else{
                NormalStudent ns = studentService.getNmStudent(request.getParameter("id"+i),request.getParameter("phone"+i));
                lp.setUid("x"+ns.getId());
            }
            lp.setClassId(Integer.parseInt(request.getParameter("classId"+i)));
            progresses.add(lp);
        }

        studentService.enrollLesson(orders,progresses);
        return "/student/homepage";
    }

    @RequestMapping(value = "enroll_lesson_with_class",method = RequestMethod.GET)
    public String enrollLessonWithClassView(HttpServletRequest request,ModelMap model){
        if(request.getParameter("lid")==null){
            return "redirect:/student/all_lessons";
        }
        int lid = Integer.parseInt(request.getParameter("lid"));
        Lesson lesson = studentService.getLessonByLid(lid);
        model.addAttribute("lesson",lesson);
        model.addAttribute("classList",studentService.getClassesByLid(lid));

        return "student/enroll_lesson_with_class";
    }

    @RequestMapping(value = "enroll_lesson_without",method = RequestMethod.GET)
    public String enrollLessonWithoutView(HttpServletRequest request,ModelMap model){
        if(request.getParameter("lid")==null){
            return "redirect:/student/all_lessons";
        }
        int lid = Integer.parseInt(request.getParameter("lid"));
        Lesson lesson = studentService.getLessonByLid(lid);
        model.addAttribute("lesson",lesson);
        model.addAttribute("classList",studentService.getClassesByLid(lid));

        return "student/enroll_lesson_without";
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
