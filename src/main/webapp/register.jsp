<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" /> 
<title>用户注册</title>


<!-- Place favicon.ico in the root directory -->

<!-- build:css styles\vendor.css -->
<!-- bower:css -->
<link rel="stylesheet" href="<c:url value='resources/js/bootstrap-select/dist/css/bootstrap-select.min.css?version=20160108'/>">
    <link rel="stylesheet" href="<c:url value='resources/js/bootstrap/dist/css/bootstrap.min.css?version=20160108' />">
    <script src="static/jquery/1.9.1/jquery.js"></script>
    <script src="birthday.js"></script>
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
    <span class="label label-info" style="font-size:1.5em; margin:1em 0 1em 1em;">用户注册</span>
    <form action="<c:url value=''/>" method="post">
      <ul style="padding-left: 1em;">
        <li style="list-style-type:none; padding:1em 0 0.8em 0">
          <span style="display:-moz-inline-box;display:inline-block;width:5em; text-align:center; font-size:1.5em; font-weight:bold;">用户名</span>
          <input type="text"  id="userName"  name="userName" autocomplete="off" style="font-size:1.5em; border:1px solid #ccc; border-radius:0.3em; text-indent:0.5em;" onclick="cleanMessage()" onblur="checkUser()">
            <label id="userTip"></label>
        </li>


         <li style="list-style-type:none; padding:0.8em 0 0.8em 0;">
          <span style="display:-moz-inline-box;display:inline-block;width:5em; text-align:center; font-size:1.5em; font-weight:bold;">密码</span>
                   <input type="password"  id="password"  name="password"  autocomplete="off" style="font-size:1.5em; border:1px solid #ccc; border-radius:0.3em; text-indent:0.5em;" onclick="cleanMessage()" onblur="checkPassword()">
          <label id="passwordTip"></label>         </li>

          <li style="list-style-type:none; padding:0.8em 0 0.8em 0;">
              <span style="display:-moz-inline-box;display:inline-block;width:5em; text-align:center; font-size:1.5em; font-weight:bold;">电话号码</span>
              <input type="phone"  id="phone"  name="phone"  autocomplete="off" style="font-size:1.5em; border:1px solid #ccc; border-radius:0.3em; text-indent:0.5em;" onclick="cleanMessage()" onblur="checkPhone()">
              <label id="phoneTip"></label>
          </li>

          <li style="list-style-type:none; padding:0.8em 0 0.8em 0;">
              <span style="display:-moz-inline-box;display:inline-block;width:5em; text-align:center; font-size:1.5em; font-weight:bold;">生日</span>
              <select id= "year" class="sel_year" rel="2000"> </select> 年
              <select id="month" class="sel_month" rel="2"> </select> 月
              <select id="day" class="sel_day" rel="14"> </select> 日


          </li>

          <li style="list-style-type:none; padding:0.8em 0 0.8em 0;">
          <span style="display:-moz-inline-box;display:inline-block;width:5em; text-align:center; font-size:1.5em; font-weight:bold;">E-mail</span>
          <input type="text"  id="userEmail"  name="userEmail"  autocomplete="off" style="font-size:1.5em; border:1px solid #ccc; border-radius:0.3em; text-indent:0.5em;" onclick="cleanMessage()"onblur="checkEmail()">
          <button type="button" onclick="send()">发送验证码</button>
              <div id="emailTip"></div>
        </li>
        
        
             <li style="list-style-type:none; padding:0.8em 0 0.8em 0;">
          <span style="display:-moz-inline-box;display:inline-block;width:5em; text-align:center; font-size:1.5em; font-weight:bold;">验证码</span>
          <input type="text"  id="validCode"  name="validCode"  autocomplete="off" style="font-size:1.5em; border:1px solid #ccc; border-radius:0.3em; text-indent:0.5em;" onclick="cleanMessage()" onblur="checkvalidCode()">
                 <label id="validCodeTip"></label>
        </li> 
        <%----%>
        <%--<li style="list-style-type:none; padding:0.8em 0 0.8em 0;">&ndash;%&gt;--%>
          <%--<span style="display:-moz-inline-box;display:inline-block;width:5em; text-align:center; font-size:1.5em; font-weight:bold;">E-mail</span>--%>
          <%--<input type="text"  id="userEmail"  name="email"  autocomplete="off" style="font-size:1.5em; border:1px solid #ccc; border-radius:0.3em; text-indent:0.5em;">--%>
        <%--</li>--%>
        <%----%>
      <!--   <li style="list-style-type:none; padding:0.8em 0 0.8em 0;">
          <span style="display:-moz-inline-box;display:inline-block;width:5em; text-align:center; font-size:1.5em; font-weight:bold;">密码</span>
          <input type="password"  id="password"  name="password"  autocomplete="off" style="font-size:1.5em; border:1px solid #ccc; border-radius:0.3em; text-indent:0.5em;">
        </li> -->
        
      <!--   <li style="list-style-type:none; padding:0.8em 0 0.8em 0;">
          <span style="display:-moz-inline-box;display:inline-block;width:5em; text-align:center; font-size:1.5em; font-weight:bold;">确认密码</span>
          <input type="password"  id="rpassword"  name="rpassword"  autocomplete="off" style="font-size:1.5em; border:1px solid #ccc; border-radius:0.3em; text-indent:0.5em;">
        </li>
        
         -->
          <p></p>
        <li style="list-style-type:none;padding:0.5em 0 0.5em 0.8em;">
          <input type="button" onclick="finish()" value="确定" style="padding:0.4em 1em; color:#fff; font-size:1.2em; height:100%; border:none; border-radius:0.3em; background-color:#5bc0de;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" onclick="cancle()" value="取消" style="padding:0.4em 1em; color:#fff; font-size:1.2em; height:100%; border:none; border-radius:0.3em; background-color:#ffaa25;">
        </li>
      </ul>
    </form>
  </div>
  <div class="col-xs-5" style="padding:30px">
    <img src="<c:url value='resources/images/snow.png ' />">
  </div>
