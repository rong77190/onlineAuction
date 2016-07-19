package com.auction.service;

import com.auction.model.Login;
import com.auction.model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by dell on 2016/7/19.
 */
public interface LoginService {
    public User login(Login login, HttpSession session);


    public void generateNewValidCode(HttpServletRequest request, HttpServletResponse response, HttpSession session);
}
