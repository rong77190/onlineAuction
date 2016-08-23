package com.auction.service.imp;

import com.auction.dao.ManagerMapper;
import com.auction.model.Manager;
import com.auction.service.ManagerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by dell on 2016/8/21.
 */
@Service
public class ManagerServiceImpl implements ManagerService {

    @Resource
    private ManagerMapper managerMapper;


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
}
