package com.auction.controller;

import com.auction.common.SpringMvcActionContext;
import com.auction.model.*;
import com.auction.service.*;
import com.auction.util.MyResult;
import com.auction.util.StringUtil;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.java2d.loops.GraphicsPrimitiveProxy;

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
    private AuctionService auctionService;
    @Resource
    private GoodService goodService;
    @Resource
    private UserService userService;
    @Resource
    private CartService cartService;
    @Resource
    private TorderService torderService;
    @Resource
    private DepositService depositService;
    @Resource
    private AuctionLogService auctionLogService;
    /**
     * 检查押金状态
     * @param userId
     * @param goodId
     * @return
     */
    @RequestMapping("checkDepositState")
    @ResponseBody
    public Object checkDepositState(int userId,int goodId){

        Deposit deposit = null;
        deposit = auctionService.checkDepositState(userId,goodId);
        if (deposit == null){
            return MyResult.getResult(0,"没有押金记录","");
        }else if (deposit.getState() == 1){
//            deposit.setCreateTime(deposit.getCreateTime().);
            return MyResult.getResult(1,"",deposit);
        }else{
            return MyResult.getResult(1,"",deposit);
        }
    }


    /**
     * 一口价竞拍
     * 放到good
     * @param
     * @param
     * @return
     */
    @RequestMapping("/noBargain")
    @ResponseBody
    public Object noBargain(Good good){
//        生成订单
        User user = (User)getSession().getAttribute("user");
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
     * 缴纳保证金
     * @param goodId
     * @return
     */
//    @RequestMapping("/payDeposit")
//    @ResponseBody
//    public Object payDeposit(int goodId,double depositPrice){
//        User user = (User)getSession().getAttribute("user");
//        if (user == null){
//            MyResult.getResult(0,"请前往登陆","");
//        }
//        Integer userId = user.getUserId();
//        System.out.println("userid>>>>>>>>>"+user);
//        if (user.getBalance() < depositPrice){
//            return MyResult.getResult(0,"余额不足","");
//        }else {
//
//
//            Deposit deposit = new Deposit();
//            deposit.setGoodId(goodId);
//            deposit.setUserId(userId);
//            deposit.setPrice(depositPrice);
//            deposit.setCreateTime(new Date());
//            int result = auctionService.payDeposit(deposit);
//            if (result == 0) {
//                return MyResult.getResult(0, "没有押金记录", "");
////            } else if (deposit.getState() == 1) {//返还
////                return MyResult.getResult(1, "", 1);
//            } else {//未返还
//                return MyResult.getResult();
//            }
//        }
//    }

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


//    /**
//     * 获取当前的价格
//     * @param good
//     * @return
//     */
//    @RequestMapping("getCurrPrice")
//    @ResponseBody
//    public Object getCurrPrice(Good good){
//        good = goodService.findGoodById(good.getGoodId());
//        return MyResult.getResult(1,"",good);
//    }


//    @RequestMapping("addtofavourite")
//    @ResponseBody
//    public Object addGoodtoFavourite(@RequestParam int userId, @RequestParam int goodId){
//        Good good = goodService.findGoodById(goodId);
//        cartService.addGood(userId,good);
//        return MyResult.getResult(1,"加入收藏成功！","");
//
//    }



    /**
     * 扣除保证金
     * @param userId
     * @param goodId
     * @return
     */


}
