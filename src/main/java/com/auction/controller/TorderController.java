package com.auction.controller;

import com.auction.model.Torder;
import com.auction.common.SpringMvcActionContext;
import com.auction.model.User;
import com.auction.service.TorderService;
import com.auction.service.UserService;
import com.auction.util.MyResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/order")
public class TorderController extends SpringMvcActionContext {
    @Resource
    private TorderService torderService;
    @Resource
    private UserService userService;


    @RequestMapping("/manage/orders")
    @ResponseBody
    public Object checkTorders(){
        List<Torder> torders=torderService.getAllTorders();
        return  MyResult.getResult(1, "", torders);
    }

    @RequestMapping("/manage/torders/search")
    @ResponseBody
    public  Object searchTorder(@RequestParam int orderId){
        Torder torder=torderService.getTorder(orderId);
        return  MyResult.getResult(1, "", torder);
    }


    @RequestMapping("/manage/torders/{orderId}")
    @ResponseBody
    public  Object checkTorder(@PathVariable int orderId){
        Torder torder=torderService.getTorder(orderId);
        return  MyResult.getResult(1, "", torder);
    }



    @RequestMapping("/manage/torders/{orderId}/tradersinfo")
    @ResponseBody
    public  Object checkBuyerSellerInfo(@PathVariable int orderId){
        int buyerId=torderService.getbuyerinfo(orderId);
        User buyer=userService.findById(buyerId);
        int sellerId=torderService.getsellerinfo(orderId);
        User seller=userService.findById(sellerId);
        List<User> info=new ArrayList<User>();
        info.add(buyer);
        info.add(seller);
        return  MyResult.getResult(1, "", info);
    }







}
