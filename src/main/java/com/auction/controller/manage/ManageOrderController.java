package com.auction.controller.manage;

import com.auction.bean.OrderBean;
import com.auction.common.SpringMvcActionContext;
import com.auction.model.Manager;
import com.auction.model.PageBean;
import com.auction.model.Torder;
import com.auction.service.TorderService;
import com.auction.util.DateJsonValueProcessor;
import com.auction.util.StringUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by xiechur on 2016/11/25
 */

@Controller
@RequestMapping("manage/order")
public class ManageOrderController extends SpringMvcActionContext{
    private static final transient Logger log = org.slf4j.LoggerFactory.getLogger(ManageOrderController.class);
    @Resource
    private TorderService torderService;
    /**
     * 分页查询
     * @param page
     * @param rows
     * @param orderBean
     * @return
     *
     *
     * */
    @RequestMapping("/orderList")
    @ResponseBody
    public Object goodList(@RequestParam(value = "page",required = false)String page, @RequestParam(value = "rows",required = false)String rows, OrderBean orderBean)throws Exception{
        PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        Map<String,Object> map = new HashMap<String, Object>();


        map.put("orderId", orderBean.getOrderId());
        map.put("userName", StringUtil.formatLike(orderBean.getUserName()));
        map.put("goodName", StringUtil.formatLike(orderBean.getGoodName()));
        if (orderBean.getOrderState() == null){
            map.put("orderState",orderBean.getOrderState());
        }else {
            map.put("orderState",orderBean.getOrderState().toString());
        }
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());
        List<OrderBean> torderList= torderService.find(map);
        Long total=torderService.getTotal(map);
        JSONObject result=new JSONObject();
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.registerJsonValueProcessor(java.util.Date.class,new DateJsonValueProcessor("yyyy-MM-dd hh:mm:ss"));
        JSONArray jsonArray= JSONArray.fromObject(torderList,jsonConfig);
        result.put("rows", jsonArray);
        result.put("total", total);
        log.info(result.toString());
        return result;
    }


    /**
     * 修改(包括上架，下架)
     * @param torder
     * @return
     *
     *
     * */
    @RequestMapping("edit")
    @ResponseBody
    public Object editOrder(Torder torder){
//        Manager manager = (Manager) getSession().getAttribute("manager");
        torder.getUpdateTime();
//        torder.setUpdateBy(manager.getSysUserId());
        int result = torderService.update(torder);
        JSONObject jsonObject = new JSONObject();
        if(result > 0){   //说明修改成功
            log.info("editOrder修改成功");
            jsonObject.put("success", true);
        }else{
            log.info("editOrder修改失败");
            jsonObject.put("success", false);
        }
        return jsonObject;
    }



}
