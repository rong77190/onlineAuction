package com.auction.controller;

import com.auction.model.Login;
import com.auction.model.Register;
import com.auction.model.User;
import com.auction.service.LoginService;
import com.auction.util.MyResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
    String seedStr="0123456789";
    int validCodeLength=6;

    @Resource
    private LoginService loginService;


    /**
     * 登录
     * @param login
     * @param request
     * @return
     */
    @RequestMapping("login")
    @ResponseBody
    public Object login(Login login, HttpServletRequest request){
        HttpSession session = request.getSession(false);
        String loginValidCode =(String) session.getAttribute("loginValidCode");
        System.out.println("session中的validCode："+loginValidCode);
        if(!checkValidCode(login.getValidCode(),loginValidCode)){
            System.out.println("验证码错误");
            return MyResult.getResult(0,"验证码错误","");
        }else {
            User user = loginService.login(login);
            if (user==null){
                return MyResult.getResult(0,"用户名或密码错误","");
            }else {
                session.setAttribute("user",user);
                return MyResult.getResult(1,"",user);
            }
        }
    }


    /**
     * 注册
     * @param register
     * @param request
     * @return
     */
    @RequestMapping("register")
    @ResponseBody
    public Object register(Register register, HttpServletRequest request){
        HttpSession session = request.getSession(false);
        String registerValidCode = (String) session.getAttribute("registerValidCode");
        System.out.println("session 中register valid code:"+registerValidCode);
        if(!checkValidCode(register.getValidCode(),registerValidCode)){
            System.out.println("验证码错误");
            return MyResult.getResult(0,"验证码错误","");
        }
        int result = loginService.register(register);
        if (result >= 0){
            return MyResult.getResult(1,"注册成功","");
         }else {
            return MyResult.getResult(0,"注册失败","");
        }
    }


    /**
     * 注册时发送验证码到邮箱
     * @param userEmail
     * @param request
     * @return
     */
    @RequestMapping("sendEmail")
    @ResponseBody
    public Object sendSMS(@RequestParam("userEmail") String userEmail,HttpServletRequest request){
//        System.out.println(userEmail);
        HttpSession session = request.getSession(false);
        String registerValidCode = RegisterValidCode(validCodeLength);//
//        System.out.println("registercode"+registerValidCode);
        session.setAttribute("registerValidCode",registerValidCode);
//        System.out.println("session::"+session.getAttribute("registerValidCode").toString());
        return loginService.SendValidCodeToEmail(userEmail,session);
    }



    /**
     * 获取登录验证码
     * @param response
     * @param request
     * @param session
     */
    @RequestMapping("/getNewValidCode")
    public void getNewValidCode(HttpSession session, HttpServletRequest request, HttpServletResponse response){
        loginService.generateNewValidCode(request,response,session);
    }


    /**
     * 登出
     * @param session
     * @return
     */
    @RequestMapping("/logout")
    @ResponseBody
    public Object logout(HttpSession session){
        session.removeAttribute("user");
        return MyResult.getResult();
    }

    /**
     * 检查登陆验证码
     * @param login
     * @param session
     * @return
     */
//    private boolean checkLoginValidCode(Login login, HttpSession session){
//        String checkedValidCode=login.getValidCode();
//        String realValidCode=(String)session.getAttribute("loginValidCode");
//        // session.removeAttribute(KEY_VALID_CODE);
//        return realValidCode!=null&&realValidCode.equalsIgnoreCase(checkedValidCode);
//    }


    /**
     * 检查验证码
     * @param validCode
     * @param sessionValidCode
     * @return
     */
    private boolean checkValidCode(String validCode,String sessionValidCode){
        return sessionValidCode!=null&&sessionValidCode.equalsIgnoreCase(validCode);
    }


    /**
     * 生成随机验证码
     * @return
     */
    private String RegisterValidCode(int size){
        StringBuffer sb=new StringBuffer();
        int len=seedStr.length();
        for(int i=0;i<size;i++){
            char c=seedStr.charAt((int)(Math.random()*len));
            sb.append(c);
        }
        return sb.toString();
    }

}
