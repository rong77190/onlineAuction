package com.auction.service;

import com.auction.model.Torder;

import java.util.Date;
import java.util.List;

public interface TorderService {

    public Torder getTorder(int orderId);

    public List<Torder> getUserAllTorders(int userId);
    public List<Torder> getAllTorders();

    public void createTorder(int userId, int goodId,Double orderPrice,int orderState,int payWay);

    public void deleteTorder(int orderId);

    public void updateTorder(int orderId,int goodId, Double orderPrice,int orderState,int payWay);

    public int getbuyerinfo(int orderId);

    public int getsellerinfo(int orderId);

    public Date getTime();
}
