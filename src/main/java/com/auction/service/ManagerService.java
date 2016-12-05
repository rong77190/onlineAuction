package com.auction.service;

import com.auction.model.Deposit;
import com.auction.model.Good;
import com.auction.model.Manager;

import java.util.List;
import java.util.Map;

/**
 * Created by dell on 2016/8/21.
 */
public interface ManagerService {
    //登录
    Manager login(Manager manager);

    /**
     * 查询
     * @param map
     * @return
     */
    public List<Manager> find(Map<String, Object> map);
    /**
     * 获取总记录数
     * @param map
     * @return
     */
    public Long getTotal(Map<String, Object> map);
    /**
     * 更新数据
     * @param manager
     * @return
     */
    public int update(Manager manager);
}
