<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" /> 
<title>政策管理-部门总览</title>

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
        <a class="navbar-brand" href="#">政策法规平台</a>
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
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="background-color:transparent">政策管理 <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="<c:url value='/gdpt/index'/>">政策机构</a></li>
              <li><a href="<c:url value='/gp/list/form'/>">政策法规</a></li>
              
            </ul>
          </li>
          
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="background-color:transparent">个人中心 <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="user/user">个人信息</a></li>
              <li><a href="login.jsp">用户登录</a></li>
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


<div id="context" class="container" style="width:90%">
<div class="row">
 <!--侧边导航-->

 <div class="col-lg-2 bs-docs-sidebar">             
   <ul class="nav nav-list bs-docs-sidenav affix" id="navigate">
      <li id="top" class="active"><a>快速检索</a></li>
      <li id="map"><a>机构地图</a></li>
   </ul>  
 </div>

 
 <div class="col-lg-10" id="container4context" style="margin-top:-20px">
   <section id="search-box" class="row" style="margin-top:2em">
     
     <div class="col-lg-10 " style="padding:1em; margin:2% 0 2% 8%;">
     <div class="input-group">
       <input id="Skeywords" type="text" class="form-control" placeholder="输入关键字搜索">
       <span class="input-group-btn">
         <button class="btn btn-default" type="button" onclick="search()">搜索</button>
       </span>
     </div><!-- \input-group -->
     </div><!-- \.col-lg-6 -->      <!--检索搜索-->
     
     <div  id="search_result" class="main-info info col-lg-11" style="padding:1em; margin-left:5%; display:none; ">
      <table class="table table-hover table-border table-striped">
	      <thead>
	        <tr>
		         <th>序号</th>
		         <th>名称</th>
		         <th>电话</th>
		         <th>邮箱</th>
		         <th>操作</th>
	         </tr>
	      </thead>
	      <tbody></tbody>
      </table>
      <section>
	
	    <nav class="pull-right">
	      <ul class="pagination">
	        <li class="pagepre">
	          <a aria-label="Previous">
	            <span aria-hidden="true">&laquo;</span>
	          </a>
	        </li>
	        
	        <li class='page_number'><a>1</a></li>
	        
	        <li class="pagenext">
	          <a aria-label="Next">
	            <span aria-hidden="true">&raquo;</span>
	          </a>
	        </li>
	      </ul>
	    </nav>
	  </section>
      </div>
	  
	  
   </section>
   
  
   <div id="orgMap" style="width:100%; height: 2em; "></div>
   
   <!-- 国家级  -->
   <section  class="view" style="border-top:1px dashed #ccc;" id="countrylevel">
       <div class="subtitle">
         <h4 class="text-left col">国家级政府机构</h4>

       </div>
   </section>
   
   <!-- 省级  -->
   <section class="view"  id="provincelevel">
     <div class="subtitle">
         <h4 class="text-left col">省级政府机构</h4>
     </div>
     
   </section>
   
   <!-- 市级  -->
   <section class="view"  id="citylevel">
     <div class="subtitle">
         <h4 class="text-left col">市级政府机构</h4>
     </div>
     
   </section>
   
   
   <!-- 区级 -->
   <section class="view"  id="districtlevel">
     <div class="subtitle">
         <h4 class="text-left col">区级政府机构</h4>
     </div>
     
   </section>




  </div> 

 </div>
</div>

<div class="container navbar" style="width:90%; min-height: 150px;">
   <div class="row" style="margin-top:2%;">
     <div class="col-xs-10 pull-right" style="margin:0; text-align:center; height:100%;">
       <img src="images/logo-name-two.png" style="width:auto; height:64px;padding-left:40px;margin-right:5em;" alt="广东省粤立企业顾问有限公司">
       <a href="http://pro.gdstc.gov.cn/egrantweb" style="font-size:6px; color:#323232;">
          <img src="images/policyLogo.png" style="width:auto; height:64px;padding-left:40px" alt="广东省科技业务管理阳光政务平台">
          <span>广东省科技业务管理阳光政务平台</span>
         </a>
     </div>
   </div>
</div>


<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/modernizr/modernizr.js"></script>
<script type="text/javascript" src="resources/js/bootstrap-select/dist/js/bootstrap-select.js"></script>
<script type="text/javascript" src="resources/js/app/main.js"></script>
<script type="text/javascript" src="resources/js/app/myjs.js"></script>

