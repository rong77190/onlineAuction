package com.auction.service;

import com.auction.model.Deposit;
import com.auction.model.Manager;

import java.util.List;

/**
 * Created by dell on 2016/8/21.
 */
public interface ManagerService {
    //登录
    Manager login(Manager manager);


    //    获取某商品所有押金信息
    List getDepositByGoodId(int goodId);

    //    获取某商品未返押金信息
    List getDepositByGoodId2(int goodId);

    //    设置状态为1  已经返还
    int backDeposit(Deposit deposit);
}
