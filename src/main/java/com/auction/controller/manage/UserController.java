package com.auction.controller.manage;

import com.auction.model.PageBean;
import com.auction.model.User;
import com.auction.service.UserService;
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
import javax.naming.event.ObjectChangeListener;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by xiechur on 2016/11/25/025.
 */
@Controller("manageUserController")
@RequestMapping("manage/user")
public class UserController {

    private static final transient Logger log = org.slf4j.LoggerFactory.getLogger(UserController.class);

    @Resource
    private UserService userService;

    /**
     * 分页查询
     * @param page
     * @param rows
     * @param s_user
     * @return
     *
     * */
    @RequestMapping("/userList")
    @ResponseBody
    public Object userList(@RequestParam(value = "page",required = false)String page, @RequestParam(value = "rows",required = false)String rows, User s_user)throws Exception{
        PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("userName", StringUtil.formatLike(s_user.getUserName()));
        if (s_user.getFreeze() == null){
            map.put("freeze",s_user.getFreeze());
        }else {
            map.put("freeze",s_user.getFreeze().toString());
        }
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());
        List<User> userList = userService.find(map);
        Long total = userService.getTotal(map);
        JSONObject result=new JSONObject();
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.registerJsonValueProcessor(java.util.Date.class,new DateJsonValueProcessor("yyyy-MM-dd hh-mm-ss"));
        JSONArray jsonArray= JSONArray.fromObject(userList,jsonConfig);
        result.put("rows", jsonArray);
        result.put("total", total);
        log.info(result.toString());
        return result;
    }



    /**
     * 用户修改
     * @param user
     * @return
     *
     * */
    @RequestMapping("edit")
    @ResponseBody
    public Object editUser(User user){
        int result = userService.update(user);
        JSONObject jsonObject = new JSONObject();
        if(result > 0){   //说明修改成功
            jsonObject.put("success", true);
        }else{
            jsonObject.put("success", false);
        }
        return jsonObject;
    }



}
