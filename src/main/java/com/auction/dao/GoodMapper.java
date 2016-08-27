package com.auction.dao;

import com.auction.model.Good;
import org.apache.ibatis.annotations.Param;

public interface GoodMapper {
    int deleteByPrimaryKey(Integer goodId);

    int insert(Good record);

    int insertSelective(Good record);

    Good selectByPrimaryKey(Integer goodId);

    int updateByPrimaryKeySelective(Good record);

    int updateByPrimaryKey(Good record);

    //更新当前价
    int updateCurrPrice(@Param("buyerId")int buyerId,@Param("goodId")int goodId,@Param("currPrice")double currPrice);
}