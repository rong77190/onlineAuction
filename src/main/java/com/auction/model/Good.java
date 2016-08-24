package com.auction.model;

import java.io.Serializable;
import java.util.Date;

public class Good implements Serializable {
    private Integer goodId;

    private Integer subCategoryId;

    private String goodName;

    private Double price;

    private Double currPrice;

    private Double beginPrice;

    private String image;

    private String introduction;

    private Date createTime;

    private Integer isDelete;

//    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date upTime;

    private String goodState;

//    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date completeTime;

    private Integer userId;

    public Integer getGoodId() {
        return goodId;
    }

    public void setGoodId(Integer goodId) {
        this.goodId = goodId;
    }

    public Integer getSubCategoryId() {
        return subCategoryId;
    }

    public void setSubCategoryId(Integer subCategoryId) {
        this.subCategoryId = subCategoryId;
    }

    public String getGoodName() {
        return goodName;
    }

    public void setGoodName(String goodName) {
        this.goodName = goodName == null ? null : goodName.trim();
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getCurrPrice() {
        return currPrice;
    }

    public void setCurrPrice(Double currPrice) {
        this.currPrice = currPrice;
    }

    public Double getBeginPrice() {
        return beginPrice;
    }

    public void setBeginPrice(Double beginPrice) {
        this.beginPrice = beginPrice;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    public Date getUpTime() {
        return upTime;
    }

    public void setUpTime(Date upTime) {
        this.upTime = upTime;
    }

    public String getGoodState() {
        return goodState;
    }

    public void setGoodState(String goodState) {
        this.goodState = goodState == null ? null : goodState.trim();
    }

    public Date getCompleteTime() {
        return completeTime;
    }

    public void setCompleteTime(Date completeTime) {
        this.completeTime = completeTime;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}