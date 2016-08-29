package com.auction.service.imp;

import com.auction.dao.CategoryMapper;
import com.auction.dao.GoodMapper;
import com.auction.dao.SubCategoryMapper;
import com.auction.model.Category;
import com.auction.model.Good;
import com.auction.model.SubCategory;
import com.auction.service.GoodService;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by xiechur on 2016/8/22.
 */
@Service
public class GoodServiceImpl implements GoodService {
    @Resource
    private GoodMapper goodMapper;
    @Resource
    private CategoryMapper categoryMapper;
    @Resource
    private SubCategoryMapper subCategoryMapper;

    public Good findGoodById(int goodId) {
        return goodMapper.selectByPrimaryKey(goodId);
    }

    public int updateState(Good good) {
        return goodMapper.updateByPrimaryKeySelective(good);
    }

    public List<Good> searchGoodByKey(String key) {
        Category category = categoryMapper.selectByName(key);
        if (category ==null)
        {
            SubCategory subCategory = subCategoryMapper.selectBySelectiveName(key);
            if(subCategory != null){
                List<Good> goodList = goodMapper.selectBySelectiveName(key);
                if (goodList != null && goodList.size() > 0){
                    return getAllGood();
                }else {
                    return null;
                }
            } else {
                List<Good> goodList = goodMapper.selectBySelectiveName(key);
                if (goodList != null){
                    return goodList;
                }else {
                    return null;
                }
            }

        }
        else{
            SubCategory subCategory = subCategoryMapper.selectByCategoryId(category.getCategoryId());
            if(subCategory != null)
            {
                return goodMapper.selectBySubCategoryId(subCategory.getSubCategoryId());
            }
            else {
                List<Good> goodList = goodMapper.selectBySelectiveName(key);
                if (goodList != null && goodList.size() > 0){
                    return getAllGood();
                }else {
                    return null;
                }
            }
        }
    }

    public int addGood(Good record) {
        return goodMapper.insertSelective(record);
    }

    public int updateGood(Good good) {
        return goodMapper.updateByPrimaryKeySelective(good);
    }

    public List<Good> getAllGood() {
        return goodMapper.getAllGood();
    }

    public List<Good> getAuctioningGood() {
        return goodMapper.getAuctioningGood();
    }

    public List<Good> getNotAudit() {
        return goodMapper.getNotAudit();
    }

}
