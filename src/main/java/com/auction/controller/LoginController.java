package com.auction.controller;

import com.auction.model.Login;
import com.auction.model.User;
import com.auction.service.LoginService;
import com.auction.util.MyResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by dell on 2016/7/19.
 */
@Controller
@RequestMapping("/login")
public class LoginController {
    @Resource
    private LoginService loginService;

    @RequestMapping("login")
    @ResponseBody
    public Object login(Login login, HttpServletRequest request){
        HttpSession session = request.getSession(false);
        if(!checkValidCode(login,session)){
            System.out.println("验证码错误");
            return MyResult.getResult(0,"验证码错误","");
        }else {
            User user = loginService.login(login,session);
            if (user==null){
                return MyResult.getResult(0,"用户名或密码错误","");
            }else {
                return MyResult.getResult(1,"",user);
            }
        }
    }


    @RequestMapping("/getNewValidCode")
    public void getNewValidCode(HttpSession session, HttpServletRequest request, HttpServletResponse response){
        loginService.generateNewValidCode(request,response,session);
    }



    /**
     * 检查登陆验证码
     * @param login
     * @param session
     * @return
     */
    private boolean checkValidCode(Login login, HttpSession session){
        String checkedValidCode=login.getValidCode();
        String realValidCode=(String)session.getAttribute("loginValidCode");
        // session.removeAttribute(KEY_VALID_CODE);
        return realValidCode!=null&&realValidCode.equalsIgnoreCase(checkedValidCode);
    }
}
