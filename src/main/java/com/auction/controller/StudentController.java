package com.auction.controller;

import com.auction.model.Student;
import com.auction.service.StudentService;
import com.auction.util.MyResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping(value = "/student")
public class StudentController {
    @Resource
    private StudentService studentService;

    @RequestMapping("show")
    @ResponseBody
    public Object show(Student student){
        System.out.println(student);
        student = studentService.getStudent(student.getId());
        System.out.println(student);
        return MyResult.getResult(1,"",student);
    }
}
