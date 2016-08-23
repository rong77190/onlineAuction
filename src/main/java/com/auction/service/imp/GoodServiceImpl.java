package com.auction.service.imp;

import com.auction.dao.GoodMapper;
import com.auction.model.Good;
import com.auction.service.GoodService;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by dell on 2016/8/22.
 */
@Service
public class GoodServiceImpl implements GoodService {
    @Resource
    private GoodMapper goodMapper;

    public Good findGoodById(int goodId) {
        return goodMapper.selectByPrimaryKey(goodId);
    }

}
