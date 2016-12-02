package com.auction.service;

import com.auction.model.Deposit;
import com.auction.model.Good;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/11/25/025.
 */
public interface DepositService {
    public Deposit findById(int id);

    public int add(Deposit deposit);

    /**
     * 押金查询
     * @param map
     * @return
     */
    public List<Deposit> find(Map<String, Object> map);
    /**
     * 获取总记录数
     * @param map
     * @return
     */
    public Long getTotal(Map<String, Object> map);
    /**
     * 可选编辑
     * @param deposit
     * @return
     */
    public int update(Deposit deposit);


    /**
     * 检查押金
     * @param userId
     * @param goodId
     * @return
     */
    Deposit checkDepositState(int userId, int goodId);

}
