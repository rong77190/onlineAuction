package com.auction.dao;

import com.auction.model.Deposit;
import com.auction.model.Good;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface DepositMapper {
    int deleteByPrimaryKey(Integer depositId);

    int insert(Deposit record);

    int insertSelective(Deposit record);

    Deposit selectByPrimaryKey(Integer depositId);

    int updateByPrimaryKeySelective(Deposit record);

    int updateByPrimaryKey(Deposit record);

    //补充
    Deposit checkDepositState(@Param("userId") int userId, @Param("goodId") int goodId);

    //获取某商品所有押金信息
    List getDepositByGoodId(@Param("goodId") int goodId);

    //获取某商品未返押金信息
    List getDepositByGoodId2(@Param("goodId") int goodId);

    /**
     * 押金查询
     * @param map
     * @return押金集合
     */
    public List<Deposit> find(Map<String, Object> map);


    /**
     * 获取总记录数
     * @param map
     * @return获取的total数
     */
    public Long getTotal(Map<String, Object> map);
}