package com.auction.service.imp;

import com.auction.dao.DepositMapper;
import com.auction.model.Deposit;
import com.auction.service.AuctionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by dell on 2016/8/22.
 */
@Service
public class AuctionServiceImpl implements AuctionService {

    @Resource
    private DepositMapper depositMapper;

    //坚持保证金状态
    public Deposit checkDepositState(int userId, int goodId) {
        return depositMapper.checkDepositState(userId,goodId);
    }

    //缴纳保证金
    public int payDeposit(Deposit deposit) {
        return depositMapper.insertSelective(deposit);
    }
}
