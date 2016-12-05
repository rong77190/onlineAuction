package com.auction.controller.manage;

import com.auction.common.SpringMvcActionContext;
import com.auction.model.Manager;
import com.auction.model.PageBean;
import com.auction.service.ManagerService;
import com.auction.util.StringUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by xiechur on 2016/11/25/025.
 */

@Controller
@RequestMapping("manage/admin")
public class ManageAdminController extends SpringMvcActionContext {

    private static final transient Logger log = org.slf4j.LoggerFactory.getLogger(ManageAdminController.class);
    @Resource
    private ManagerService managerService;
    /**
     * 管理员登陆
     *
     * @param manager
     * @return
     */
    @RequestMapping("login")
    public String manageLogin(Manager manager) {
        HttpSession session = getSession();
        manager = managerService.login(manager);
        if (manager == null) {
            getSession().setAttribute("manager", manager);
            getRequest().setAttribute("error", "用户名或密码错误");
            return "/manage/syslogin";
        } else {
            session.setAttribute("manager", manager);
            return "redirect:/manage/main.jsp";

        }
    }

    /**
     * 管理员登出
     *
     * @return
     */
    @RequestMapping("/logout")
    public String logout() {
        getSession().removeAttribute("manager");
        return "redirect:/manage/syslogin.jsp";
    }


    /**
     * 查询管理员表
     * @param page
     * @param rows
     * @param manager
     * @return
     * @throws Exception
     */
    @RequestMapping("adminList")
    @ResponseBody
    public Object managerList(@RequestParam(value = "page",required = false)String page, @RequestParam(value = "rows",required = false)String rows, Manager manager)throws Exception{
        PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("name", StringUtil.formatLike(manager.getName()));
        if (manager.getFreeze() == null){
            map.put("freeze",manager.getFreeze());
        }else {
            map.put("freeze",manager.getFreeze().toString());
        }
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());
        List<Manager> manageList = managerService.find(map);
        Long total=managerService.getTotal(map);
        JSONObject result=new JSONObject();
        JSONArray jsonArray= JSONArray.fromObject(manageList);
        result.put("rows", jsonArray);
        result.put("total", total);
        System.out.println(result.toString());
        return result;
    }

    /**
     * 管理员修改
     * @param manager
     * @return
     *
     * */
    @RequestMapping("edit")
    @ResponseBody
    public Object editManager(Manager manager){
        int result = managerService.update(manager);
        JSONObject jsonObject = new JSONObject();
        if(result > 0){   //说明修改成功
            jsonObject.put("success", true);
        }else{
            jsonObject.put("success", false);
        }
        return jsonObject;
    }
}
