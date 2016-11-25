package com.auction.service.imp;

import com.auction.dao.SubCategoryMapper;
import com.auction.model.Category;
import com.auction.model.SubCategory;
import com.auction.service.SubCategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2016/11/23/023.
 */
@Service
public class SubCategoryServiceImpl implements SubCategoryService {



    @Resource
    private SubCategoryMapper subCategoryMapper;

    public SubCategory selectByName(String key) {
        return subCategoryMapper.selectBySelectiveName(key);
    }

    public List<SubCategory> selectByCategoryId(int id) {
        return subCategoryMapper.selectByCategoryId(id);
    }
}
