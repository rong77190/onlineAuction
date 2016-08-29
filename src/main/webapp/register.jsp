<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" /> 
<title>政策管理-用户注册</title>


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
    <span class="label label-info" style="font-size:1.5em; margin:1em 0 1em 1em;">用户注册</span>
    <form action="<c:url value=''/>" method="post">
      <ul style="padding-left: 1em;">
        <li style="list-style-type:none; padding:1em 0 0.8em 0">
          <span style="display:-moz-inline-box;display:inline-block;width:5em; text-align:center; font-size:1.5em; font-weight:bold;">用户名</span>
          <input type="text"  id="username"  name="username"  autocomplete="off" style="font-size:1.5em; border:1px solid #ccc; border-radius:0.3em; text-indent:0.5em;">
        </li>
        
        <li style="list-style-type:none; padding:0.8em 0 0.8em 0;">
          <span style="display:-moz-inline-box;display:inline-block;width:5em; text-align:center; font-size:1.5em; font-weight:bold;">名称</span>
          <input type="text"  id="shouwname"  name="shouwname"  autocomplete="off" style="font-size:1.5em; border:1px solid #ccc; border-radius:0.3em; text-indent:0.5em;">
        </li>
        
        <li style="list-style-type:none; padding:0.8em 0 0.8em 0;">
          <span style="display:-moz-inline-box;display:inline-block;width:5em; text-align:center; font-size:1.5em; font-weight:bold;">E-mail</span>
          <input type="text"  id="email"  name="email"  autocomplete="off" style="font-size:1.5em; border:1px solid #ccc; border-radius:0.3em; text-indent:0.5em;">
        </li>
        
        <li style="list-style-type:none; padding:0.8em 0 0.8em 0;">
          <span style="display:-moz-inline-box;display:inline-block;width:5em; text-align:center; font-size:1.5em; font-weight:bold;">密码</span>
          <input type="password"  id="password"  name="password"  autocomplete="off" style="font-size:1.5em; border:1px solid #ccc; border-radius:0.3em; text-indent:0.5em;">
        </li>
        
        <li style="list-style-type:none; padding:0.8em 0 0.8em 0;">
          <span style="display:-moz-inline-box;display:inline-block;width:5em; text-align:center; font-size:1.5em; font-weight:bold;">确认密码</span>
          <input type="password"  id="rpassword"  name="rpassword"  autocomplete="off" style="font-size:1.5em; border:1px solid #ccc; border-radius:0.3em; text-indent:0.5em;">
        </li>
        
        
        <li style="list-style-type:none;padding:0.5em 0 0.5em 0.8em;">
          <input type="submit"  value="确定" style="padding:0.4em 1em; color:#fff; font-size:1.2em; height:100%; border:none; border-radius:0.3em; background-color:#5bc0de;">
          <input type="button" onclick="cancle()" value="取消" style="padding:0.4em 1em; color:#fff; font-size:1.2em; height:100%; border:none; border-radius:0.3em; background-color:#ffaa25;">
        </li>
      </ul>
    </form>
  </div>
  <div class="col-xs-5" style="padding:30px">
    <img src="<c:url value='resources/images/logo-name-two.png' />">
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
</script>
</html>