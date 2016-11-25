package com.auction.controller.manage;

import com.auction.service.DepositService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
/**
 * Created by xiechur on 2016/11/25/025.
 */
@Controller("manageDepositController")
@RequestMapping("manage/deposit")
public class DepositController {


//    @Resource
//    private DepositService depositService;

//    /**
//     * 分页查询
//     * @param page
//     * @param rows
//     * @param s_user
//     * @return
//     *
//     * */
//    @RequestMapping("/userList")
//    @ResponseBody
//    public Object userList(@RequestParam(value = "page",required = false)String page, @RequestParam(value = "rows",required = false)String rows, User s_user)throws Exception{
//        PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
//        Map<String,Object> map = new HashMap<String, Object>();
//        map.put("userName", StringUtil.formatLike(s_user.getUserName()));
//        map.put("start", pageBean.getStart());
//        map.put("size", pageBean.getPageSize());
//        List<User> userList=userService.find(map);
//        Long total=userService.getTotal(map);
//        JSONObject result=new JSONObject();
//        JSONArray jsonArray= JSONArray.fromObject(userList);
//        result.put("rows", jsonArray);
//        result.put("total", total);
//        System.out.println(result.toString());
//        return result;
//    }
}
