package com.auction.controller;

import com.auction.common.SpringMvcActionContext;
import com.auction.model.Deposit;
import com.auction.model.User;
import com.auction.service.DepositService;
import com.auction.service.UserService;
import com.auction.util.MyResult;
import com.fasterxml.jackson.databind.Module;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("deposit")
public class DepositController extends SpringMvcActionContext{
    private static final transient Logger log = org.slf4j.LoggerFactory.getLogger(DepositController.class);
    @Resource
    private DepositService depositService;
    @Resource
    private UserService userService;
    /**
     * 获取押金详情跳转页面
     * @param id
     * @return
     *
     *
     * */
    @RequestMapping("{id}")
    @ResponseBody
    public Object deposit(@PathVariable("id")int id){
        Deposit deposit = null;
        deposit = depositService.findById(id);
        if (deposit == null){
            return MyResult.getResult(0,"","");
        }else{
            return MyResult.getResult(1,"",deposit);
        }
    }


    /**
     * 获取押金详情
     * @param
     * @return
     *
     *
     * */


    /**
     * 缴纳保证金
     * @param goodId
     * @param depositPrice
     * @return
     */
    @RequestMapping("/addDeposit")
    @ResponseBody
    public Object payDeposit( int goodId, double depositPrice){
        User user = (User)getSession().getAttribute("user");
        Integer userId = user.getUserId();
        if (user.getBalance()<depositPrice){
            return MyResult.getResult(0,"余额不足","");
        }else {
            Deposit deposit = new Deposit();
            deposit.setGoodId(goodId);
            deposit.setUserId(userId);
            deposit.setPrice(depositPrice);
            deposit.setCreateTime(new Date());
            deposit.setUpdateTime(new Date());
            synchronized (this){
                depositService.add(deposit);
                userService.pay(userId,depositPrice);
            }
            return MyResult.getResult();
        }
    }


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
        deposit = depositService.checkDepositState(userId,goodId);
        if (deposit == null){
            return MyResult.getResult(0,"没有押金记录","");
        }else if (deposit.getState() == 1){
            return MyResult.getResult(1,"",deposit);
        }else{
            return MyResult.getResult(0,"",deposit);
        }
    }

}
