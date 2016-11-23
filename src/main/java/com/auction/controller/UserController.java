package com.auction.controller;

import com.auction.common.BaseController;
import com.auction.model.User;
import com.auction.service.UserService;
import com.auction.util.MyResult;
import org.hibernate.validator.constraints.EAN;
import org.springframework.stereotype.Controller;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by xiechur on 2016/8/25.
 */
@Controller
@RequestMapping(value = "/user")
public class UserController{

    @Resource
    private UserService userService;






    /**
     * 查询用户列表
     */
    @RequestMapping(value = "list")
    @ResponseBody
    public Object selectUser(){
        List<User> userList = userService.selectAll();
        return MyResult.getResult(1,"",userList);
    }

    /**
     * 用户查询个人信息
     */
    @RequestMapping(value = "checkUserInfo")
    @ResponseBody
    public Object checkUserInfo(@RequestParam int userId){
        User user = userService.userInfo(userId);
        return MyResult.getResult(1,"",user);
    }

    //跳转到添加用户页面
    @RequestMapping(value = "toAdd", method = RequestMethod.GET)
    public ModelAndView toAddUser(HttpServletRequest request) {
        return new ModelAndView("user/user_add");
    }

    /**
     * 添加用户
     */
    @RequestMapping(value = "add")
    @ResponseBody
    public Object addUser(User user) {
//        if ()
        userService.add(user);
//        return "redirect:/user/list";
        return MyResult.getResult(1,"","");
    }


    //跳转到添加用户页面
    @RequestMapping(value = "toUpdate", method = RequestMethod.GET)
    public ModelAndView toUpdateUser(HttpServletRequest request) {
        return new ModelAndView("user/user_update");
    }


    /**
     * 修改用户
     */
    @RequestMapping(value = "update")
    @ResponseBody
    public Object updateUser(User user) {
        userService.update(user);
//        return "redirect:/user/list";
        return MyResult.getResult(1,"",user);
    }


    /**
     * 用户修改个人信息
     */
//    @RequestMapping(value = "updateUserInfo")
//    @ResponseBody
//    public Object updateUserInfo(User user) {
//        userService.userUpdate(Integer userId,String userName,String phone,String sex,String birthday,String userEmail);
//        return MyResult.getResult(1,"",user);
//    }




}
