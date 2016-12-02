package com.auction.service;

import com.auction.bean.OrderBean;
import com.auction.model.Good;
import com.auction.model.Torder;

import java.util.Date;
import java.util.List;
import java.util.Map;

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

    //管理模块的订单
    /**
     * 订单查询
     * @param map
     * @return
     */
    public List<OrderBean> find(Map<String, Object> map);
    /**
     * 获取总记录数
     * @param map
     * @return
     */
    public Long getTotal(Map<String, Object> map);

    /**
     * 可选修改
     * @param torder
     * @return
     */
    public int update(Torder torder);

    public int addOrder(Torder torder);
}
