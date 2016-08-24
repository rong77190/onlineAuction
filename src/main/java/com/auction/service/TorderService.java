package com.auction.service;

import com.auction.model.Torder;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public interface TorderService {

    public Torder getTorder(int orderId);

    public List<Torder> getUserAllTorders(int userId);
    public List<Torder> getAllTorders();

    public void createTorder(int userId, int goodId,BigDecimal orderPrice,int orderState,int payWay);

    public void deleteTorder(int orderId);

    public void updateTorder(int orderId,int goodId, BigDecimal orderPrice,int orderState,int payWay);

    public Date getTime();
}
