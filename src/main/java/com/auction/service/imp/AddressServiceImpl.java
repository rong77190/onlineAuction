package com.auction.service.imp;

import com.auction.model.Address;
import com.auction.dao.AddressMapper;
import com.auction.model.Address;
import com.auction.service.AddressService;
import org.springframework.stereotype.Service;
import java.util.List;
import javax.annotation.Resource;


/**
 * Created by Y410P on 2016/11/29.
 */
@Service
public class AddressServiceImpl implements AddressService {
    @Resource
    private AddressMapper addressMapper;

    public Address getAddress(int userId){
        return addressMapper.selectByPrimaryKey(userId);
    }

    public void insertAddress(Address address){
        addressMapper.insert(address);
    }
}

