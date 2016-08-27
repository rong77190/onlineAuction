package com.auction.service.imp;

import com.auction.dao.TorderMapper;
import com.auction.model.Torder;
import com.auction.model.Good;
import com.auction.service.TorderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;


@Service
public class TorderServiceImpl implements TorderService {

    @Resource
    private TorderMapper torderMapper;

    public Date getTime() {
        return new Date();
    }

    public Torder getTorder(int orderId){
        return torderMapper.selectByPrimaryKey(orderId);
    }
    public List<Torder> getAllTorders()
    {
        return torderMapper.selectAll();
    }

    public List<Torder> getUserAllTorders(int userId){
        List<Torder> torders=torderMapper.selectByUserId(userId);
        return torders;
    }
    public void createTorder(int userId,int goodId, Double orderPrice, int orderState, int payWay){
        Torder torder=new Torder();
        torder.setUserId(userId);
        torder.setGoodId(goodId);
        torder.setCreateTime(getTime());
        torder.setUpdateTime(getTime());
        torder.setOrderPrice(orderPrice);
        torder.setOrderState(orderState);
        torder.setPayWay(payWay);
        torderMapper.insert(torder);
    }

    public void updateTorder(int orderId,int goodId, Double orderPrice,int orderState,int payWay){ //仅允许管理员修改成交价，成交状态，支付方式
        Torder torder=getTorder(orderId);
        torder.setGoodId(goodId);
        torder.setOrderPrice(orderPrice);
        torder.setOrderState(orderState);
        torder.setPayWay(payWay);
        torder.setUpdateTime(getTime());
        torderMapper.updateByPrimaryKeySelective(torder);
    }


    public void deleteTorder(int orderId){
        torderMapper.deleteByPrimaryKey(orderId);
    }


    public int getbuyerinfo(int orderId){
        return torderMapper.selectbuyerid(orderId);
    }

    public int getsellerinfo(int orderId){
        return torderMapper.selectsellerid(orderId);
    }
}
