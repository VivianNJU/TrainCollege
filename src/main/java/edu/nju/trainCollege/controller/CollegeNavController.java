package edu.nju.trainCollege.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("college/")
public class CollegeNavController {
    @RequestMapping("homepage")
    public String homepage(ModelMap model){
        return "/college/homepage";
    }

    @RequestMapping(value = "create_lesson",method = RequestMethod.GET)
    public String createLesson(){
        return "/college/create_lesson";
    }
}
