package com.auction.dao;

import com.auction.model.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    int pay(@Param("userId")int userId, @Param("price") double price);

    int backDepositToUser(@Param("userId")int userId,@Param("price") double price);
}