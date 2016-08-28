package com.auction.controller;

import com.auction.common.SpringMvcActionContext;
import com.auction.model.Deposit;
import com.auction.model.Good;
import com.auction.model.User;
import com.auction.service.AuctionService;
import com.auction.service.GoodService;
import com.auction.service.UserService;
import com.auction.service.CartService;
import com.auction.util.MyResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;

/**
 * Created by xiechur on 2016/8/22.
 */

@Controller
@RequestMapping("auction")
public class AuctionController extends SpringMvcActionContext{


    @Resource
    private AuctionService auctionService;
    @Resource
    private GoodService goodService;
    @Resource
    private UserService userService;
    @Resource
    private CartService cartService;

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
    public Object noBargain(int userId,int goodId,int price){
//        生成订单
        Deposit deposit = null;
        int result = userService.pay(userId,price);

        if (result < 1){
            return MyResult.getResult(0,"支付失败","");
        }


        deposit = auctionService.checkDepositState(userId,goodId);
        if (deposit == null){
            return MyResult.getResult(0,"没有押金记录","");
        }else if (deposit.getState() == 1){
            return MyResult.getResult(1,"",1);
        }else{
            return MyResult.getResult(1,"",0);
        }
    }
//

    /**
     * 缴纳保证金
     * @param goodId
     * @return
     */
    @RequestMapping("/payDeposit")
    @ResponseBody
    public Object payDeposit(int goodId,double depositPrice){
        User user = (User)getSession().getAttribute("user");
        if (user == null){
            MyResult.getResult(0,"请前往登陆","");
        }
        Integer userId = user.getUserId();
        System.out.println("userid>>>>>>>>>"+user);
        if (user.getBalance()<depositPrice){
            return MyResult.getResult(0,"余额不足","");
        }else {
            Deposit deposit = new Deposit();
            deposit.setGoodId(goodId);
            deposit.setUserId(userId);
            deposit.setPrice(depositPrice);
            deposit.setCreateTime(new Date());
            int result = auctionService.payDeposit(deposit);
            if (result == 0) {
                return MyResult.getResult(0, "没有押金记录", "");
//            } else if (deposit.getState() == 1) {//返还
//                return MyResult.getResult(1, "", 1);
            } else {//未返还
                return MyResult.getResult();
            }
        }
    }

    /**
     * 检查是否拍卖结束
     * 放到good
     * @param goodId
     * @return
     */
    @RequestMapping(value = "checkComplete")
    @ResponseBody
    public Object checkComplete(int goodId){
        Good good = goodService.findGoodById(goodId);
        if (new Date().before(good.getCompleteTime())){
            //还没有结束
            return MyResult.getResult();
        }else {
            //拍卖结束
            return MyResult.getResult(0,"拍卖结束","");
        }
    }


    /**
     * 竞拍
     * 前提：登录，已交保证金
     * @param
     * @param
     * @return
     */
    @RequestMapping("doAuction")
    @ResponseBody
    public Object doAuction(@RequestParam("currPrice")double currPrice,@RequestParam("goodId")int goodId){
        User user = null;
        user = (User) getSession().getAttribute("user");
        if (user == null){
            MyResult.getResult(0,"请前往登陆","");
        }
        int userId = user.getUserId();
//        int result1 = userService.pay(userId,currPrice);

        int result2 = auctionService.updateCurrPrice(userId,goodId,currPrice);
        if (result2 > 0){
            return MyResult.getResult();
        }else{
            return MyResult.getResult(0,"出价失败","");
        }
    }


    /**
     * 获取当前的价格
     * @param good
     * @return
     */
    @RequestMapping("getCurrPrice")
    @ResponseBody
    public Object getCurrPrice(Good good){
        good = goodService.findGoodById(good.getGoodId());
        return MyResult.getResult(1,"",good);
    }


    @RequestMapping("addtofavourite")
    @ResponseBody
    public Object addGoodtoFavourite(@RequestParam int userId,@RequestParam  int goodId){
        Good good = goodService.findGoodById(goodId);
        cartService.addGood(userId,good);
        return MyResult.getResult(1,"加入收藏成功！","");

    }



    /**
     * 扣除保证金
     * @param userId
     * @param goodId
     * @return
     */





}
