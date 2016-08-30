package com.auction.controller;

import com.auction.common.SpringMvcActionContext;
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
public class LoginController extends SpringMvcActionContext {
    String seedStr="0123456789";
    int validCodeLength=6;

    @Resource
    private LoginService loginService;



    @RequestMapping(value = "")
    public String toLogin(){
        return "/login";
    }

    /**
     * 登录
     * @param login
     * @return
     */
    @RequestMapping(value = "/login")
    @ResponseBody
    public Object login(Login login){
        HttpSession session = getSession();
//        String loginValidCode =(String) session.getAttribute("loginValidCode");
//        System.out.println("session中的validCode  "+loginValidCode);
//        if(!checkValidCode(login.getValidCode(),loginValidCode)){
//            System.out.println("验证码错误");
//            return MyResult.getResult(0,"验证码错误","");
//        }else {
            User user =null;
            user = loginService.login(login);
            System.out.println(user.toString());
            if (user==null){
                return MyResult.getResult(0,"用户名或密码错误","");
            }else {
                session.setAttribute("user",user);
                System.out.println(
                        "session 中的user"+session.getAttribute("user")
                );
                return MyResult.getResult();
            }
//        }
    }


    /**
     * 注册
     * @param register
     * @return
     */
    @RequestMapping(value = "register")
    @ResponseBody
    public Object register(Register register){
        HttpSession session = getSession();
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
     * @return
     */
    @RequestMapping(value = "sendEmail")
    @ResponseBody
    public Object sendSMS(@RequestParam("userEmail") String userEmail){
//        System.out.println(userEmail);
        HttpSession session = getSession();
        String registerValidCode = RegisterValidCode(validCodeLength);//
//        System.out.println("registercode"+registerValidCode);
        session.setAttribute("registerValidCode",registerValidCode);
//        System.out.println("session::"+session.getAttribute("registerValidCode").toString());
        return loginService.SendValidCodeToEmail(userEmail,session);
    }



    /**
     * 获取登录验证码
     */
    @RequestMapping(value = "/getNewValidCode")
    public void getNewValidCode(HttpServletRequest request, HttpServletResponse response, HttpSession session){
        loginService.generateNewValidCode(request,response,session);
    }

//    @RequestMapping
    /**
     * 登出
     * @return
     */
    @RequestMapping(value = "/logout")
    @ResponseBody
    public Object logout(){
//        User user = (User)getSession().getAttribute("user");
//        System.out.println(user.toString());
        getSession().removeAttribute("user");
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

    /**
     * 忘记密码发送验证码大到邮箱
     * @return
     */
    @RequestMapping(value = "sendResetValidCode")
    @ResponseBody
    public Object sendResetValidCode(@RequestParam("userEmail") String userEmail){
        if (userEmail==null || userEmail == ""){
            return MyResult.getResult(0,"邮箱不能为空","");
        }else {
//            User user = (User) session.getAttribute("user");
            String resetValidCode = RegisterValidCode(validCodeLength);//
            System.out.println(resetValidCode);
            getSession().setAttribute("resetValidCode",resetValidCode);
//            System.out.println(session.getAttribute("resetValidCode").toString());
            return loginService.SendResetValidCodeToEmail(userEmail,getSession());
        }
    }

    /**
     * 忘记密码
     * @return
     */
    @RequestMapping(value = "resetPassword")
    @ResponseBody
    public Object resetPassword(@RequestParam("resetValidCode") String resetValidCode, @RequestParam("password") String password, HttpServletRequest request){
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        if (user ==null){
            return MyResult.getResult(0,"未登录,请前往登录","");
        }
//        System.out.println(user.toString());
        int userId = user.getUserId();
        if (resetValidCode.equals(session.getAttribute("resetValidCode").toString())){
            int result = loginService.updatePassword(userId,password);
            if (result > 0){
                return MyResult.getResult();
            }else {
                return MyResult.getResult(0,"重设密码失败","");
            }
        }else {
            return MyResult.getResult(0,"验证码不正确","");
        }
    }


}
