<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" /> 
<title>SnowSlide大学生拍卖平台</title>


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

<link rel="stylesheet" href="<c:url value='resources/js/Datepicker/css/jquery-ui.css?version=20160108' />">



</head>
<body>

<!--[if lt IE 10]>
  <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http:\\browsehappy.com\">upgrade your browser</a> to improve your experience.</p>
<![endif]-->

<header>
  <nav class="navbar navbar-fixed-top navbar-default " style="background-color:transparent">
    <div id="nav_sec" class="container-fluid gradualChange" style="background-color:transparent">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header" style="background-color:transparent">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">SnowSlide大学生拍卖平台</a>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav navbar-right">
          <!-- 
          <li class="active"><a href="#"style="background-color:transparent">首页 <span class="sr-only">(current)</span></a></li>
          <li><a href="#" style="background-color:transparent">企业管理</a></li>
           -->
           
          <!-- 
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="background-color:transparent">高校研究院 <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="#">高校</a></li>
              <li><a href="#">科研院所</a></li>
            </ul>
          </li> 
          -->
          
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="background-color:transparent">拍卖管理 <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="<c:url value='/user/collection'/>">我的收藏</a></li>
              <li><a href="<c:url value='/page.jsp'/>">我的拍卖</a></li>
                   <li><a href="<c:url value='/index.jsp'/>">回到主页</a></li>
            </ul>
  <%--         </li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="background-color:transparent">后台管理 <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="<c:url value='/sec/userManager'/>">用户管理</a></li>
              <li><a href="<c:url value='/sec/roleManager'/>">角色管理</a></li>
              <li><a href="<c:url value='/sec/resource'/>">资源管理</a></li>
              <li><a href="<c:url value='/sec/resourceSort'/>">资源排序</a></li>
            </ul>
          </li>
           --%>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="background-color:transparent">个人中心 <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="<c:url value='/WEB-INF/pages/user/user.jsp'/>">个人信息</a></li>
              <li><a href="<c:url value='/logout'/>">退出登录</a></li>
            </ul>
          </li>

        </ul>
      </div><!-- \.navbar-collapse -->
    </div><!-- \.container-fluid -->
     <div class="container" style="text-align:center;width:90%;">
      <div class="row">
      <div class="col-lg-10 col-lg-offset-2">
      <div style="margin:0 -15px;" id="nav_id"></div>
      </div>
      </div>
    </div>
  </nav>
</header>


<!-- 项目主体内容 -->
<script type="text/javascript" src="<c:url value='resources/js/jquery.min.js' /> "></script>
<script type="text/javascript" src="<c:url value='resources/js/jquery.cookie.js' /> "></script>

<script type="text/javascript" src="<c:url value='resources/js/bootstrap-select/dist/js/bootstrap-select.js' /> "></script>

<script type="text/javascript" src="<c:url value='resources/js/myFunction.js' /> "></script>

<script type="text/javascript" src="<c:url value='resources/js/ckEditor/ckeditor.js' /> "></script>