</div>
</div>

<script type="text/javascript" src="<c:url value='resources/js/jquery.min.js' /> "></script>
<script type="text/javascript" src="<c:url value='resources/js/jquery.cookie.js' /> "></script>

</body>
<script type="text/javascript">
	function cancle(){
		window.location = "<c:url value='login.jsp' />";
	}
	
	function finish(){

        var data = {
            "userName":$("#userName").val(),
            "password":$("#password").val(),
            "validCode":$("#validCode").val(),
            "userEmail":$("#userEmail").val()
        }

        $.ajax({
            type: "post",
            url: "/login/register",
            data: data,
//            data:"userEmail="+a,
//            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success:function(data){
                if (data.status=="0"){
                    alert("注册失败")
                }
                if (data.status=="1"){
                    alert("注册成功")
                }
                    showMessage(data.updated,true,"#form");
                $("body").animate({scrollTop:0},200);
                setTimeout(function(){
                    window.location = "<c:url value='index.jsp'/>";
                },1500);
            },
            error:function(XMLHttpRequest){
                showMessage(XMLHttpRequest.responseJSON["not-found"],false,"#form");
            }
        });
	}


    function checkUser(){
        var userName = $("#userName").val(); //获取用户名进行判断
        if(userName!=""){

            $.ajax({
                type: "POST",
                url: "/login/register",    //这里的url为Servlet配置xml文件的路径
                data: $("#userName").serialize(),  //获取form表单所又内容
                success: function(ma){
                    ma=$.parseJSON(ma);  //获取Servlet传过来的JSON数据
                    if(ma.success=="true"){
                        document.getElementById("userTip").innerHTML="用户名已被占用";

                    }else{
                        document.getElementById("userTip").innerHTML="用户名可以使用";
                    }
                }
            });

        }else{
            document.getElementById("userTip").innerHTML="用户名不能为空";
        }
    }
    function checkPassword(){
        var password = $("#password").val(); //获取password进行判断
        if(password!=""){
                        document.getElementById("passwordTip").innerHTML="";
        }else{
            document.getElementById("passwordTip").innerHTML="密码不能为空";
        }
    }
    function checkPhone(){
        var phone = $("#phone").val(); //获取phone进行判断
        if(phone!=""){
            document.getElementById("phoneTip").innerHTML="";
        }else{
            document.getElementById("phoneTip").innerHTML="请填写您的联系电话";
        }
    }
    function checkEmail(){
        var email = $("#email").val(); //获取phone进行判断
        if(email!=""){
            document.getElementById("emailTip").innerHTML="";
        }else{
            document.getElementById("emailTip").innerHTML="请填写您的电子邮箱";
        }
    }
    function checkValidCode(){
        var validCode = $("#validCode").val(); //获取phone进行判断
        if(validCode!=""){
            document.getElementById("validCodeTip").innerHTML="";
        }else{
            document.getElementById("validCodeTip").innerHTML="请输入您收到的验证码";
        }
    }
    function cleanMessage(){
        document.getElementById("usernameTip").innerHTML=" ";
        document.getElementById("passwordTip").innerHTML=" ";
        document.getElementById("phoneTip").innerHTML=" ";
        document.getElementById("emailTip").innerHTML=" ";
        document.getElementById("validCodeTip").innerHTML=" ";
    }

    function send(){
//        var a = $("#userEmail").val();
//        alert(a);
		 var data = {
             "userEmail":$("#userEmail").val()
	    }
		  $.ajax({
		        type: "post",
		        url: "/login/sendEmail",
//		        data: JSON.stringify(data),
                data:data,
//		        contentType: "application/json; charset=utf-8",
		        dataType: "json",
		        success:function(data){

                    if(data.status==0){
                            alert("请输入正确的邮箱格式");
                        window.location=" <c:url value='index.jsp'/>";}

		        	if (data.status==1){
                        alert("成功");
                        window.localtion ="<c:url value='index.jsp'/>";
                    }

//		        	showMessage(data.updated,true,"#form");
//		        	$("body").animate({scrollTop:0},200);
//		            setTimeout(function(){
		            	<%--window.location = "<c:url value='index.jsp'/>";--%>
//		            },1500);
		        },
		        error:function(XMLHttpRequest){
		        	showMessage(XMLHttpRequest.responseJSON["not-found"],false,"#form");		
				}
		    });
	  };
</script>

<script type="text/javascript" src="birthday.js"></script>
<script>
    $(function () {
        $.ms_DatePicker({
            YearSelector: ".sel_year",
            MonthSelector: ".sel_month",
            DaySelector: ".sel_day"
        });
        $.ms_DatePicker();
    });
</script>


</html>