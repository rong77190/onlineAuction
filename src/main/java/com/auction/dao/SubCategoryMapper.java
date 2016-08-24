package com.auction.dao;

import com.auction.model.SubCategory;
import org.springframework.stereotype.Repository;

@Repository
public interface SubCategoryMapper {
    int deleteByPrimaryKey(Integer subCategoryId);

    int insert(SubCategory record);

    int insertSelective(SubCategory record);

    SubCategory selectByPrimaryKey(Integer subCategoryId);

    int updateByPrimaryKeySelective(SubCategory record);

    int updateByPrimaryKey(SubCategory record);
}