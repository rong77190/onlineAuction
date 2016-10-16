package com.auction.dao;

import com.auction.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    User userSelect(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    int userUpdateInfo(User record);

    int pay(@Param("userId") int userId, @Param("price") double price);

    int backDepositToUser(@Param("userId") int userId, @Param("price") double price);


    List<User> selectAll();

    /**
     * 用户查询
     * @param map
     * @return用户集合
     */
    public List<User> find(Map<String, Object> map);
    /**
     * 获取总记录数
     * @param map
     * @return获取的total数
     */
    public Long getTotal(Map<String, Object> map);
}