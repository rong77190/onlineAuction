<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>忘记密码</title>


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
            <span class="label label-info" style="font-size:1.5em; margin:1em 0 1em 1em;">忘记密码</span>
            <form action="<c:url value=''/>" method="post">
                <ul style="padding-left: 1em;">
                    <li style="list-style-type:none; padding:1em 0 0.8em 0">
                        <span style="display:-moz-inline-box;display:inline-block;width:6.5em; text-align:center; font-size:1.5em; font-weight:bold;">用户名</span>
                        <input type="text"  id="userName"  name="userName"  autocomplete="off" style="font-size:1.5em; border:1px solid #ccc; border-radius:0.3em; text-indent:0.5em;">
                        <button type="button" onclick="sendResetCode()">发送验证码到注册邮箱</button>
                    </li>
                    <li style="list-style-type:none; padding:0.8em 0 0.8em 0;">
                        <span style="display:-moz-inline-box;display:inline-block;width:6.5em; text-align:center; font-size:1.5em; font-weight:bold;">输入新密码</span>
                        <input type="text"  id="resetPassword"  name="resetPassword"  autocomplete="off" style="font-size:1.5em; border:1px solid #ccc; border-radius:0.3em; text-indent:0.5em;">
                    </li>

                    <li style="list-style-type:none; padding:0.8em 0 0.8em 0;">
                        <span style="display:-moz-inline-box;display:inline-block;width:6.5em; text-align:center; font-size:1.5em; font-weight:bold;">验证码</span>
                        <input type="text"  id="validCode"  name="validCode"  autocomplete="off" style="font-size:1.5em; border:1px solid #ccc; border-radius:0.3em; text-indent:0.5em;">

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
                        <input type="button" onclick="cancel()" value="取消" style="padding:0.4em 1em; color:#fff; font-size:1.2em; height:100%; border:none; border-radius:0.3em; background-color:#ffaa25;">
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
    function cancel(){
        window.location = "<c:url value='index.jsp' />";
    }

    function finish(){
        var data = {
            "userName":$("#userName").val(),
            "password":$("#password").val(),
            "validCode":$("#validCode").val(),
        }

        $.ajax({
            type: "post",
            url: "/login/resetPassword",
            data: data,
//            data:"userEmail="+a,
//            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success:function(data){
                if (data.status=="0"){
                    alert("对不起，密码修改失败")
                }
                if (data.status=="1"){
                    alert("修改密码成功，请重新登录")
                    window.location ="<c:url value='login.jsp'/>";
                }

            }
        });
    }

    function sendResetCode(){
//        var a = $("#userName").val();
//        alert(a);
        var data = {
            "userName":$("#userName").val()
        }
        $.ajax({
            type: "post",
            url: "/login/sendResetValidCode",
//		        data: JSON.stringify(data),
            data:data,
//		        contentType: "application/json; charset=utf-8",
            dataType: "json",
            success:function(data){
                if (data.status==1){
                    alert("成功");

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

</html>