package com.auction.controller.manage;

import com.alibaba.fastjson.JSONObject;
import com.auction.model.Deposit;
import com.auction.model.PageBean;
import com.auction.service.DepositService;
import com.auction.util.StringUtil;
import net.sf.json.JSONArray;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by xiechur on 2016/11/25/025.
 */
@Controller("manageDepositController")
@RequestMapping("manage/deposit")
public class DepositController {
    private static final transient Logger log = org.slf4j.LoggerFactory.getLogger(DepositController.class);


//    @Resource
//    private DepositService depositService;
//
//    /**
//     * 分页查询
//     * @param page
//     * @param rows
//     * @param s_user
//     * @return
//     *
//     * */
//    @RequestMapping("/depositList")
//    @ResponseBody
//    public Object userList(@RequestParam(value = "page",required = false)String page, @RequestParam(value = "rows",required = false)String rows, Deposit deposit)throws Exception{
//        PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
//        Map<String,Object> map = new HashMap<String, Object>();
//        map.put("userName", StringUtil.formatLike(deposit.));
//        map.put("userName", StringUtil.formatLike(orderBean.getUserName()));
//        map.put("goodName", StringUtil.formatLike(orderBean.getGoodName()));
//        map.put("start", pageBean.getStart());
//        map.put("size", pageBean.getPageSize());
//        List<Deposit>  depositList = depositService.find(map);
//        Long total=depositList.getTotal(map);
//        JSONObject result=new JSONObject();
//        JSONArray jsonArray= JSONArray.fromObject(depositList);
//        result.put("rows", jsonArray);
//        result.put("total", total);
//        System.out.println(result.toString());
//        return result;
//    }
}
