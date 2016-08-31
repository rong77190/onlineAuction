<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" /> 
<title>SnowSlideTeam</title>
<!-- Place favicon.ico in the root directory -->

<!-- build:css styles\vendor.css -->
<!-- bower:css -->
<link rel="stylesheet" href="<c:url value='/resources/js/bootstrap-select/dist/css/bootstrap-select.min.css?version=201100108'/>">
<link rel="stylesheet" href="<c:url value='/resources/js/bootstrap/dist/css/bootstrap.min.css?version=201100108' />">

<!-- endbower -->
<!-- endbuild -->

<!-- build:css styles\main.css -->

   <link rel="stylesheet" href="css/bootstrap.min.css">
    <script type="text/javascript" src="resources/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<c:url value='resources/css/app/main.css?version=201100108' />">
<link rel="stylesheet" href="<c:url value='resources/css/app/mycss.css?version=201100108' />">
<link rel="stylesheet" href="<c:url value='resources/css/app/CommonStyle.css?version=201100108' />">
<link rel="stylesheet" href="<c:url value='resources/css/app/HomeStyle.css?version=201100108' />">
<link rel="stylesheet" href="<c:url value='resources/css/app/item.css?version=201100108' />">
<link rel="stylesheet" href="<c:url value='resources/css/app/Nav.css?version=201100108' />">
<link rel="stylesheet" href="<c:url value='resources/css/app/Pro.css?version=201100108' />">
</head>
<meta charset="UTF-8">
    <title>项目页</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script type="text/javascript" src="resources/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css-index/CommonStyle.css">
    <link rel="stylesheet" type="text/css" href="css-index/HomeStyle.css">
    <link rel="stylesheet" type="text/css" href="css-index/Nav.css">
    <link rel="stylesheet" type="text/css" href="css-index/Pro.css">
    <script type="text/javascript">
        $(function(){

            $(".pro-panel-img > img").each(function(){
                if (($(this)).width < $(this).height){
                    $(this).width("100%")
                }
                else{
                    $(this).height("100%")
                }
            });

            $(".pro-sm-img > img").each(function(){
                if (($(this)).width < $(this).height){
                    $(this).width("100%")
                }
                else{
                    $(this).height("100%")
                }
            });

            $("#brows").mouseenter(function(){

                $this=$(this);
                b = setTimeout(function(){
                    $("#brows-menu").slideDown("fast")
                },150);

            }).mouseleave(function(){

                clearTimeout(b)

            });

            $("#browsbody").mouseleave(function(){
                $("#brows-menu").slideUp("fast")
            });

            $("#start").mouseenter(function(){

                $this=$(this);
                c = setTimeout(function(){
                    $("#start-menu").slideDown("fast")
                },150);

            }).mouseleave(function(){

                clearTimeout(c)

            });

            $("#startbody").mouseleave(function(){
                $("#start-menu").slideUp("fast")
            });

            $(".nav a").click(function(e){
                e.preventDefault()
                $(this).tab('show')
            });

            $(".comment-portrait img").each(function(){
                if (($(this)).width < $(this).height){
                    $(this).width("100%")
                }
                else{
                    $(this).height("100%")
                }
            });

            $(".comment-sm-btn").click(function(){
                $this = $(this);
                var $x = $this.closest(".outer-defined").find(".for-comment");
                var $t = $x.find("textarea");
                var $v = $this.closest("tr").find("h4");
                var $s = $x.css("display");
                if($s == "none"){
                    $t.attr("placeholder","回复"+$v.html());
                    $x.show();
                }
                else {
                    if($t.attr("placeholder") == "回复"+$v.html()){
                        $x.hide();
                    }
                    else{
                        $t.attr("placeholder","回复"+$v.html());
                    }
                }
            });

            $(".tip-rec").click(function(){
                $("#login-tip").show();
                $(".modal-backdrop-defined").show();
            });

            $("#close-tip").click(function(){
                $("#login-tip").hide();
                $(".modal-backdrop-defined").hide();
            });

            $(".pro-sm-img > img").click(function(){
                $this = $(this);
                var b = $this.attr("src");
                $(".pro-sm-img").removeClass("active");
                $this.closest(".pro-sm-img").addClass("active");
                $(".pro-panel-img > img").attr("src",b);
            });

        })
    </script>
