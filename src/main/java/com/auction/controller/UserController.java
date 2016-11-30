package com.auction.controller;

import com.auction.common.SpringMvcActionContext;
import com.auction.model.Collection;
import com.auction.model.Torder;
import com.auction.model.User;
import com.auction.service.TorderService;
import com.auction.service.UserService;
import com.auction.service.CollectionService;
import com.auction.util.MyResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by xiechur on 2016/8/25.
 */
@Controller
@RequestMapping(value = "/user")
public class UserController extends SpringMvcActionContext{

    @Resource
    private UserService userService;

    @Resource
    private TorderService torderService;

    @Resource
    private CollectionService collectionService;

    /**
     * 查询用户列表
     */
    @RequestMapping(value = "userList")
    @ResponseBody
    public Object selectUser(){
        List<User> userList = userService.selectAll();
        return MyResult.getResult(1,"",userList);
    }

    /**
     * 用户查询个人信息
     */
    @RequestMapping(value = "userInfo",method=RequestMethod.GET)
    @ResponseBody
    public Object checkUserInfo(){
        User user = (User)getSession().getAttribute("user");
        Integer userId = user.getUserId();
        User userInfo=userService.findById(userId);
        return MyResult.getResult(1,"",userInfo);
    }

    //跳转到添加用户页面
    @RequestMapping(value = "toAdd", method = RequestMethod.GET)
    public ModelAndView toAddUser(HttpServletRequest request) {
        return new ModelAndView("user/user_add");
    }


    /**
     * 添加用户
     */
    @RequestMapping(value = "add")
    @ResponseBody
    public Object addUser(User user) {
//        if ()
        userService.add(user);
//        return "redirect:/user/list";
        return MyResult.getResult(1,"","");
    }


    //跳转到添加用户页面
    @RequestMapping(value = "toUpdate", method = RequestMethod.GET)
    public ModelAndView toUpdateUser(HttpServletRequest request) {
        return new ModelAndView("user/updateUserInfo");
    }


    /**
     * 修改用户
     */
//    @RequestMapping(value = "update")
//    @ResponseBody
//    public Object updateUser(User user) {
//        userService.update(user);
////        return "redirect:/user/list";
//        return MyResult.getResult(1,"",user);
//    }


    /**
     * 用户修改个人信息
     */

//    接受修改页面的表单接受后生成的user，对数据库进行更新后重定向到用户信息
    @RequestMapping(value = "updateUserInfo",method=RequestMethod.POST)
    public String updateUserInfo(User dirty) {
        User user = (User)getSession().getAttribute("user");
        userService.userUpdate(user.getUserId(),dirty.getPhone(),dirty.getSex(),dirty.getBirthday());
        return "redirect:/user/userInfo";
    }
    //    接受修改头像请求，上传图片且对数据库进行更新后重定向到用户信息
//    @RequestMapping(value = "updateUserImage",method=RequestMethod.POST)
//    public String updateUserImage(String userImage) {
//        User user = (User)getSession().getAttribute("user");
//        userService.updateImage(user.getUserId(),userImage);
//        return "redirect:/user/userInfo";
//    }


    // 查看用户个人收藏夹
    @RequestMapping(value = "collection")
    @ResponseBody
    public Object userCollection(){
        User user = (User)getSession().getAttribute("user");
        //collectionList包括了拍卖品名，可以直接调用
        List<Collection> collectionList = collectionService.getCollection(user.getUserId());
        return MyResult.getResult(1,"",collectionList);
    }

    //删除后使用重定向刷新页面
    @RequestMapping(value = "deleteCollection")
    public String deleteCollection(@RequestParam int goodId){
        User user = (User)getSession().getAttribute("user");
         collectionService.deleteCollection(user.getUserId(),goodId);
        return "redirect:user/collection";
    }


    //个人中心查看个人所有订单
    @RequestMapping(value="userOrder")
    @ResponseBody
    public Object usersTorders(){
        User user = (User)getSession().getAttribute("user");
        List<Torder> orders=torderService.getUserAllTorders(user.getUserId());
        return  MyResult.getResult(1, "", orders);
    }
}