<script type="text/javascript" src="resources/js/bootstrap-sass/assets/javascripts/bootstrap/affix.js"></script>
<script type="text/javascript" src="resources/js/bootstrap-sass/assets/javascripts/bootstrap/alert.js"></script>
<script type="text/javascript" src="resources/js/bootstrap-sass/assets/javascripts/bootstrap/dropdown.js"></script>
<script type="text/javascript" src="resources/js/bootstrap-sass/assets/javascripts/bootstrap/tooltip.js"></script>
<script type="text/javascript" src="resources/js/bootstrap-sass/assets/javascripts/bootstrap/modal.js"></script>
<script type="text/javascript" src="resources/js/bootstrap-sass/assets/javascripts/bootstrap/transition.js"></script>
<script type="text/javascript" src="resources/js/bootstrap-sass/assets/javascripts/bootstrap/button.js"></script>
<script type="text/javascript" src="resources/js/bootstrap-sass/assets/javascripts/bootstrap/popover.js"></script>
<script type="text/javascript" src="resources/js/bootstrap-sass/assets/javascripts/bootstrap/carousel.js"></script>
<script type="text/javascript" src="resources/js/bootstrap-sass/assets/javascripts/bootstrap/scrollspy.js"></script>
<script type="text/javascript" src="resources/js/bootstrap-sass/assets/javascripts/bootstrap/collapse.js"></script>
<script type="text/javascript" src="resources/js/bootstrap-sass/assets/javascripts/bootstrap/tab.js"></script>
<script type="text/javascript" src="resources/js/bootstrap-sass/assets/javascripts/bootstrap/select.js"></script>

