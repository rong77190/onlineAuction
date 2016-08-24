package com.auction.service.imp;

import com.auction.dao.DepositMapper;
import com.auction.dao.ManagerMapper;
import com.auction.model.Deposit;
import com.auction.model.Manager;
import com.auction.service.ManagerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by dell on 2016/8/21.
 */
@Service
public class ManagerServiceImpl implements ManagerService {

    @Resource
    private ManagerMapper managerMapper;
    @Resource
    private DepositMapper depositMapper;


    /**
     * 登陆
     * @param manager
     * @return
     */
    public Manager login(Manager manager) {
        String name = manager.getName();
        String password = manager.getPassword();
        return managerMapper.login(name,password);
    }

//    获取某商品所有押金信息
    public List getDepositByGoodId(int goodId) {
        return depositMapper.getDepositByGoodId(goodId);
    }

//    获取某商品未返押金信息
    public List getDepositByGoodId2(int goodId) {
        return depositMapper.getDepositByGoodId2(goodId);
    }

//    设置状态为1  已经返还
    public int backDeposit(Deposit deposit) {
        return depositMapper.updateByPrimaryKeySelective(deposit);
    }
}
