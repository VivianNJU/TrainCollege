package edu.nju.trainCollege.controller;

import edu.nju.trainCollege.model.Student;
import edu.nju.trainCollege.service.StudentService;
import org.hibernate.service.spi.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class MainController {

    @Autowired
    private StudentService studentService;

    @RequestMapping(value = "index")
    public String index(ModelMap model){
        model.addAttribute("error","<br>");
        return "index";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(HttpServletRequest request, ModelMap model){
//        学员登陆
        if(Integer.parseInt(request.getParameter("type"))==0){
            String email = request.getParameter("id");
            String password = request.getParameter("password");
            Student student = studentService.login(email,password);
            if(student!=null){
                request.getSession().setAttribute("user",student);
                return "student/index";
            }else{
                model.addAttribute("error"," * 用户名或密码不正确");
                return "index";
            }
        }
        return "faillll";
    }

    @RequestMapping(value = "student/register", method = RequestMethod.GET)
    public String studentRegister(ModelMap model){
        model.addAttribute("error","");
        return "student/register";
    }

    @RequestMapping(value = "student/register", method = RequestMethod.POST)
    public String addStudent(HttpServletRequest request, ModelMap model){
        String password = request.getParameter("password1");
        if(!password.equals(request.getParameter("password2"))){
            model.addAttribute("error","密码不一致");
            return "student/register";
        }
        Student student = new Student();
        student.setUsername(request.getParameter("username"));
        student.setEmail(request.getParameter("email"));
        student.setPassword(password);

        if(!studentService.register(student)){
            model.addAttribute("error","邮箱已被注册");
        }else{
            model.addAttribute("error","注册成功，验证邮件已发送至邮箱，请验证后登陆");
        }
        return "student/register";
    }


    @RequestMapping(value = "student/activate", method = RequestMethod.GET)
    public String activateStudent(HttpServletRequest request, ModelMap model){
        String email = request.getParameter("email");//获取email
        String validateCode = request.getParameter("validateCode");//激活码
        try {
            studentService.processActivate(email , validateCode);//调用激活方法
            model.addAttribute("message",":) 激活成功");
        } catch (ServiceException e) {
            model.addAttribute("message",":( "+e.getMessage());
        }
        return "student/activate";
    }
}
