package com.auction.dao;

import com.auction.model.Manager;

public interface ManagerMapper {
    int deleteByPrimaryKey(Integer sysUserId);

    int insert(Manager record);

    int insertSelective(Manager record);

    Manager selectByPrimaryKey(Integer sysUserId);

    int updateByPrimaryKeySelective(Manager record);

    int updateByPrimaryKey(Manager record);
}