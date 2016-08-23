package com.auction.controller;

import com.auction.model.Manager;
import com.auction.service.ManagerService;
import com.auction.util.MyResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by dell on 2016/8/20.
 */
@Controller
@RequestMapping("manage")
public class ManageController {
    @Resource
    private ManagerService managerService;


    /**
     * 管理员登陆
     * @param manager
     * @param request
     * @return
     */
    @RequestMapping("login")
    @ResponseBody
    public Object manageLogin(Manager manager,HttpServletRequest request){
        HttpSession session = request.getSession(false);
        manager = managerService.login(manager);
        if (manager == null){
            return MyResult.getResult(0,"用户名或密码错误","");
        }else {
            session.setAttribute("manager",manager);
            return MyResult.getResult(1,"",manager);
        }
    }


    /**
     * 管理员登出
     * @param session
     * @return
     */
    @RequestMapping("/logout")
    @ResponseBody
    public Object logout(HttpSession session){
        session.removeAttribute("manager");
        return MyResult.getResult();
    }



}
