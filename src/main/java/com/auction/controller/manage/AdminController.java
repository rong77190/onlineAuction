package com.auction.controller.manage;

import com.auction.common.SpringMvcActionContext;
import com.auction.model.Manager;
import com.auction.service.ManagerService;
import com.auction.util.MyResult;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by xiechur on 2016/11/25/025.
 */

@Controller("manageAdminController")
@RequestMapping("manage/admin")
public class AdminController extends SpringMvcActionContext{

    private static final transient Logger log = org.slf4j.LoggerFactory.getLogger(AdminController.class);
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
}
