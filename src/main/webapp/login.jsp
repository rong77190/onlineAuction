<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" /> 
<title>用户登录</title>


<!-- Place favicon.ico in the root directory -->

<!-- build:css styles\vendor.css -->
<!-- bower:css -->
<link rel="stylesheet" href="<c:url value='resources/js/bootstrap-select/dist/css/bootstrap-select.min.css?version=20160108'/>">
<link rel="stylesheet" href="<c:url value='resources/js/bootstrap/dist/css/bootstrap.min.css?version=20160108' />">

<!-- endbower -->
<!-- endbuild -->

<!-- build:css styles\main.css -->

<link rel="stylesheet" href="<c:url value='resources/css/app/main.css?version=20160108' />">
<link rel="stylesheet" href="<c:url value='resources/css/app/mycss.css?version=20160108' />">

</head>
<body>

<div id="context" class="container">
  <div class="row">
    <div style="height:100px">
  </div>

  <div class="col-xs-7" style="padding:30px 60px 20px 60px; box-shadow: 1px 1px 3px #666;border-radius: 0.3em;" id="container4context">
    <span class="label label-info" style="font-size:1.5em; margin:1em 0 1em 1em;">系统登录</span>
    <form action="<c:url value='/j_spring_security_check'/>" method="post">
      <ul style="padding-left: 1em;">
        <li style="list-style-type:none; padding:1em 0 1em 0">
          <span style="display:-moz-inline-box;display:inline-block;width:4em; text-align:center; font-size:1.5em; font-weight:bold;">用户名</span>
          <input type="text"  id="userName"  name="userName" placeholder="用户名"  autocomplete="off" style="font-size:1.5em; border:1px solid #ccc; border-radius:0.3em; text-indent:0.5em;" required="required">
        </li>
        <li style="list-style-type:none; padding:1em 0 1em 0;">
          <span style="display:-moz-inline-box;display:inline-block;width:4em; text-align:center; font-size:1.5em; font-weight:bold;">密码</span>
          <input type="password"  id="password"  name="password" placeholder="密码"  autocomplete="off" style="font-size:1.5em; border:1px solid #ccc; border-radius:0.3em; text-indent:0.5em;" required="required">
        <span><a href="resetPassword.jsp" >忘记密码</a></span>
        </li >
        <li style="list-style-type:none; padding:1em 0 1em 0;">
          <span style="display:-moz-inline-box;display:inline-block;width:4em; text-align:center; font-size:1.5em; font-weight:bold;">验证码</span>
          <input id="validCode" name="validCode" type="text" placeholder="验证码"  style="font-size:1.5em;width: 130px; border:1px solid #ccc; border-radius:0.3em; text-indent:0.5em;" required="required">
          <img alt="验证码" title="点击更换" id="img_captcha" height="30px;" width="90px;" onclick="this.src='${ctx}/login/getNewValidCode?id='+Math.random();" src="${ctx}/login/getNewValidCode"/> <a id="kanbuq" onclick="javascript:refreshCaptcha();" href="javascript:;">看不清，换一张</a>
        </li>
        <li style="list-style-type:none;padding:0.5em 0 0.5em 0.8em;">
          <input type="button" onclick="checkin()" value="登陆" style="padding:0.4em 1em; color:#fff; font-size:1.2em; height:100%; border:none; border-radius:0.3em; background-color:#5bc0de;">
          <input type="button" onclick="register()" value="注册" style="padding:0.4em 1em; color:#fff; font-size:1.2em; height:100%; border:none; border-radius:0.3em; background-color:#ffaa25;">
        </li>
      </ul>
    </form>
  </div>
  <div class="col-xs-5" style="padding:30px">
    <img src="<c:url value='resources/images/snow.png' />">
  </div>
</div>
</div>

<div id="request_error" style="display:none; width: auto; ">
   <span></span> 
   <div class="cloaeMessage"></div>
</div>

<script type="text/javascript" src="<c:url value='resources/js/jquery.min.js' /> "></script>
<script type="text/javascript" src="<c:url value='resources/js/myFunction.js' /> "></script>

</body>
<script type="text/javascript">
    function register(){
    	window.location = "<c:url value='register.jsp' />";
    }
    function checkin(){
        var data = {
            "userName":$("#userName").val(),
            "password":$("#password").val(),
            "validCode":$("#validCode").val(),
        }

        $.ajax({
            type: "post",
            url: "/login/login",
            data: data,
            dataType: "json",
            success:function(data){
                if (data.status=="0"){
                    alert("登录失败");
                }
                if (data.status=="1"){
                    alert("登陆成功");
                }
                <%--showMessage(data.updated,true,"#form");--%>
                <%--$("body").animate({scrollTop:0},200);--%>
//                setTimeout(function(){
                    <%--window.location = "<c:url value='index.jsp'/>";--%>
//                },1500);
            }
//            error:function(XMLHttpRequest){
//                showMessage(XMLHttpRequest.responseJSON["not-found"],false,"#form");
//            }
        });
    	<%--window.location = "<c:url value='loginEnd.jsp' />";--%>
    }
    
    var wait = setInterval(function(){ 
    	if((window.location.href).split('=')[1] == "true"){  
    	var left = $("#nail").offset().left + $("#nail").width() + 10 ;
    	$("#request_error").css("left",left + "px");
        clearInterval(wait);  
        //执行code  
        showMessage("用户名或密码错误！",false,"#nail");
    }  
 },200); 
</script>
</html>