package com.auction.controller;

import com.auction.common.SpringMvcActionContext;
import com.auction.model.*;
import com.auction.service.*;
import com.auction.util.MyResult;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by xiechur on 2016/8/22.
 */

@Controller
@RequestMapping("auction")
public class AuctionController extends SpringMvcActionContext {

    private static final transient Logger log = org.slf4j.LoggerFactory.getLogger(AuctionController.class);


    @Resource
    private GoodService goodService;
    @Resource
    private UserService userService;
    @Resource
    private CollectionService collectionService;
    @Resource
    private TorderService torderService;
    @Resource
    private DepositService depositService;
    @Resource
    private AuctionLogService auctionLogService;



    /**
     * 一口价竞拍
     * 放到good
     * @param
     * @param
     * @return
     */
    @RequestMapping("/noBargain")
    @ResponseBody
    public Object noBargain(Good g){
//        生成订单
        Good good = goodService.findGoodById(g.getGoodId());
        User user = (User)getSession().getAttribute("user");
        log.debug(user.toString());
        Torder torder = new Torder();
        torder.setGoodId(good.getGoodId());
        torder.setCreateTime(new Date());
        torder.setOrderPrice(good.getPrice());
        torder.setPayWay(0);
        torder.setUserId(user.getUserId());
        torder.setOrderState(0);
        int result =torderService.addOrder(torder);
        good.setGoodState(2);
        goodService.updateGood(good);
        if (result > 0) {
            log.debug("生成订单成功");
            if (user.getBalance() < good.getPrice()){
                return MyResult.getResult(0,"余额不足","");
            }
            int result2 = userService.pay(user.getUserId(), good.getPrice());
            if (result2 > 0) {
                log.debug("支付成功");
                Map<String, Object> map = new HashMap<String, Object>();
                map.put("goodId", good.getGoodId());
                List<Deposit> depositList = depositService.find(map);
                Deposit deposit = new Deposit();
                for (int j = 0; j < depositList.size(); j++) {
                    deposit = depositList.get(j);
                    User u = userService.findById(deposit.getUserId());
                    u.setBalance(u.getBalance() + deposit.getPrice());
                    deposit.setState(1);
                    synchronized (this) {
                        userService.update(u);
                        depositService.update(deposit);
                    }
                    log.debug("返还押金" + deposit.getPrice() + "To 用户ID" + u.getUserId());
                }
            } else {
                return MyResult.getResult(0, "支付失败", "");
            }
            return MyResult.getResult();
        }else{
            return MyResult.getResult(0,"生成订单失败","");
        }
    }


    /**
     * 检查是否拍卖结束
     * 放到good
     * @param goodId
     * @return
     */
//    @RequestMapping(value = "checkComplete")
//    @ResponseBody
//    public Object checkComplete(int goodId){
//        Good good = goodService.findGoodById(goodId);
//        if (new Date().before(good.getCompleteTime())){
//            //还没有结束
//            return MyResult.getResult();
//        }else {
//            //拍卖结束
//            torderService.createTorder(good.getBuyerId(),good.getGoodId(),good.getCurrPrice(),0,1); //生成订单
//            return MyResult.getResult(0,"拍卖结束","");
//        }
//    }


    /**
     * 竞拍
     * 前提：登录，已交保证金
     * @param
     * @param
     * @return
     */
    @RequestMapping("doAuction")
    @ResponseBody
    public Object doAuction(@RequestParam("currPrice")double currPrice, @RequestParam("goodId")int goodId){
        User user = (User) getSession().getAttribute("user");
        Good good = goodService.findGoodById(goodId);
        good.setBuyerId(user.getUserId());
        good.setCurrPrice(currPrice);
        int result2 = goodService.updateGood(good);
        if (result2 > 0){
            AuctionLog auctionLog = new AuctionLog();
            auctionLog.setGoodId(good.getGoodId());
            auctionLog.setPrice(currPrice);
            auctionLog.setUserId(user.getUserId());
            auctionLogService.addAuctionLog(auctionLog);
            return MyResult.getResult();
        }else{
            return MyResult.getResult(0,"出价失败","");
        }
    }
    @RequestMapping("addtocollection")
    @ResponseBody
    public Object addGoodtoCollection( @RequestParam int goodId){
        User user = (User)getSession().getAttribute("user");
        Collection collection=new Collection();
        collection.setUserId(user.getUserId());
        collection.setGoodId(goodId);
        collectionService.insertCollection(collection);
        return MyResult.getResult(1,"","加入收藏成功！");
    }
    @RequestMapping("deletecollection")
    @ResponseBody
    public Object deleteCollection(@RequestParam int userId, @RequestParam int goodId){
        User user = (User)getSession().getAttribute("user");
        collectionService.deleteCollection(user.getUserId(), goodId);
        return MyResult.getResult(1,"","取消收藏成功！");
    }







}
