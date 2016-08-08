package com.auction.dao;

import com.auction.model.Torder;

public interface TorderMapper {
    int deleteByPrimaryKey(Integer orderId);

    int insert(Torder record);

    int insertSelective(Torder record);

    Torder selectByPrimaryKey(Integer orderId);

    int updateByPrimaryKeySelective(Torder record);

    int updateByPrimaryKey(Torder record);
}