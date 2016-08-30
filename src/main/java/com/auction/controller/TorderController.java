package com.auction.controller;

import com.auction.model.Torder;
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
public class TorderController {
    @Resource
    private TorderService torderService;
    private UserService userService;

    @ResponseBody
    @RequestMapping("/{userId}/torders")
    public Object usersTorders(@PathVariable int userId){
        List<Torder> torders=torderService.getUserAllTorders(userId);
        return  MyResult.getResult(1, "", torders);
    }

    @ResponseBody
    @RequestMapping("/manage/torders")
    public Object checkTorders(){
        List<Torder> torders=torderService.getAllTorders();
        return  MyResult.getResult(1, "", torders);
    }

    @ResponseBody
    @RequestMapping("/manage/torders/search")
    public  Object searchTorder(@RequestParam int orderId){
        Torder torder=torderService.getTorder(orderId);
        return  MyResult.getResult(1, "", torder);
    }


    @ResponseBody
    @RequestMapping("/manage/torders/{orderId}")
    public  Object checkTorder(@PathVariable int orderId){
        Torder torder=torderService.getTorder(orderId);
        return  MyResult.getResult(1, "", torder);
    }



    @ResponseBody
    @RequestMapping("/manage/torders/{orderId}/tradersinfo")
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
