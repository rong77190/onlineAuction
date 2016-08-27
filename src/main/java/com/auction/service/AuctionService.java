package com.auction.service;

import com.auction.model.Deposit;

/**
 * Created by xiechur on 2016/8/22.
 */
public interface AuctionService {

    Deposit checkDepositState(int userId, int goodId);

    int payDeposit(Deposit deposit);

    int updateCurrPrice(int buyerId,int goodId,double price);
}
