package com.auction.model;

public class Collection {
    private Integer userId;

    private Integer goodId;

    private String goodName;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getGoodId() {
        return goodId;
    }

    public void setGoodId(Integer goodId) {
        this.goodId = goodId;
    }

    public String getGoodName() {
        return goodName;
    }

    public void setGoodId( String goodName) {
        this.goodName = goodName;
    }
}