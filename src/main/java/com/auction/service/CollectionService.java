package com.auction.service;

import com.auction.model.Collection;
import com.auction.model.Good;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Y410P on 2016/11/29.
 */
public interface CollectionService {
    public List<Collection> getCollection(int userId);

    public void insertCollection(Collection collection);

    public void deleteCollection(int userId,int goodId);

}
