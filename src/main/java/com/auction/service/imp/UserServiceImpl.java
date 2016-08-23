package com.auction.service.imp;

import com.auction.dao.UserMapper;
import com.auction.model.User;
import com.auction.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by xiechur on 2016/8/22.
 */
@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;
    public int pay(int userId, double price) {
        return userMapper.pay(userId,price);
    }

    public User findById(int userId) {
        return userMapper.selectByPrimaryKey(userId);
    }
}