</head>
<body>
    <div class="modal-backdrop-defined"></div>
    <div class="modal-defined" id="login-tip">
        <div class="modal-dialog-defined">
            <div class="modal-content-defined">
                <div class="modal-header-defined">
                    <button type="button" class="close" id="close-tip">&times;</button>
                    <h4 class="modal-title-defined">登录提示</h4>
                </div>
                <div class="modal-body-defined">
                    <%--<P>请先登录才可查看已参与项目或发起众筹</P>--%>
                </div>
                <div class="modal-footer-defined">
                    <a href="login.jsp"><button class="btn-sm-glass-black" data-dismiss="modal">登录</button></a>
                    <a href="register.html"><button class="btn-sm-glass-black" data-dismiss="modal">注册</button></a>
                </div>
            </div>
        </div>
    </div>
    <div class="body-type">
        <div class="navbar-defined">
            <div class="navbar-left-defined">
                <a href="Login.html"><button class="btn btn-sm-glass">登录</button></a>
                <a href="register.html"><button class="btn btn-sm-glass">注册</button></a>
            </div>
            <div class="navbar-user">
                <a class="data-inline" href="#">用户名</a>
                <h4 class="data-inline">|</h4>
                <a class="data-inline" href="#">登出</a>
            </div>
            <div class="navbar-right-defined">
                <a href="Home.html"><button class="btn btn-glass">首页</button></a>
                <div style="display: inline-block;position: relative" id="browsbody">
                  <!--   <button class="btn btn-glass" id="brows">项目浏览</button> -->
                    <ul class="down-menu" id="brows-menu">
                        <li class="one"><a href="#">食品</a></li>
                        <li class="two"><a href="#">玩具</a></li>
                        <li class="three"><a href="#">户外</a></li>
                        <li class="four"><a href="#">科技</a></li>
                    </ul>
                </div>
                <a class="tip-rec" href="#">
                <!--     <button class="btn btn-glass">已参与项目</button> -->
                </a>
                <div style="display: inline-block;position: relative" id="startbody">
                  <a href="page.jsp">  <button class="btn btn-glass tip-rec" id="start">我的拍卖</button></a>                    <ul class="down-menu" id="start-menu">
                        <li class="one"><a class="tip-rec" href="#">食品</a></li>
                        <li class="two"><a class="tip-rec" href="#">玩具</a></li>
                        <li class="three"><a class="tip-rec" href="#">户外</a></li>
                        <li class="four"><a class="tip-rec" href="#">科技</a></li>
                    </ul>
                </div>
                <form style="display: inline-block">
                    <div style="position: relative">
                        <input type="text" class="search-bar" placeholder="Search">
                        <div class="magnifier"></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="header-top-defined"></div>
    <div class="header-defined-child">
        <div class="body-type">
            <div class="head-caption">
                <h1>Daisy Perfume </h1>
            </div>
            <div class="head-logo"></div>
        </div>
    </div>
    <div class="body-type">
       
        <div class="body-panel">
            <div class="pro-panel-img">
                <img src="resources/images/perfume1.jpg">
            </div>
            <div class="pro-img-container">
                <div class="pro-sm-img active"><img src="resources/images/perfume3.jpg"></div>
                <div class="pro-sm-img"><img src="resources/images/orange.jpg"></div>
                <div class="pro-sm-img"><img src="resources/images/orange1.jpg"></div>
            </div>
           
            <h3>Daisy Perfume</h3>
            <h4>类别：化妆品</h4>
          <!--   <h2>项目名称</h2> -->
            <div class="divider-defined"></div>
            <h3>产品详情</h3>
            <p><font style="line-height:2;">
                Daisy小雏菊香水的设计风格体现了无限的成熟魅力，兼具了年轻与活力，在不经意间的放肆中展示着自己独有的魅惑。瓶身可说就是奢侈感受的体现，绝美清透的玻璃塑造出柔和圆润的边缘外形，简直就是所有女性美的代名词。光滑流线型的外表给人纯洁美好的感受。</font>
            </p>
            <!-- <h2>众筹目标</h2>
            <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget odio.
            </p> -->
            <div style="height: 50px"></div>
        </div>
        <div class="body-panel min-h">
            <div class="body-panel-header">
                <ul class="nav nav-pills nav-pill-defined">
                    <li class="active">
                        <a href="#pandect" data-toggle="pill">项目总览</a>
                    </li>
                    <li>
                        <a href="#comment" data-toggle="pill">
                            <span class="badge pull-right">45</span>竞拍历史
                        </a>
                    </li>
                   
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="pandect">
                        <div class="body-panel-content">
                            当前价￥<h3 id="onceprice" >270</h3>
                            <div class="progress bar-defined">
                                <div class="progress-bar progress-bar-warning" style="width: 60%"></div>
                            </div>
                           起拍价￥：200
                            <div class="divider-defined"></div>
                             <div style="text-align: center">
               一口价：500￥<a href="good1End.jsp"> <button id="once" class="btn btn-glass-black"><font color="red">一口价拿下</font></button></a>
            加价：20￥         <button class="btn btn-glass-black" onclick="getSold()">加价</button>
                <button class="btn btn-glass-black">收藏</button>
            </div>
                            热度
                            <div class="progress bar-defined">
                                <div class="progress-bar progress-bar-danger" style="width: 80%"></div>
                            </div>
                            <div class="divider-defined"></div>
                            拍卖时间：<h3  class="data-time">2016年08月28日</h3> 至 <h3 class="data-time">2016年09月05日</h3>
                            <div class="progress bar-defined">
                                <div class="progress-bar progress-bar-success" style="width: 63%"></div>
                            </div>
                            剩余天数：5天
                        </div>
                    </div>
                    <div class="tab-pane" id="comment">
                        <div class="body-panel-content">
                            <form>
                                <fieldset>
                                    <textarea class="form-control comment-area" placeholder="发出评论或提问"></textarea>
                                    <button type="button" class="btn btn-sm-glass-black pull-right">发表</button>
                                    <div style="height: 35px"></div>
                                    <table class="table">
                                        <tr class="outer-defined">
                                            <td class="for-portrait">
                                                <div class="comment-portrait">
                                                    <img src="tu/portrait.jpg">
                                                </div>
                                            </td>
                                            <td align="left">
                                                <h4>用户名</h4>
                                                <p>kafe sdhur fdjsk fdresk dsfur fdgreu fdyuef sauri grirre fdyerea dsrr trte bscx mnkdg ldf aed zxxcse mgbir gdf  hjjhu hfgvgt cses gcbgvd dfgdd urtu ertrurff iopoon yujty fgee djtyfh rgtut</p>
                                                <h5 style="display: inline">5小时前</h5>
                                                <button type="button" class="comment-sm-btn">回复</button>
                                                <table class="comment-inner table">
                                                    <tr>
                                                        <td class="for-portrait">
                                                            <div class="comment-portrait">
                                                                <img src="tu/portrait.jpg">
                                                            </div>
                                                        </td>
                                                        <td align="left">
                                                            <h4>用户名1</h4>
                                                            <p>kafe sdhur fdjsk fdresk dsfur fdgreu fdyuef sauri grirre fdyerea dsrr trte bscx mnkdg ldf aed zxxcse mgbir gdf  hjjhu hfgvgt cses gcbgvd dfgdd urtu ertrurff iopoon yujty fgee djtyfh rgtut</p>
                                                            <h5 style="display: inline">5小时前</h5>
                                                            <button type="button" class="comment-sm-btn">回复</button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="for-portrait">
                                                            <div class="comment-portrait">
                                                                <img src="tu/portrait.jpg">
                                                            </div>
                                                        </td>
                                                       
                               <!--                  <td align="left">
                                                    <h4>用户名</h4>
                                                    支持金额￥<span class="data-money-sm">3</span>
                                                    <h5>5小时前</h5>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table class="table">
                                            <tr>
                                                <td class="for-portrait">
                                                    <div class="comment-portrait">
                                                        <img src="tu/portrait.jpg">
                                                    </div>
                                                </td>
                                                <td align="left">
                                                    <h4>用户名</h4>
                                                    支持金额￥<span class="data-money-sm">3</span>
                                                    <h5>5小时前</h5>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table> -->
                            <div class="center-defined">
                                <ul class="pagination">
                                    <li><a href="#">&laquo;</a></li>
                                    <li class="active"><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li><a href="#">&raquo;</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="body-footer-child"></div>

<script>
function getSold(){
	x=document.getElementById("onceprice");
	x.innerHTML="290"
}
function getEnd(){
	x=document.getElementById("endDate")
	x.innerHTML="拍卖结束"
}


/* function done(add) {
	  var xmlhttp;
	  if (window.XMLHttpRequest) {
	    xmlhttp = new XMLHttpRequest();
	  }
	  else {
	    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	  }
	  xmlhttp.onreadystatechange = function () {
	    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
	      document.getElementById("antzone").innerHTML = xmlhttp.responseText;
	    }
	  }
	  if (add != undefined) {
	    xmlhttp.open("get", "demo/ajax/net/count.ashx?keyword=add", true);
	  } else {
	    xmlhttp.open("get", "demo/ajax/net/count.ashx", true);
	  }
	  xmlhttp.send();
	}
	window.onload = function () {
	  var otxt = document.getElementById("txt");
	  var obt = document.getElementById("bt");
	  done();
	  obt.onclick = function () {
	    done("add");
	  }
	} */
</script>











</body>
</html>