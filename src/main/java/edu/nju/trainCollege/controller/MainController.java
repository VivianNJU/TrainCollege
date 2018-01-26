package edu.nju.trainCollege.controller;

import com.sun.deploy.util.SessionState;
import edu.nju.trainCollege.model.College;
import edu.nju.trainCollege.model.Student;
import edu.nju.trainCollege.service.CollegeService;
import edu.nju.trainCollege.service.StudentService;
import org.hibernate.service.spi.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpServletRequest;

@Controller
@SessionAttributes({"student"})
public class MainController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private CollegeService collegeService;

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
                if(student.getState()!=1){
                    model.addAttribute("error"," * 该账号未通过邮件认证或已失效");
                    return "index";
                }else{
//                    因为注解，该属性直接添加到session中
                    model.addAttribute("student",student);
                    return "redirect:/student/homepage";
                }

            }else{
                model.addAttribute("error"," * 用户名或密码不正确");
                return "index";
            }
        }
        return "faillll";
    }

    @RequestMapping(value = "student/register", method = RequestMethod.GET)
    public String studentRegister(){
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

    @RequestMapping(value = "college/register", method = RequestMethod.GET)
    public String collegeRegister(){
        return "college/register";
    }

    @RequestMapping(value = "college/register", method = RequestMethod.POST)
    public String addCollege(HttpServletRequest request, ModelMap model){
        String password = request.getParameter("password1");
        if(!password.equals(request.getParameter("password2"))){
            model.addAttribute("error","密码不一致");
            return "college/register";
        }
        College college = new College();
        college.setName(request.getParameter("name"));
        college.setTeacher(request.getParameter("teacher"));
        college.setLocation(request.getParameter("Location"));
        college.setOther(request.getParameter("other"));
        college.setPhone(request.getParameter("phone"));
        college.setPassword(password);


        String id = collegeService.register(college);
        if(id.length()<7){
            model.addAttribute("error","注册失败，请稍后再试");
        }else{
            model.addAttribute("error","注册成功，您的机构编码为:<b>"+id+"</b>，待管理员验证后方可用编码登陆。");
        }
        return "college/register";
    }


    @RequestMapping(value = "student/activate")
    public String activateStudent(HttpServletRequest request, ModelMap model){
        String email = request.getParameter("email");//获取email
        String validateCode = request.getParameter("validateCode");//激活码
        try {
            studentService.processActivate(email , validateCode);//调用激活方法
            model.addAttribute("message","激活成功").addAttribute("title",":)");
        } catch (ServiceException e) {
            model.addAttribute("message",e.getMessage()).addAttribute("title",":(");
        }
        return "student/activate";
    }

    @RequestMapping(value = "logout")
    public String logout(SessionStatus status){
        status.setComplete();
        return "redirect:/index";
    }
}
