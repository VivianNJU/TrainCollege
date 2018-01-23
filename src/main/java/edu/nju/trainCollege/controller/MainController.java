package edu.nju.trainCollege.controller;

import edu.nju.trainCollege.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class MainController {

    @Autowired
    private StudentService studentService;

    @RequestMapping(value = "index")
    public String index(){
        return "index";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    @ResponseBody
    public String login(HttpServletRequest request){
//        学员登陆
        if(Integer.parseInt(request.getParameter("type"))==0){
            String email = request.getParameter("id");
            String password = request.getParameter("password");
            return studentService.login(email,password);
        }
        return "faillll";
    }

    @RequestMapping(value = "register", method = RequestMethod.GET)
    @ResponseBody
    public String register(){
        return "success!";
    }
}
