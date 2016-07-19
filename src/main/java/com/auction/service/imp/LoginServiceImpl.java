package com.auction.service.imp;

import com.auction.dao.UserMapper;
import com.auction.model.Login;
import com.auction.model.User;
import com.auction.service.LoginService;
import com.auction.util.ValidCodeGenerator;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by dell on 2016/7/19.
 */
@Service
public class LoginServiceImpl implements LoginService{

    @Resource
    private UserMapper userMapper;
    @Resource
    private ValidCodeGenerator validCodeGenerator;

    public User login(Login login, HttpSession session) {
        String userName = login.getUserName();
        String password = login.getPassword();
        return userMapper.login(userName,password);
    }

    /**
     * 生成新的登陆验证码
     * @param request
     * @param response
     * @param session
     */
    public void generateNewValidCode(HttpServletRequest request, HttpServletResponse response, HttpSession session){
        String validCode=validCodeGenerator.getRandcode(request,response);
        session.setAttribute("loginValidCode",validCode);
    }
}
