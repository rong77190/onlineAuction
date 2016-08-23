package com.auction.dao;

import com.auction.model.Deposit;
import org.apache.ibatis.annotations.Param;

public interface DepositMapper {
    int deleteByPrimaryKey(Integer depositId);

    int insert(Deposit record);

    int insertSelective(Deposit record);

    Deposit selectByPrimaryKey(Integer depositId);

    int updateByPrimaryKeySelective(Deposit record);

    int updateByPrimaryKey(Deposit record);

    //补充
    Deposit checkDepositState(@Param("userId")int  userId,@Param("goodId")int goodId);
}