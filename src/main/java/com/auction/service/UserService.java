package com.auction.service;

import com.auction.model.User;

import java.util.List;
import java.util.Map;

/**
 * Created by xiechur on 2016/8/22.
 */
public interface UserService {

    int pay(int userId,double price);

    User findById(int userId);

//    User userInfo(int userId);

    int backDepositToUser(int userId,double price);

    List<User> selectAll();

    int add(User user);

    int update(User user);

    int userUpdate(String phone,String sex,String birthday);

    /**
     * 用户查询
     * @param map
     * @return
     */
    public List<User> find(Map<String, Object> map);
    /**
     * 获取总记录数
     * @param map
     * @return
     */
    public Long getTotal(Map<String, Object> map);
    /**
     * 修改用户
     * @param user
     * @return影响的记录数
     */

//    public int update(User user);

    /**
     * 添加用户
     * @param user
     * @return影响的记录数
     */
//    public int add(User user);

    /**
     * 删除用户
     * @param userId
     * @return
     */
    public int delete(Integer userId);
}
