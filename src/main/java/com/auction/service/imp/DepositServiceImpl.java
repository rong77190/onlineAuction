package com.auction.service.imp;

import com.auction.dao.DepositMapper;
import com.auction.model.Deposit;
import com.auction.service.DepositService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/11/28/028.
 */
@Service
public class DepositServiceImpl implements DepositService {

    @Resource
    private DepositMapper depositMapper;

    public Deposit findById(int id) {
        return depositMapper.selectByPrimaryKey(id);
    }

    public int add(Deposit deposit) {
        return depositMapper.insertSelective(deposit);
    }

    public List<Deposit> find(Map<String, Object> map) {
        return depositMapper.find(map);
    }

    public Long getTotal(Map<String, Object> map) {
        return depositMapper.getTotal(map);
    }

    public int update(Deposit deposit) {
        return depositMapper.updateByPrimaryKeySelective(deposit);
    }
}
