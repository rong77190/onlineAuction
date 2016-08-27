package com.auction.controller;

import com.auction.common.SpringMvcActionContext;
import com.auction.model.Student;
import com.auction.service.StudentService;
import com.auction.util.MyResult;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping(value = "/student")
public class StudentController extends SpringMvcActionContext {
    @Resource
    private StudentService studentService;
//可以运行在本地服务器 用url 请求；     http://localhost:8080/student/show?id=1 然后返回json格式的数据
    @RequestMapping("/show")
    @ResponseBody
    public Object show(Student student){
//        System.out.println(student);
        student = studentService.getStudent(student.getId());
//        System.out.println(student);
        getSession().setAttribute("student",student);
        return MyResult.getResult(1,"",student);
    }

    /**
     * @param model
     * @return
     */
    @RequestMapping(value = "info")
    public String info(Model model) {
//        model.addAttribute("message", "保存用户信息成功");
        Student student = (Student)getSession().getAttribute("student");
        model.addAttribute("student", student);
        return "/index";
    }
}
