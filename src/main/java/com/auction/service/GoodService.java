package com.auction.service;

import com.auction.model.Good;

import java.util.List;

/**
 * Created by xiechur on 2016/8/22.
 */
public interface GoodService {
    Good findGoodById(int goodId);
    int updateState(Good good);

    public List<Good> searchGoodByKey(String key);

    public int addGood(Good record);

    public int updateGood(Good good);

    List<Good> getAllGood();

    List<Good> getAuctioningGood();

    List<Good> getNotAudit();

}
