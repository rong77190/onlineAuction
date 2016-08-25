package com.auction.controller;

import com.auction.model.Torder;
import com.auction.service.TorderService;
import com.auction.util.MyResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import java.util.List;

@Controller
public class TorderController {
    @Resource
    private TorderService torderService;

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

    @RequestMapping("/manage/torders/search")
    public  Object updateTorder(@RequestParam  int orderId){
        Torder torder=torderService.getTorder(orderId);
        return  MyResult.getResult(1, "", torder);
    }






}