<script type="text/javascript">
	$(".con a").click(function(){
		  var institutionData = {
				  name:$(this).text(),
		  }
		  window.location = "gdpt/view";
	});
	
	var orgMapTop = $("#orgMap").offset().top;
	var anchorHeight=$("#orgMap").height();
	$("#navigate li").click(function(){
		  $(this).siblings().removeClass("active");
		  $(this).addClass("active");
		  if($(this).attr("id")== "top"){
			  $("body").animate({scrollTop:0},10);
		  }
		  else{
			  
			  $("body").animate({scrollTop:orgMapTop-anchorHeight*4},10);
		  }
		  
	})
	
	  var currentPage = 1;   //当前页
	  var totalPage = 1;     //总页数
	  $('#Skeywords').keydown(function(e){
		if(e.keyCode==13){
			search();
		}
	  });
	  
	  $('#Skeywords').change(function(){
		  currentPage = 1;
	  })
	  
	  
	  //搜索
	  function search(){
		  if($("#Skeywords").val() == ""){
			  showMessage("请输入关键字",true,"#Skeywords");
			  return;
		  }
		  var data = {
			 "pageContext":{
				 "pageCount":10,
				 "currentPage":currentPage,
			 },
		     "criteraContext":{
		    	 "keywords":$("#Skeywords").val()
		     }
		  }
		  $("#search_result table tbody").empty();
		  $("#search_result .page_number").remove();
		  totalPage = 1;
		  $.ajax({
		        type: "POST",
		        url: "<c:url value='/gdpt/list' />",
		        data: JSON.stringify(data),
		        contentType: "application/json; charset=utf-8",
		        dataType: "json",
		        success:function(data){
		        	$("#search_result").show();
		        	data.gdepartments.forEach(function(x,i,a){
		        		$("#search_result table tbody").append(
		        				"<tr>"
		        		          +"<td>"+(i+1)+"</td>"
		        		          +"<td>"+x.fullName+"</td>"
		        		          +"<td>"+x.contact+"</td>"
		        		          +"<td>"+x.contact+"</td>"
		        		          +"<td><a href='<c:url value='/gdpt/view/"+x.id+"'/>' >进入</a></td>"
		        		        +"</tr>");
		        	});
		        	totalPage = data.searchContext.pageContext.totalPage;
		        	for(var i = 0; i< totalPage; i++){
		        		$(".pagenext").before("<li class='page_number'><a>"+(i+1)+"</a></li>");
		        	}
		        	$(".pagination li.page_number:eq("+(currentPage-1)+")").addClass("ved");
		        	$(".pagination li.page_number").click(function(){
		        		currentPage = parseInt($(this).find("a").text());
		        		search();
		        	})
		        	orgMapTop = $("#orgMap").offset().top;
		        	
		        },
		        error:function(XMLHttpRequest){
		        	showMessage(XMLHttpRequest.responseJSON["not-found"],false,"#container4context");
				}
		    });
	  }
	  
	  
	  $(".pagination li").click(function(){
		  switch($(this).attr("class")){
			  case "pagepre" : {
				  if((currentPage-1) > 0){
					  currentPage--;
					  search();
				  }
				  
				  break;
			  }
			  case "pagenext" : {
				  if(currentPage < totalPage){
					  currentPage++;
					  search();
				  }
				  
				  break;
			  }
			  case "page_number" : {
				  alert();
				  break;
			  }
		  
		  }
	  })
	
	//机构列表
	function buildGdepList(){
		  $.ajax({
		        type: "GET",
		        url: "<c:url value='/gdpt/list/all' />",
		        data: "",
		        dataType: "json",
		        success:function(data){
		        	data.gdepartments.forEach(function(x,i,a){
		        		
		        		if(x.gdepartment.divisionLevel == "国家级"){
		        			$("#countrylevel").append(
		        					"<div class='main-info info content'>"
		        				          +"<div class='row'>"
		        				             +"<div class='col-lg-5 contitle '>"
		        				               +"<a href='<c:url value='/gdpt/view/"+x.gdepartment.id+"'/>'>"+x.gdepartment.fullName+"</a>"
		        				             +"</div>"
		        				          +"</div>"
		        				          +"<div class='row' id='country_"+i+"'></div>");
		        			x.children.forEach(function(xc,ic,ac){
		        				$("#countrylevel #country_"+i+"").append(
	        				                "<div class='con col-lg-4'>"
	        				                   +"<a href='<c:url value='/gdpt/view/"+xc.gdepartment.id+"'/>'>"+xc.gdepartment.fullName+"</a>"
	        				                   +"<div class='clearfix'></div>"
	        				                +"</div>");
		        			});
		        			
		        		}
		        		
		        		else if(x.gdepartment.divisionLevel == "省部级"){
		        			$("#provincelevel").append(
		        					"<div class='main-info info content'>"
		        				          +"<div class='row'>"
		        				             +"<div class='col-lg-5 contitle '>"
		        				               +"<a href='<c:url value='/gdpt/view/"+x.gdepartment.id+"'/>'>"+x.gdepartment.fullName+"</a>"
		        				             +"</div>"
		        				          +"</div>"
		        				          +"<div class='row' id='province_"+i+"'></div>");
		        			x.children.forEach(function(xc,ic,ac){
		        				$("#provincelevel #province_"+i+"").append(
	        				                "<div class='con col-lg-4'>"
	        				                   +"<a href='<c:url value='/gdpt/view/"+xc.gdepartment.id+"'/>'>"+xc.gdepartment.fullName+"</a>"
	        				                   +"<div class='clearfix'></div>"
	        				                +"</div>");
		        			});
		        			
		        		}
		        		
		        		
		        		else if(x.gdepartment.divisionLevel == "地市级"){
		        			$("#citylevel").append(
		        					"<div class='main-info info content'>"
		        				          +"<div class='row'>"
		        				             +"<div class='col-lg-5 contitle '>"
		        				               +"<a href='<c:url value='/gdpt/view/"+x.gdepartment.id+"'/>'>"+x.gdepartment.fullName+"</a>"
		        				             +"</div>"
		        				          +"</div>"
		        				          +"<div class='row' id='city_"+i+"'></div>");
		        			x.children.forEach(function(xc,ic,ac){
		        				$("#citylevel #city_"+i+"").append(
	        				                "<div class='con col-lg-4'>"
	        				                   +"<a href='<c:url value='/gdpt/view/"+xc.gdepartment.id+"'/>'>"+xc.gdepartment.fullName+"</a>"
	        				                   +"<div class='clearfix'></div>"
	        				                +"</div>");
		        			});
		        			
		        		}
		        		
		        		else{
		        			$("#districtlevel").append(
		        					"<div class='main-info info content'>"
		        				          +"<div class='row'>"
		        				             +"<div class='col-lg-5 contitle '>"
		        				               +"<a href='<c:url value='/gdpt/view/"+x.gdepartment.id+"'/>'>"+x.gdepartment.fullName+"</a>"
		        				             +"</div>"
		        				          +"</div>"
		        				          +"<div class='row' id='district_"+i+"'></div>");
		        			x.children.forEach(function(xc,ic,ac){
		        				$("#districtlevel #district_"+i+"").append(
	        				                "<div class='con col-lg-4'>"
	        				                   +"<a href='<c:url value='/gdpt/view/"+xc.gdepartment.id+"'/>'>"+xc.gdepartment.fullName+"</a>"
	        				                   +"<div class='clearfix'></div>"
	        				                +"</div>");
		        			});
		        		}
		        	});
		        	
		        },
				error:function(XMLHttpRequest){
					console.log("error:");
					console.log(XMLHttpRequest);		
				}
		    });
	}
	
	
		
	$(function(){
		  $("body").animate({scrollTop:0},300);
		  buildGdepList();
		  $(window).scroll(function(){
				var targetTop = $(this).scrollTop();
				if( (orgMapTop-50) < targetTop ){
					$("#map").siblings().removeClass("active");
					$("#map").addClass("active");
				}
				else{
					$("#top").siblings().removeClass("active");
					$("#top").addClass("active");
				}
				//alert(targetTop)
		  })
	});
</script>

</body>

</html>