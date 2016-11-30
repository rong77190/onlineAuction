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
import java.util.Map;

/**
 * Created by xiechur on 2016/8/22.
 */
@Service
public class GoodServiceImpl implements GoodService {
    @Resource
    private GoodMapper goodMapper;


    public Good findGoodById(int goodId) {
        return goodMapper.selectByPrimaryKey(goodId);
    }

    public int updateState(Good good) {
        return goodMapper.updateByPrimaryKeySelective(good);
    }

    public List<Good> searchGoodByKey(String key) {
        return goodMapper.selectBySelectiveName(key);
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

    public List<Good> find(Map<String, Object> map) {
        return goodMapper.find(map);
    }

    public Long getTotal(Map<String, Object> map) {
        return goodMapper.getTotal(map);
    }

    public int delete(Integer userId) {
        return 0;
    }

    public List<Good> selectBySubCategoryId(int id){
        return goodMapper.selectBySubCategoryId(id);
    }
}
