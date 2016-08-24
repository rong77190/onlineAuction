package com.auction.controller;

import com.auction.model.Torder;
import com.auction.service.TorderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    public String usersTorders(@PathVariable int userId,Model model){
        List<Torder> torders=torderService.getUserAllTorders(userId);
        model.addAttribute("torders",torders);
        return "usersTorders";
    }

    @ResponseBody
    @RequestMapping("/manage/torders")
    public String checkTorders(Model model){
        List<Torder> torders=torderService.getAllTorders();
        model.addAttribute("torders",torders);
        return "allTorders";
    }

    @RequestMapping("/manage/torders/search")
    public  String updateTorder(@RequestParam  int orderId, Model model){
        Torder torder=torderService.getTorder(orderId);
        model.addAttribute("torder",torder);
        return  "result";
    }






}
