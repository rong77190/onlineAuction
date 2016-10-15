package com.auction.controller;

import com.auction.common.SpringMvcActionContext;
import com.auction.model.Good;
import com.auction.model.PageBean;
import com.auction.service.GoodService;
import com.auction.util.MyResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
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
	
	@RequestMapping("/getDetail")
    @ResponseBody
    public Object getDetail(Good good){
        good = goodService.findGoodById(good.getGoodId());
        getSession().setAttribute("good",good);
        return MyResult.getResult(1,"",good);
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


    @RequestMapping("/list")
    public ModelAndView goodList(HttpServletRequest request){

        String query=request.getQueryString();
        String pageStr=request.getParameter("page");
        int page;
        if(pageStr==null || "".equals(pageStr.trim())){
            page=1;
        }else{
            page=Integer.parseInt(pageStr);
        }
        PageBean pager=new PageBean();
        pager.setPage(page);
        pager.setPageSize(8);

        List<Good> goodList=new ArrayList<Good>();
        goodList=goodService.getAuctioningGood();
        ModelAndView modelAndView=new ModelAndView("test2");
        if(goodList==null){
            return modelAndView;
        }

        modelAndView.addObject("pager",pager);
        modelAndView.addObject(goodList);
        return modelAndView;
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
