package com.auction.dao;

import com.auction.model.Good;
import com.auction.model.Manager;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ManagerMapper {
    int deleteByPrimaryKey(Integer sysUserId);

    int insert(Manager record);

    int insertSelective(Manager record);

    Manager selectByPrimaryKey(Integer sysUserId);

    int updateByPrimaryKeySelective(Manager record);

    int updateByPrimaryKey(Manager record);

    Manager login(@Param("name") String userName, @Param("password") String password);

    /**
     * @param map
     * @return集合
     */
    public List<Manager> find(Map<String, Object> map);


    /**
     * 获取总记录数
     * @param map
     * @return获取的total数
     */
    public Long getTotal(Map<String, Object> map);
}