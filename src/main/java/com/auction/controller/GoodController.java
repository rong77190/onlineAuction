package com.auction.controller;

import com.auction.common.SpringMvcActionContext;
import com.auction.model.Good;
import com.auction.service.GoodService;
import com.auction.util.MyResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/good")
public class GoodController extends SpringMvcActionContext{

    @Resource
    private GoodService goodService;

    /**
     * 搜索
     * @param key
     * @return
     */
    @RequestMapping(value="searchGoodByKey")
    @ResponseBody
    public Object searchGoodByKey(String key){
        List<Good> goodList = goodService.searchGoodByKey(key);
        if(goodList != null && goodList.size() > 0){
            return MyResult.getResult(1,"",goodList);
        }else {
            return MyResult.getResult(0,"没有查询结果","");
        }
    }


    @RequestMapping(value="addGood")
    @ResponseBody
    public Object applyGood(Good good){
        if(good.getBeginPrice() == null || good.getGoodName() == null
                || good.getImage() == null || good.getIntroduction() == null)
        {
            return MyResult.getResult(0, "信息不全", "");
        }else{
            int result = goodService.addGood(good);
            if(result > 0){
                return MyResult.getResult(1,"",good);
            }else{
                return MyResult.getResult(0,"添加失败","");
            }

        }
    }


    @RequestMapping("/getDetail")
    @ResponseBody
    public Object showGood(Good good){
        good = goodService.findGoodById(good.getGoodId());
//        getSession().setAttribute("good",good);
        if(good != null){
            return MyResult.getResult(1,"",good);
        }else{
            return MyResult.getResult(0,"获取失败","");
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




}
