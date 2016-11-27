package com.auction.controller.manage;

import com.auction.model.Good;
import com.auction.model.PageBean;
import com.auction.service.GoodService;
import com.auction.util.DateJsonValueProcessor;
import com.auction.util.StringUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
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
@Controller("manageGoodController")
@RequestMapping("manage/good")
public class GoodController {

    @Resource
    private GoodService goodService;



    /**
     * 分页查询
     * @param page
     * @param rows
     * @param good
     * @return
     *
     *
     * */
    @RequestMapping("/goodList")
    @ResponseBody
    public Object goodList(@RequestParam(value = "page",required = false)String page, @RequestParam(value = "rows",required = false)String rows, Good good)throws Exception{
        PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("goodName", StringUtil.formatLike(good.getGoodName()));
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());
        List<Good> goodList=goodService.find(map);
        Long total=goodService.getTotal(map);
        JSONObject result=new JSONObject();
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.registerJsonValueProcessor(java.util.Date.class,new DateJsonValueProcessor("yyyy-MM-dd hh-mm-ss"));
        JSONArray jsonArray= JSONArray.fromObject(goodList,jsonConfig);
        result.put("rows", jsonArray);
        result.put("total", total);
        System.out.println(result.toString());
//        ResponseUtil.write(getResponse(), result);
        return result;
    }


    /**
     * 修改(包括上架，下架)
     * @param good
     * @return
     *
     *
     * */
    @RequestMapping("edit")
    @ResponseBody
    public Object editGood(Good good){
        int result = goodService.updateGood(good);
        JSONObject jsonObject = new JSONObject();
        if(result > 0){   //说明修改成功
            jsonObject.put("success", true);
        }else{
            jsonObject.put("success", false);
        }
        return jsonObject;
    }


}
