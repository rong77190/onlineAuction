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
public class GoodController extends SpringMvcActionContext {

	@Resource
	private GoodService goodService;
	
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
		if(good.getBeginPrice() == null && good.getGoodName() == null 
		   && good.getImage() == null && good.getIntroduction() == null)
		{
			return MyResult.getResult(0, "信息不全", "");
		}else{
            int result = goodService.addGood(good);
            return MyResult.getResult();
		}
    }
	
	@RequestMapping("/show")
    @ResponseBody
    public Object showGood(Good good){
        good = goodService.findGoodById(good.getGoodId());
        getSession().setAttribute("good",good);
        return MyResult.getResult(1,"",good);
    }
	
}
