package com.auction.task;

import com.auction.model.Deposit;
import com.auction.model.Good;
import com.auction.model.Torder;
import com.auction.model.User;
import com.auction.service.*;
import com.auction.util.Mail.MailSenderInfo;
import com.auction.util.Mail.SimpleMailSender;
import com.auction.util.StringUtil;
import org.slf4j.Logger;

import javax.annotation.Resource;
import java.text.ParseException;
import java.util.*;

/**
 * Created by xiechur on 2016/11/30/030.
 */
public class FinishAuction {
    private static final transient Logger log = org.slf4j.LoggerFactory.getLogger(FinishAuction.class);
    @Resource
    private GoodService goodService;
    @Resource
    private TorderService torderService;
    @Resource
    private UserService userService;
    @Resource
    private DepositService depositService;


    //获取正在拍卖的拍品。
    //如果过了时间就set 状态为结束
    //结束时新建一个订单
    //返回其他人的押金
    public void checkCompleteTime() throws ParseException {
        List<Good> goodList = goodService.getAuctioningGood();//即状态为1
        for (int i =0; i < goodList.size(); i++){
            Good good = goodList.get(i);
            if (good.getCompleteTime().before(new Date())) {

                good.setGoodState(2);//设置为结束
                int result = goodService.updateGood(good);
                if (result > 0) {
                    log.debug("goodId:" + good.getGoodId() + "拍品更新状态为结束成功");
                } else {
                    log.debug("goodId:" + good.getGoodId() + "拍品更新状态为结束失败");
                }
                Torder torder = new Torder();
                torder.setCreateTime(new Date());
                torder.setGoodId(good.getGoodId());
                torder.setOrderPrice(good.getCurrPrice());
                torder.setUserId(good.getBuyerId());
                torder.setOrderState(0);
                int result2 = torderService.addOrder(torder);
                Map<String,Object> map = new HashMap<String, Object>();
                map.put("goodName", StringUtil.formatLike(good.getGoodName()));
                if (result2 > 0){
                    log.debug("生成订单成功");
                    User user = userService.findById(good.getBuyerId());
                    System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"+user.toString());
                    String userEmail = user.getUserEmail();
                    map.put("userName",StringUtil.formatLike(user.getUserName()));
                    // 设置邮件服务器信息
                    MailSenderInfo mailInfo = new MailSenderInfo();
                    //  mailInfo.setMailServerHost("smtp.163.com");
                    mailInfo.setMailServerHost("smtp.126.com");
                    mailInfo.setMailServerPort("25");
                    mailInfo.setValidate(true);
                    // 邮箱用户名
                    //  mailInfo.setUserName("18826077190@163.com");
                    mailInfo.setUserName("a18826077190@126.com");
                    // 邮箱密码
                    mailInfo.setPassword("xiechur123");//可使用邮箱 客户端的授权码
                    // 发件人邮箱
                    mailInfo.setFromAddress("a18826077190@126.com");
                    // 收件人邮箱
                    mailInfo.setToAddress(userEmail);
                    // 邮件标题
                    mailInfo.setSubject("雪崩拍卖系统订单邮件");
                    // 邮件内容
                    StringBuffer sb=new StringBuffer("点击下面链接查看你的订单，请尽快 进行支付，否则扣去押金</br>");
                    sb.append("你的订单链接是：");
                    sb.append("http://localhost:8080/order/"+torderService.find(map).get(0).getOrderId());
                    mailInfo.setContent(sb.toString());
                    // 发送邮件
                    SimpleMailSender sms = new SimpleMailSender();
        //         1.发送文体格式
                    boolean b = sms.sendTextMail(mailInfo);
                    // 2.发送html格式
        //        boolean b = SimpleMailSender.sendHtmlMail(mailInfo);
                    if (b){
                        log.debug("邮件发送成功");
                    }else {
                        log.debug("邮件发送失败");
                    }


                    //返还押金
                    Map<String,Object> map2 = new HashMap<String, Object>();
                    map2.put("goodId",good.getGoodId());
//                    map2.put("userId",good.getBuyerId());
                    List<Deposit> depositList = depositService.find(map2);
//                    System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<");
                    Deposit deposit = new Deposit();
                    for (int j= 0;j < depositList.size(); j++){
//                        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>"+depositList.size());
                        deposit = depositList.get(j);
//                        System.out.println(deposit.toString());
                        if (deposit.getUserId() != good.getBuyerId()){
                            User u = userService.findById(deposit.getUserId());
                            u.setBalance(u.getBalance()+deposit.getPrice());
                            deposit.setState(1);
                            synchronized (this){
                                userService.update(u);
                                depositService.update(deposit);
                            }
                            log.debug("返还押金"+deposit.getPrice()+"To 用户ID"+u.getUserId());
                        }
                    }

                }else {
                    log.debug("生成订单失败");
                }

            }

        }


    }
}
