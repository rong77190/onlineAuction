package com.auction.service.imp;

import com.auction.dao.CategoryMapper;
import com.auction.model.Category;
import com.auction.service.CategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2016/11/23/023.
 */

@Service
public class CategoryServiceImpl implements CategoryService {

    @Resource
    private CategoryMapper categoryMapper;


    public Category selectByName(String key) {
        return categoryMapper.selectByName(key);
    }
}
