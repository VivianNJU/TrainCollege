package edu.nju.trainCollege.controller;

import edu.nju.trainCollege.model.Student;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("student/")
@SessionAttributes({"student"})
public class StudentNavController {
    @RequestMapping("homepage")
    public String homepage(ModelMap model){
        return "/student/homepage";
    }
}
