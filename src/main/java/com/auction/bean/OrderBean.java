package com.auction.bean;

import com.auction.model.Torder;

/**
 * Created by dell on 2016/8/31.
 */
public class OrderBean extends Torder{

    private String  goodName;
    private String userName;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getGoodName() {
        return goodName;
    }

    public void setGoodName(String goodName) {
        this.goodName = goodName;
    }
}
