package com.auction.dao;

import com.auction.model.Register;
import com.auction.model.User;
import org.apache.ibatis.annotations.Param;

/**
 * Created by dell on 2016/7/19.
 */
public interface LoginMapper {
    public User login(@Param("userName") String userName, @Param("password") String password);
//    public Register register(@Param("userName")String userName, @Param("password")String password,@Param("userEmail")String userEmail);
    int register(Register register);
    int updatePassword(@Param("userId") int userId, @Param("password") String password);
}
