package com.auction.controller;

import com.auction.common.SpringMvcActionContext;
import com.auction.model.Collection;
import com.auction.model.Torder;
import com.auction.model.User;
import com.auction.service.GoodService;
import com.auction.service.TorderService;
import com.auction.service.UserService;
import com.auction.service.CollectionService;
import com.auction.util.MyResult;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

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
    @Resource
    private GoodService goodService;

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
    @RequestMapping(value="updateUserImage",method=RequestMethod.POST)
    @ResponseBody
    public Object addUser(@RequestParam("file") CommonsMultipartFile file, HttpServletRequest request) throws IOException {
        User user = (User)getSession().getAttribute("user");
        System.out.println("fileName---->" + file.getOriginalFilename());
        //项目暂时只需要image
        HashMap<String, String> extMap = new HashMap<String, String>();
        extMap.put("image", "gif,jpg,jpeg,png,bmp");
        String dirName = "image";
        String fileName = file.getOriginalFilename();
        //检查扩展名
        String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
        System.out.println("<<<<<<<<<<<fileExt<<<<<<<<<<<<<"+fileExt);
        if (!Arrays.<String>asList(extMap.get(dirName).split(",")).contains(fileExt)) {
            return MyResult.getResult(0,"上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName) + "格式。","");
        }
        if(!file.isEmpty()){
            String basePath = "resources/upload";//上传基本路径
            String savePath = request.getSession().getServletContext().getRealPath(basePath);//上传保存路径，绝对路径
//			System.out.println("savePath》》》》》》》》》》》》》》》》》》》》》"+savePath);
            String newImageName = new Date().getTime() + file.getOriginalFilename();//文件重命名，防止重复
            String imagePath = savePath + "/"+ newImageName;//文件保存绝对路径
//			System.out.println("imagePath》》》》》》》》》》》》》》》》》》》》》"+imagePath);
            try {
                FileOutputStream os = new FileOutputStream(imagePath);
                InputStream in = file.getInputStream();
                int b = 0;
                while((b=in.read()) != -1)	{
                    os.write(b);
                }
                os.flush();
                os.close();
                in.close();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
                return MyResult.getResult(0,"文件上传错误","");
            }
            userService.updateImage(user.getUserId(),basePath+"/"+newImageName);
            Map<String , Object> map = new HashMap<String, Object>();
            map.put("image",user.getUserImage());
            return MyResult.getResult(1,"",map);
        }else {
            return MyResult.getResult(0,"上传文件为空","");
        }

    }


    // 查看用户个人收藏夹
    @RequestMapping(value = "collection")
    public  ModelAndView userCollection(){
        User user = (User)getSession().getAttribute("user");
        //collectionList包括了拍卖品名，可以直接调用
        ModelAndView mav=new ModelAndView("collection");
        List<Collection> collectionList = collectionService.getCollection(user.getUserId());
        int collectionnum=collectionList.size();
        List<String> goodNames=new ArrayList<String>();
        List<Double> goodPrices=new ArrayList<Double>();
        for(int i=0;i<collectionnum;i++) {
            goodNames.add((goodService.findGoodById(collectionList.get(i).getGoodId()).getGoodName()));
            goodPrices.add((goodService.findGoodById(collectionList.get(i).getGoodId()).getCurrPrice()));
        }
        mav.addObject("collectionList",collectionList);
        mav.addObject("goodNames",goodNames);
        mav.addObject("goodPrices",goodPrices);
        return mav;
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
    public ModelAndView usersTorders(){
        User user = (User)getSession().getAttribute("user");
        List<Torder> orders=torderService.getUserAllTorders(user.getUserId());
        ModelAndView mav=new ModelAndView("userOrder");
        int ordernum=orders.size();
        List<String> goodNames=new ArrayList<String>();
        for(int i=0;i<ordernum;i++) {
            goodNames.add((goodService.findGoodById(orders.get(i).getGoodId()).getGoodName()));
        }
        mav.addObject("orders",orders);
        mav.addObject("goodNames",goodNames);

        return mav;
    }
}
