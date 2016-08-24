package com.auction.dao;

import com.auction.model.Cart;
import java.util.List;
import org.springframework.stereotype.Repository;

@Repository
public interface CartMapper {
    int deleteByPrimaryKey(Integer goodId);

    int insert(Cart record);

    int insertSelective(Cart record);

    List<Cart> selectByPrimaryKey(Integer cartId);

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);
}