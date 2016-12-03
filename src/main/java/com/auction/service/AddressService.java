package com.auction.service;

import com.auction.model.Address;
import java.util.List;


public interface AddressService {
    public Address getAddress(int userId);

    public void insertAddress(Address address);

}