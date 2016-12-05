package com.auction.controller.manage;

import com.auction.model.Deposit;
import com.auction.model.PageBean;
import com.auction.model.User;
import com.auction.service.DepositService;
import com.auction.service.UserService;
import com.auction.util.DateJsonValueProcessor;
import com.auction.util.ResponseUtil;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by xiechur on 2016/11/25/
 */
@Controller
@RequestMapping("manage/deposit")
public class ManageDepositController {
    private static final transient Logger log = org.slf4j.LoggerFactory.getLogger(ManageDepositController.class);


    @Resource
    private DepositService depositService;
    @Resource
    private UserService userService;
    /**
     * 分页查询
     * @param page
     * @param rows
     * @param deposit
     * @return
     *
     * */
    @RequestMapping("/depositList")
    @ResponseBody
    public Object depositList(@RequestParam(value = "page",required = false)String page, @RequestParam(value = "rows",required = false)String rows, Deposit deposit)throws Exception{
        PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("userId", deposit.getUserId());
        map.put("depositId",deposit.getDepositId());
        map.put("goodId",deposit.getGoodId());
        if (deposit.getState() == null){
            map.put("state",deposit.getState());
        }else {
            map.put("state",deposit.getState().toString());
        }
        log.debug(deposit.toString());
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());
        List<Deposit>  depositList = depositService.find(map);
        Long total=depositService.getTotal(map);
        net.sf.json.JSONObject result=new net.sf.json.JSONObject();
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.registerJsonValueProcessor(Date.class,new DateJsonValueProcessor("yyyy-MM-dd hh:mm:ss"));
        JSONArray jsonArray= JSONArray.fromObject(depositList,jsonConfig);
        result.put("rows", jsonArray);
        result.put("total", total);
        System.out.println(result.toString());
        return result;
    }


    /**
     * 修改(包括返还)
     * @param deposit
     * @return
     *
     * */

    @RequestMapping("edit")
    @ResponseBody
    public Object editDeposit(Deposit deposit) throws  Exception{
        deposit.setUpdateTime(new Date());
        int result = depositService.update(deposit);
        net.sf.json.JSONObject jsonObject = new net.sf.json.JSONObject();
        if(result > 0){   //说明修改成功
            log.debug("editOrder修改成功");
            jsonObject.put("success", true);
        }else{
            log.debug("editOrder修改失败");
            jsonObject.put("success", false);
        }
        return jsonObject;
    }

    /**
     * 返回押金
     * @param ids
     * @param res
     * @return
     * @throws Exception
     */
    @RequestMapping("/backDeposit")
    public String delete(@RequestParam(value="ids") String ids, HttpServletResponse res) throws Exception{
        String[] idStr = ids.split(",");
        net.sf.json.JSONObject jsonObject = new net.sf.json.JSONObject();
        for (String id : idStr){
            Deposit deposit = depositService.findById(Integer.parseInt(id));
            int userId = deposit.getUserId();
            double price = deposit.getPrice();
            User user = userService.findById(userId);
            user.setBalance(user.getBalance()+price);
            deposit.setState(1);
            deposit.setUpdateTime(new Date());
            synchronized (this) {
                userService.update(user);
                depositService.update(deposit);
            }
        }
        jsonObject.put("success", true);
        ResponseUtil.write(res, jsonObject);
        return null;
    }


}

