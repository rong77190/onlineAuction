package com.auction.dao;

import com.auction.model.Deposit;
import org.springframework.stereotype.Repository;

@Repository
public interface DepositMapper {
    int deleteByPrimaryKey(Integer depositId);

    int insert(Deposit record);

    int insertSelective(Deposit record);

    Deposit selectByPrimaryKey(Integer depositId);

    int updateByPrimaryKeySelective(Deposit record);

    int updateByPrimaryKey(Deposit record);
}