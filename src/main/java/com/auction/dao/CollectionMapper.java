package com.auction.dao;

/**
 * Created by Y410P on 2016/11/29.
 */

import com.auction.model.Collection;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface CollectionMapper {
    int deleteByPrimaryKey(Integer userId,Integer goodId);

    int insert(Collection record);

    int insertSelective(Collection record);

    List<Collection> selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(Collection record);

    int updateByPrimaryKey(Collection record);
}
