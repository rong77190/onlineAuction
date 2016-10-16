package com.auction.service.imp;

import com.auction.dao.UserMapper;
import com.auction.model.Good;
import com.auction.model.User;
import com.auction.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

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

    public User userInfo(int userId){return userMapper.userSelect(userId);}

    public int backDepositToUser(int userId, double price) {
        return userMapper.backDepositToUser(userId,price);
    }

    public List<User> selectAll() {
        return userMapper.selectAll();
    }

    public int add(User user) {
        return userMapper.insertSelective(user);
    }

    public int update(User user) {
        return userMapper.updateByPrimaryKeySelective(user);
    }

    public int userUpdate(Integer userId,String userName,String phone,String sex,String birthday,String userEmail){
        User record=new User();
        record.setUserId(userId);
        record.setUserName(userName);
        record.setPhone(phone);
        record.setSex(sex);
        record.setBirthday(birthday);
        record.setUserEmail(userEmail);
        return  userMapper.userUpdateInfo(record);
    }

    public List<User> find(Map<String, Object> map) {
        return userMapper.find(map);
    }

    public Long getTotal(Map<String, Object> map) {
        return userMapper.getTotal(map);
    }

    public int delete(Integer userId) {
        return userMapper.deleteByPrimaryKey(userId);
    }
}
