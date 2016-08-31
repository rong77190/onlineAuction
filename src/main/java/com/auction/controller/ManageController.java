package com.auction.controller;

import com.auction.common.SpringMvcActionContext;
import com.auction.model.*;
import com.auction.service.GoodService;
import com.auction.service.ManagerService;
import com.auction.service.UserService;
import com.auction.util.MyResult;
import com.auction.util.StringUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public String manageLogin(Manager manager) {
        HttpSession session = getSession();
        manager = managerService.login(manager);
        if (manager == null) {
            getSession().setAttribute("manager", manager);
            getRequest().setAttribute("error", "用户名或密码错误");
            return "/manage/syslogin";
        } else {
            session.setAttribute("manager", manager);
            return "redirect:/manage/main.jsp";
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
     *  获取所有的拍品
     * @return
     */

    @RequestMapping("/getAllGood")
    @ResponseBody
    public Object getAllGood(){
        List<Good> goodList = goodService.getAllGood();
        return MyResult.getResult(1,"",goodList);

    }

    /**
     * 获取正在拍卖的拍品
     * @return
     */

    @RequestMapping("/getAuctioningGood")
    @ResponseBody
    public Object getAuctioningGood(){
        List<Good> goodList = goodService.getAuctioningGood();
        return MyResult.getResult(1,"",goodList);

    }


    /**
     * 获取未审核的拍品
     * @return
     */

    @RequestMapping("/getNotAudit")
    @ResponseBody
    public Object getNotAudit(){
        List<Good> goodList = goodService.getNotAudit();
        return MyResult.getResult(1,"",goodList);

    }


    /**
     * 更新商品状态  manage
     * @param good
     * @return
     */

    @RequestMapping("updateGoodState")
    @ResponseBody
    public Object updateGoodState(Good good, String state){
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

//    /**
//     * 查询用户列表
//     */
//    @RequestMapping(value = "list")
//    @ResponseBody
//    public Object selectUser(){
//        List<User> userList = userService.selectAll();
//        return MyResult.getResult(1,"",userList);
//    }

    /*
   * 分页查询
   * */
    @RequestMapping("/userList")
    @ResponseBody
    public Object userList(@RequestParam(value = "page",required = false)String page,@RequestParam(value = "rows",required = false)String rows,User s_user)throws Exception{
        PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("userName", StringUtil.formatLike(s_user.getUserName()));
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());
        List<User> userList=userService.find(map);
        Long total=userService.getTotal(map);
        JSONObject result=new JSONObject();
        JSONArray jsonArray= JSONArray.fromObject(userList);
        result.put("rows", jsonArray);
        result.put("total", total);
        System.out.println(result.toString());
        return result;
    }



    /*
   * 分页查询
   * */
    @RequestMapping("/goodList")
    @ResponseBody
    public Object goodList(@RequestParam(value = "page",required = false)String page,@RequestParam(value = "rows",required = false)String rows,Good good)throws Exception{
        PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("goodName", StringUtil.formatLike(good.getGoodName()));
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());
        List<Good> goodList=goodService.find(map);
        Long total=goodService.getTotal(map);
        JSONObject result=new JSONObject();
        JSONArray jsonArray= JSONArray.fromObject(goodList);
        result.put("rows", jsonArray);
        result.put("total", total);
        System.out.println(result.toString());
//        ResponseUtil.write(getResponse(), result);
        return result;
        }




//    /*
//   * 分页查询
//   * */
//    @RequestMapping("/orderList")
//    @ResponseBody
//    public Object orderList(@RequestParam(value = "page",required = false)String page,@RequestParam(value = "rows",required = false)String rows,Torder torder)throws Exception{
//        PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
//        Map<String,Object> map = new HashMap<String, Object>();
//        map.put("goodName", StringUtil.formatLike(torder.get()));
//        map.put("start", pageBean.getStart());
//        map.put("size", pageBean.getPageSize());
//        List<Good> goodList=goodService.find(map);
//        Long total=goodService.getTotal(map);
//        JSONObject result=new JSONObject();
//        JSONArray jsonArray= JSONArray.fromObject(goodList);
//        result.put("rows", jsonArray);
//        result.put("total", total);
//        System.out.println(result.toString());
////        ResponseUtil.write(getResponse(), result);
//        return result;
//    }
}
