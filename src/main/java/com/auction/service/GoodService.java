package com.auction.service;

import com.auction.model.Good;

import java.util.List;
import java.util.Map;

/**
 * Created by xiechur on 2016/8/22.
 */
public interface GoodService {
    Good findGoodById(int goodId);

    public List<Good> selectBySubCategoryId(int id);

    int updateState(Good good);

    public List<Good> searchGoodByKey(String key);

    public int addGood(Good record);

    public int updateGood(Good good);

    List<Good> getAllGood();

    List<Good> getAuctioningGood();

    List<Good> getNotAudit();

    List<Good> getHotGoods();

    List<Good> getNewlyGoods();

    List<Good> getRecommendedGoods();

    /**
     * 拍品查询
     * @param map
     * @return
     */
    public List<Good> find(Map<String, Object> map);
    /**
     * 获取总记录数
     * @param map
     * @return
     */
    public Long getTotal(Map<String, Object> map);
    /**
     * 修改用户
     * @param user
     * @return影响的记录数
     */

//    public int update(User user);

    /**
     * 添加用户
     * @param user
     * @return影响的记录数
     */
//    public int add(User user);

    /**
     * 删除用户
     * @param userId
     * @return
     */
    public int delete(Integer userId);


    public List getComplete();

}
