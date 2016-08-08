package com.auction.dao;

import com.auction.model.User;
import org.apache.ibatis.annotations.Param;

/**
 * Created by dell on 2016/7/19.
 */
public interface LoginMapper {
    public User login(@Param("userName")String userName, @Param("password")String password);
}
