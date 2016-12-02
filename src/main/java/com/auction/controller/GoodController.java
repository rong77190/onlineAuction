package com.auction.controller;

import com.auction.common.SpringMvcActionContext;
import com.auction.model.Category;
import com.auction.model.Good;
import com.auction.model.PageBean;
import com.auction.model.SubCategory;
import com.auction.service.CategoryService;
import com.auction.service.GoodService;
import com.auction.service.SubCategoryService;
import com.auction.util.MyResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/good")
public class GoodController extends SpringMvcActionContext {

	@Resource
	private GoodService goodService;
    @Resource
    private CategoryService categoryService;
    @Resource
    private SubCategoryService subCategoryService;



	@RequestMapping(value="searchGoodByKey")
    @ResponseBody
    public Object searchGoodByKey(String key){
        Category category = categoryService.selectByName(key);
        if (category ==null)
        {
            SubCategory subCategory = subCategoryService.selectByName(key);
            if(subCategory != null){
                System.out.println("subCategory != null");
                List<Good> goodList = goodService.selectBySubCategoryId(subCategory.getSubCategoryId());
                System.out.println(goodList);
                return MyResult.getResult(1,"",goodList);
            } else {
                System.out.println("subCategory == null");
                List<Good> goodList = goodService.searchGoodByKey(key);
                if (goodList != null){
                    System.out.println("goodList != null");
                    return MyResult.getResult(1,"",goodList);
                }else {
                    System.out.println("goodList == null");
                    return MyResult.getResult(0,"没有查询结果","");
                }
            }
        }
        else{
            List<SubCategory> subCategoryList = subCategoryService.selectByCategoryId(category.getCategoryId());
            List<Good> c = new ArrayList<Good>();
            for(int i = 0; i<subCategoryList.size();i++){
                int id = subCategoryList.get(i).getSubCategoryId();
                System.out.println(id);
                List<Good> goodList = goodService.selectBySubCategoryId(id);
                System.out.println(goodList);
                Good good = new Good();
                for (int j= 0; j < goodList.size();j++){
                    good = goodList.get(j);
                    c.add(good);
                }
            }
            return MyResult.getResult(1,"",c);
        }
    }
	
	@RequestMapping(value="addGood")
    @ResponseBody
    public Object applyGood(Good good){
		if(good.getBeginPrice() == null && good.getGoodName() == null && good.getPrice()==null
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

    /**
     * 获取最新上架的拍品
     * @return
     */

    @RequestMapping("/getNewlyGoods")
    @ResponseBody
    public Object getNewlyGoods(){
        List<Good> goodList = goodService.getNewlyGoods();
        return MyResult.getResult(1,"",goodList);

    }

    /**
     * 获取推荐的拍品
     * @return
     */

    @RequestMapping("/getRecommendedGoods")
    @ResponseBody
    public Object getRecommendedGoods(){
        List<Good> goodList = goodService.getRecommendedGoods();
        return MyResult.getResult(1,"",goodList);

    }

    /**
     * 获取热门的拍品
     * @return
     */

    @RequestMapping("/getHotGoods")
    @ResponseBody
    public Object getHotGoods(){
        List<Good> goodList = goodService.getHotGoods();
        return MyResult.getResult(1,"",goodList);

    }

    /**
     * 拍品展示
     */
    @RequestMapping(value="/showItems")
    public ModelAndView showItems(){
        ModelAndView modelAndView = new ModelAndView("index");
        List<Good> goodList = goodService.getHotGoods();
        modelAndView.addObject("goodList",goodList);

        List<Good> goodList1 = goodService.getNewlyGoods();
        modelAndView.addObject("goodList1",goodList1);

        List<Good> goodList2 = goodService.getRecommendedGoods();
        modelAndView.addObject("goodList2",goodList2);

        return modelAndView;
    }

}
