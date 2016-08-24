package com.auction.service;

import com.auction.model.User;

/**
 * Created by xiechur on 2016/8/22.
 */
public interface UserService {

    int pay(int userId,double price);

    User findById(int userId);

    int backDepositToUser(int userId,double price);
}
