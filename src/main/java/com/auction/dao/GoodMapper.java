package com.auction.dao;

import com.auction.model.Good;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface GoodMapper {
    int deleteByPrimaryKey(Integer goodId);

    int insert(Good record);

    int insertSelective(Good record);

    Good selectByPrimaryKey(Integer goodId);

    int updateByPrimaryKeySelective(Good record);

    int updateByPrimaryKey(Good record);

    List<Good> getHotGoods();

    List<Good> getNewlyGoods();

    List<Good> getRecommendedGoods();

    //更新当前价
    int updateCurrPrice(@Param("buyerId") int buyerId, @Param("goodId") int goodId, @Param("currPrice") double currPrice);

    List<Good> selectBySubCategoryId(Integer subCategoryId);

    List<Good> selectBySelectiveName(String name);

    List<Good> getAllGood();

    List<Good> getAuctioningGood();

    List<Good> getNotAudit();

    /**
     * 拍品查询
     * @param map
     * @return用户集合
     */
    public List<Good> find(Map<String, Object> map);


    /**
     * 获取总记录数
     * @param map
     * @return获取的total数
     */
    public Long getTotal(Map<String, Object> map);

}