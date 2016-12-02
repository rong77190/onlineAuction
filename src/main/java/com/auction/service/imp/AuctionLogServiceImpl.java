package com.auction.service.imp;

import com.auction.dao.AuctionLogMapper;
import com.auction.model.AuctionLog;
import com.auction.service.AuctionLogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by xiechur on 2016/12/1/001.
 */
@Service
public class AuctionLogServiceImpl implements AuctionLogService {

    @Resource
    private AuctionLogMapper auctionLogMapper;
    public int addAuctionLog(AuctionLog auctionLog) {
        return auctionLogMapper.insertSelective(auctionLog);
    }
}
