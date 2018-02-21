package edu.nju.trainCollege.controller;

import edu.nju.trainCollege.model.*;
import edu.nju.trainCollege.service.CollegeService;
import edu.nju.trainCollege.service.StudentService;
import edu.nju.trainCollege.tools.NumberTool;
import org.hibernate.service.spi.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@SessionAttributes({"student","college"})
@RequestMapping("college/")
public class CollegeNavController {

    @Autowired
    private CollegeService collegeService;

    @Autowired
    private StudentService studentService;

    @RequestMapping("homepage")
    public String homepage(ModelMap model){
        return "/college/homepage";
    }

    @RequestMapping(value = "all_lessons",method = RequestMethod.GET)
    public String allLessonView(){
        return "/college/all_lessons";
    }

    @RequestMapping(value = "release_lessons",method = RequestMethod.GET)
    public String releaseLessonView(){
        return "/college/release_lessons";
    }

    @RequestMapping(value = "unrelease_lessons",method = RequestMethod.GET)
    public String unreleaseLessonView(){
        return "/college/unrelease_lessons";
    }

    @RequestMapping(value = "begin_lessons",method = RequestMethod.GET)
    public String beginLessonView(){
        return "/college/begin_lessons";
    }

    @RequestMapping(value = "get_lessons_by_state",method = RequestMethod.POST)
    @ResponseBody
    public MyData getLessonsByState(HttpServletRequest request){
        int state = Integer.parseInt(request.getParameter("state"));
        int cid = ((College)request.getSession().getAttribute("college")).getId();
        return new MyData(collegeService.getLessonByStateCid(cid,state));
    }

    @RequestMapping(value = "enroll_lesson",method = RequestMethod.GET)
    public String enrollLessonView(HttpServletRequest request,ModelMap model){
        int cid = ((College)request.getSession().getAttribute("college")).getId();
        model.addAttribute("lessonList",collegeService.getLessonByStateCid(cid,1));
        return "/college/enroll_lesson";
    }

    @RequestMapping(value = "enroll_offline",method = RequestMethod.POST)
    public String enrollWithClass(HttpServletRequest request){
        Orders orders = new Orders();
        orders.setLid(Integer.parseInt(request.getParameter("lid")));
        LessonProgress lp = new LessonProgress();

        if(request.getParameter("type").equals("1")){
//                是会员
            int uid = studentService.getStudentByEmail(request.getParameter("id")).getId();
            lp.setUid(Integer.toString(uid));
            orders.setUid(uid);
        }else{
            NormalStudent ns = studentService.getNmStudent(request.getParameter("id"),request.getParameter("phone"));
            lp.setUid("x"+ns.getId());
            orders.setUid(0);
        }
        orders.setCid(((College) request.getSession().getAttribute("college")).getId());
        lp.setClassId(Integer.parseInt(request.getParameter("classId")));
        lp.setCid(orders.getCid());

//        try {
            collegeService.enrollLesson(orders,lp);
            return "redirect:/college/homepage";
//        }catch (ServiceException ex){
//            return "redirect:/college/error?reason="+ex.getMessage();
//        }
    }

}
