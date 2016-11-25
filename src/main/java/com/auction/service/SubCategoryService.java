package com.auction.service;

import com.auction.model.SubCategory;

import java.util.List;

/**
 * Created by Administrator on 2016/11/23/023.
 */
public interface SubCategoryService {

    public SubCategory selectByName(String key);

    public List<SubCategory> selectByCategoryId(int id);
}
