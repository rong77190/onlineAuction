package com.auction.service;

import com.auction.model.Deposit;

/**
 * Created by dell on 2016/8/22.
 */
public interface AuctionService {

    Deposit checkDepositState(int userId, int goodId);

    int payDeposit(Deposit deposit);
}