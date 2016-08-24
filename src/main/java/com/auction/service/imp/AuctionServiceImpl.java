package com.auction.service.imp;

import com.auction.dao.DepositMapper;
import com.auction.dao.GoodMapper;
import com.auction.dao.UserMapper;
import com.auction.model.Deposit;
import com.auction.service.AuctionService;
import com.auction.service.GoodService;
import com.auction.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by dell on 2016/8/22.
 */
@Service
public class AuctionServiceImpl implements AuctionService {

    @Resource
    private DepositMapper depositMapper;
    @Resource
    private GoodMapper goodMapper;
    //保证金状态
    public Deposit checkDepositState(int userId, int goodId) {
        return depositMapper.checkDepositState(userId,goodId);
    }

    //缴纳保证金
    public int payDeposit(Deposit deposit) {
        return depositMapper.insertSelective(deposit);
    }

    //更新当前价格
    public int updateCurrPrice(int userId, int goodId, double currPrice) {
        return goodMapper.updateCurrPrice(userId,goodId,currPrice);
    }
}
