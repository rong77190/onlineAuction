package com.auction.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Deposit {
    private Integer depositId;

    private Integer userId;

    private Integer goodId;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    private Double price;

    private Integer state;

    public Integer getDepositId() {
        return depositId;
    }

    public void setDepositId(Integer depositId) {
        this.depositId = depositId;
    }

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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Deposit{" +
                "depositId=" + depositId +
                ", userId=" + userId +
                ", goodId=" + goodId +
                ", createTime=" + createTime +
                ", price=" + price +
                ", state=" + state +
                '}';
    }
}