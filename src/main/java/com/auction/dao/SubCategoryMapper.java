package com.auction.dao;

import com.auction.model.SubCategory;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SubCategoryMapper {
    int deleteByPrimaryKey(Integer subCategoryId);

    int insert(SubCategory record);

    int insertSelective(SubCategory record);

    SubCategory selectByPrimaryKey(Integer subCategoryId);

    List<SubCategory> selectByCategoryId(Integer cId);

    SubCategory selectBySelectiveName(@Param("name") String name);

    int updateByPrimaryKeySelective(SubCategory record);

    int updateByPrimaryKey(SubCategory record);

}