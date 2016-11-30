package com.auction.service.imp;

import com.auction.model.Collection;
import com.auction.dao.CollectionMapper;
import com.auction.service.CollectionService;
import org.springframework.stereotype.Service;

import java.util.List;
import javax.annotation.Resource;

/**
 * Created by Y410P on 2016/11/29.
 */
@Service
public class CollectionServiceImpl implements CollectionService {

    @Resource
    private CollectionMapper collectionMapper;

    public List<Collection> getCollection(int userId){
        return collectionMapper.selectByPrimaryKey(userId);
    }

    public void insertCollection(Collection collection){
        collectionMapper.insert(collection);
    }

    public void deleteCollection(int userId,int goodId){
        collectionMapper.deleteByPrimaryKey(userId,goodId);
    }
}
