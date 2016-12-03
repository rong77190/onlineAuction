package com.auction.controller;

import com.auction.model.Address;
import com.auction.model.Good;
import com.auction.model.Torder;
import com.auction.common.SpringMvcActionContext;
import com.auction.model.User;
import com.auction.service.GoodService;
import com.auction.service.TorderService;
import com.auction.service.UserService;
import com.auction.service.AddressService;
import com.auction.util.MyResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/order")
public class TorderController extends SpringMvcActionContext {
    @Resource
    private TorderService torderService;
    @Resource
    private UserService userService;
    @Resource
    private AddressService addressService;
    @Resource
    private GoodService goodService;


    //    @RequestMapping("/manage/orders")
//    @ResponseBody
//    public Object checkTorders(){
//        List<Torder> torders=torderService.getAllTorders();
//        return  MyResult.getResult(1, "", torders);
//    }
//
//    @RequestMapping("/manage/torders/search")
//    @ResponseBody
//    public  Object searchTorder(@RequestParam int orderId){
//        Torder torder=torderService.getTorder(orderId);
//        return  MyResult.getResult(1, "", torder);
//    }
//
//
//    @RequestMapping("/manage/torders/{orderId}")
//    @ResponseBody
//    public  Object checkTorder(@PathVariable int orderId){
//        Torder torder=torderService.getTorder(orderId);
//        return  MyResult.getResult(1, "", torder);
//    }
//
//
//
//    @RequestMapping("/manage/torders/{orderId}/tradersinfo")
//    @ResponseBody
//    public  Object checkBuyerSellerInfo(@PathVariable int orderId){
//        int buyerId=torderService.getbuyerinfo(orderId);
//        User buyer=userService.findById(buyerId);
//        int sellerId=torderService.getsellerinfo(orderId);
//        User seller=userService.findById(sellerId);
//        List<User> info=new ArrayList<User>();
//        info.add(buyer);
//        info.add(seller);
//        return  MyResult.getResult(1, "", info);
//    }
    @RequestMapping("detail")
    public ModelAndView checkOrderDetail(@RequestParam int orderId){
        ModelAndView mav=new ModelAndView("detail");
        Torder order=torderService.getTorder(orderId);
        mav.addObject("orderId",orderId);
        User user=userService.findById(order.getUserId());
        String userName=user.getUserName();
        mav.addObject("userName",userName);    //等于出价人
        mav.addObject("realName",user.getRealName()); //真实姓名
        Good good=goodService.findGoodById(order.getGoodId());
        String goodName=good.getGoodName();
        mav.addObject("goodName",goodName);
        mav.addObject("goodImage",good.getImage());
        Date createTime=order.getCreateTime();
        mav.addObject("createTime",createTime);  //订单创建时间=拍卖结束时间
        Double orderPrice=order.getOrderPrice();
        mav.addObject("orderPrice",orderPrice);  //订单价格=拍卖成交时的最高价
        int orderState=order.getOrderState();
        mav.addObject("orderState",orderState);  //
        Address address=addressService.getAddress(order.getUserId());
        mav.addObject("roughAddress",address.getRoughAddress());
        mav.addObject("detailAddress",address.getDetailAddress());
        mav.addObject("receiver",address.getReceiver());  //收件人
        mav.addObject("phone",address.getPhone());  //用户电话
        mav.addObject("postcode",address.getPostcode()); //邮编
        return mav;
    }






}
