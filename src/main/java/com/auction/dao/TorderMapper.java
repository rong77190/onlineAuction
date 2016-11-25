package com.auction.dao;

import com.auction.bean.OrderBean;
import com.auction.model.Good;
import com.auction.model.Torder;

import java.util.List;
import java.util.Map;

public interface TorderMapper {
    int deleteByPrimaryKey(Integer orderId);

    int insert(Torder record);

    int insertSelective(Torder record);

    Torder selectByPrimaryKey(Integer orderId);

    List<Torder> selectByUserId(Integer userId);

    List<Torder> selectAll();

    int updateByPrimaryKeySelective(Torder record);

    int updateByPrimaryKey(Torder record);

    int selectbuyerid(Integer orderId);

    int selectsellerid(Integer orderId);



    /**
     * 订单查询
     * @param map
     * @return用户集合
     */
    public List<OrderBean> find(Map<String, Object> map);


    /**
     * 获取总记录数
     * @param map
     * @return获取的total数
     */
    public Long getTotal(Map<String, Object> map);
}