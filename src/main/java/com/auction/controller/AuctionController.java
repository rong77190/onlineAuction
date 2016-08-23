package com.auction.controller;

import com.auction.model.Deposit;
import com.auction.model.User;
import com.auction.service.AuctionService;
import com.auction.service.GoodService;
import com.auction.service.UserService;
import com.auction.util.MyResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by xiechur on 2016/8/22.
 */

@Controller
@RequestMapping("auction")
public class AuctionController{

    @Resource
    private AuctionService auctionService;
    @Resource
    private GoodService goodService;
    @Resource
    private UserService userService;


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
            return MyResult.getResult(1,"",deposit);
        }else{
            return MyResult.getResult(1,"",deposit);
        }
    }


    /**
     * 一口价竞拍
     * @param
     * @param
     * @return
     */
//    @RequestMapping("/noBargain")
//    @ResponseBody
//    public Object noBargain(int userId,int goodId,int price){
//        生成订单
//        Deposit deposit = null;
//        int result = userService.pay(userId,price);
//
//        if (result < 1){
//            return MyResult.getResult(0,"支付失败","");
//        }
//
//
//        deposit = auctionService.checkDepositState(userId,goodId);
//        if (deposit == null){
//            return MyResult.getResult(0,"没有押金记录","");
//        }else if (deposit.getState() == 1){
//            return MyResult.getResult(1,"",1);
//        }else{
//            return MyResult.getResult(1,"",0);
//        }
//    }
//

    /**
     * 缴纳保证金
     * @param userId
     * @param goodId
     * @return
     */
    @RequestMapping("/payDeposit")
    @ResponseBody
    public Object payDeposit(int userId,int goodId,double price){
        Deposit deposit = null;
        User user = userService.findById(userId);
        if (user.getBalance()<price){
            return MyResult.getResult(0,"余额不足","");
        }else {
            deposit.setUserId(userId);
            deposit.setGoodId(goodId);
            deposit.setPrice(price);
            int result = auctionService.payDeposit(deposit);
            if (result == 0) {
                return MyResult.getResult(0, "没有押金记录", "");
            } else if (deposit.getState() == 1) {
                return MyResult.getResult(1, "", 1);
            } else {
                return MyResult.getResult(1, "", 0);
            }
        }
    }

    /**
     * 检查是否拍卖结束
     * @param goodId
     * @return
     */
//    @RequestMapping(value = "checkComplete")
//    public Object checkComplete(int goodId){
//        Good good = goodService.findGoodById(goodId);
//        if (DateUtil.getDate().compareTo(good.getCompleteTime().toString())>0){
//            //结束
//
//        }else {
//
//        }
//
//    }


    /**
     * 返回保证金
     * @param userId
     * @param goodId
     * @return
     */


    /**
     * 扣除保证金
     * @param userId
     * @param goodId
     * @return
     */


    /**
     * 更新商品状态为已拍卖
     * @param userId
     * @param goodId
     * @return
     */

}
