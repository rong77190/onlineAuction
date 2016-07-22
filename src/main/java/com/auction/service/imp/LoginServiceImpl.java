package com.auction.service.imp;

import com.auction.dao.UserMapper;
import com.auction.model.Login;
import com.auction.model.Register;
import com.auction.model.User;
import com.auction.service.LoginService;
import com.auction.util.Mail.MailSenderInfo;
import com.auction.util.Mail.SimpleMailSender;
import com.auction.util.MyResult;
import com.auction.util.ValidCodeGenerator;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by dell on 2016/7/19.
 */
@Service
public class LoginServiceImpl implements LoginService{


    @Resource
    private UserMapper userMapper;
    @Resource
    private ValidCodeGenerator validCodeGenerator;

    public User login(Login login) {
        String userName = login.getUserName();
        String password = login.getPassword();
        return userMapper.login(userName,password);
    }


    public int register(Register register) {
        User user = new User();
        user.setUserName(register.getUserName());
        user.setPhone(register.getPhone());
        user.setPassword(register.getPassword());
        user.setUserEmail(register.getUserEmail());
        return userMapper.insertSelective(user);
    }

    /**
     * 生成新的登陆验证码
     * @param request
     * @param response
     * @param session
     */
    public void generateNewValidCode(HttpServletRequest request, HttpServletResponse response, HttpSession session){
        String validCode=validCodeGenerator.getRandcode(request,response);
        session.setAttribute("loginValidCode",validCode);
    }



    public Object SendValidCodeToEmail(String userEmail, HttpSession session) {
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
        mailInfo.setSubject("雪崩拍卖系统用户注册验证码");
        // 邮件内容
        StringBuffer sb=new StringBuffer("点击下面链接查看验证码，48小时生，否则需要重新获取，链接只能使用一次，请尽快使用！</br>");
//		sb.append("<a href=\"http://localhost:8080/user/activateEmail?userEmail=");
        sb.append("你的验证码是：");
        sb.append(session.getAttribute("registerValidCode"));
        mailInfo.setContent(sb.toString());
        // 发送邮件
        SimpleMailSender sms = new SimpleMailSender();
//         1.发送文体格式
        boolean b = sms.sendTextMail(mailInfo);
        // 2.发送html格式
//        boolean b = SimpleMailSender.sendHtmlMail(mailInfo);
        if (b){
            System.out.println("邮件发送");
            return MyResult.getResult();
        }else {
            return MyResult.getResult(0,"发送失败","");
        }
    }



}
