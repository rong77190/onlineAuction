package com.auction.dao;

import com.auction.model.Address;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AddressMapper {
    int deleteByPrimaryKey(Integer addressId);

    int insert(Address record);

    int insertSelective(Address record);

    Address selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(Address record);

    int updateByPrimaryKey(Address record);
}