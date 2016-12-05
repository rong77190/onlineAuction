package com.auction.service.imp;

import com.auction.dao.ManagerMapper;
import com.auction.model.Manager;
import com.auction.service.ManagerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

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

    public List<Manager> find(Map<String, Object> map) {
        return managerMapper.find(map);
    }

    public Long getTotal(Map<String, Object> map) {
        return managerMapper.getTotal(map);
    }

    public int update(Manager manager) {
        return managerMapper.updateByPrimaryKeySelective(manager);
    }

}
