package com.auction.service;

import com.auction.model.Good;

/**
 * Created by xiechur on 2016/8/22.
 */
public interface GoodService {
    Good findGoodById(int goodId);
    int updateState(Good good);
}
