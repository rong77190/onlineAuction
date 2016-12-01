package com.auction.dao;

import com.auction.model.AuctionLog;

public interface AuctionLogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AuctionLog record);

    int insertSelective(AuctionLog record);

    AuctionLog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AuctionLog record);

    int updateByPrimaryKey(AuctionLog record);
}