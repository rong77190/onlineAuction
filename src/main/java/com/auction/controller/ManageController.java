package com.auction.controller;

import com.auction.common.SpringMvcActionContext;
import com.auction.model.Deposit;
import com.auction.model.Good;
import com.auction.model.Manager;
import com.auction.service.GoodService;
import com.auction.service.ManagerService;
import com.auction.service.UserService;
import com.auction.util.MyResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by xiechur on 2016/8/20.
 */
@Controller
@RequestMapping("manage")
public class ManageController extends SpringMvcActionContext {
    @Resource
    private ManagerService managerService;
    @Resource
    private UserService userService;

    @Resource
    private GoodService goodService;

    /**
     * 管理员登陆
     *
     * @param manager
     * @return
     */
    @RequestMapping("login")
    @ResponseBody
    public Object manageLogin(Manager manager) {
        HttpSession session = getSession();
        manager = managerService.login(manager);
        if (manager == null) {
            return MyResult.getResult(0, "用户名或密码错误", "");
        } else {
            session.setAttribute("manager", manager);
            return MyResult.getResult(1, "", manager);
        }
    }


    /**
     * 管理员登出
     *
     * @return
     */
    @RequestMapping("/logout")
    @ResponseBody
    public Object logout() {
        getSession().removeAttribute("manager");
        return MyResult.getResult();
    }


    /**
     * 查看某商品保证金
     *
     * @param goodId
     * @return
     */
    @RequestMapping("DepositByGoodId")
    @ResponseBody
    public Object DepositByGoodId(@RequestParam("goodId") int goodId) {
//        Manager manager = (Manager) getSession().getAttribute("manager");
        return MyResult.getResult(1, "", managerService.getDepositByGoodId(goodId));
    }


    /**
     * 返回保证金，成功拍到的用户不放回
     * @param goodId
     * @return
     */
    @RequestMapping("backDeposit")
    @ResponseBody
    public Object backDeposit(@RequestParam("goodId") int goodId) {
        List<Deposit> depositList = managerService.getDepositByGoodId2(goodId);
        System.out.println(depositList.toString());
        for (int i = 1; i < depositList.size(); i++) {
            Deposit deposit = depositList.get(i);
            backToUser(deposit);
        }
        return MyResult.getResult();
    }


    public void backToUser(Deposit deposit) {
        synchronized (deposit) {
            int r1 = userService.backDepositToUser(deposit.getUserId(), deposit.getPrice());
        }
        synchronized (deposit) {
            deposit.setState(1);
            int r2 = managerService.backDeposit(deposit);
        }
    }


    /**
     * 更新商品状态  manage
     * @param good
     * @return
     */

    @RequestMapping("updateGoodState")
    @ResponseBody
    public Object updateGoodState(Good good,String state){
//        Manager manager = (Manager)getSession().getAttribute("manager");
//        if (manager == null){
//            return MyResult.getResult(0,"管理员未登录","");
//        }
        good.setGoodState(state);
        int result = goodService.updateState(good);
        if (result > 0){
            return MyResult.getResult();
        }else {
            return MyResult.getResult(0,"更新商品状态失败","");
        }
    }


}
