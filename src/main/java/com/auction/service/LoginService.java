package com.auction.service;

import com.auction.model.Login;
import com.auction.model.Register;
import com.auction.model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by dell on 2016/7/19.
 */
public interface LoginService {
    //登录
    public User login(Login login);

    //获取登录验证码
    public void generateNewValidCode(HttpServletRequest request, HttpServletResponse response, HttpSession session);

    //发送到邮箱的注册验证码
    public Object SendValidCodeToEmail(String userEmail , HttpSession session);

    //注册
    public int register(Register register);

    public int updatePassword(int userId,String password);

    public Object SendResetValidCodeToEmail(String userEmail , HttpSession session);

    public int  duplicateNameChecking(String userName);

    public int  duplicateEmailChecking(String userEmail);
}
