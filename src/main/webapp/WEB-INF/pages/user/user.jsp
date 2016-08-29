<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/header.jsp" flush="true" />

<div id="context" class="container" style="width:90%">
  <div class="row">
    <div class="col-lg-2 bs-docs-sidebar">
      <ul class="nav nav-list bs-docs-sidenav affix" id="navigate">
        <li id="menu1" class="active"><a>个人信息</a></li>
        <li id="menu2"><a>修改密码</a></li>
      </ul>
      <ul class="nav nav-list bs-docs-sidenav affix" id="back">
        <li><a href="<c:url value='/gdpt/view'/>">返回</a></li>
      </ul>
    </div>
    <div class="col-lg-10" id="container4context">
	    <section class="view info" style="margin-top:1em">
		    <div class="subtitle">
		        <h3 class="text-left">个人信息</h3>
		    </div>
		    <div class="clearfix"></div>
		    <div class="main-info info" id="">
		      <table class="table table-hover table-border table-striped">
			      <tbody>
			        <tr>
			          <td style="font-weight:bold" class="col-lg-2">用户类型：</td>
			          <td>普通用户</td>
			        </tr>
			        <tr>
			          <td style="font-weight:bold">登录名：</td>
			          <td>zhan</td>
			        </tr>
			        <tr>
			          <td style="font-weight:bold">所属单位：</td>
			          <td>广东省科学技术厅</td>
			        </tr>
			        <tr>
			          <td style="font-weight:bold">电话：</td>
			          <td>020-0000000</td>
			        </tr>
			        <tr>
			          <td style="font-weight:bold">电子邮箱：</td>
			          <td>zhan@vciur.com</td>
			        </tr>
			        	        
			      </tbody>
			    
			    </table>
		    
		    </div>
		    <div class="modify">
	           <button id="infoModify" onclick="edit()">修改</button>
	           
	   	</div>
		</section>
		
		<section id="form" class="infoForm" style="margin-top:20px; display:none;">
		  	<div class="subtitle">
		        <h3 class="text-left">个人信息</h3>
		    </div>
		    <form action="" class="form-horizontal">
		
		      <div class="form-group">
		        <label for="" class="control-label col-xs-1">用户类型</label>
		        <div class="col-sm-11">
		          <input type="text" class="form-control" value="普通用户"  required readonly>
		        </div>
		      </div>
		
		      <div class="form-group">
		        <label for="" class="col-xs-1 control-label">登录名</label>
		        <div class="col-sm-11">
		          <input type="text" class="form-control" value="zhan"  required>
		        </div>
		        </div>
		
		      <div class="form-group">
		        <label for="" class="control-label col-xs-1">所属单位</label>
		        <div class="col-xs-11">
		          <input type="text" class="form-control" value="广东省科学技术厅"  requried>
		        </div>
		      </div>
		
		      <div class="form-group">
		        <label for="" class="control-label col-xs-1">电话</label>
		        <div class="col-xs-11">
		          <input type="text" class="form-control" value="020-0000000"  requried>
		        </div>
		      </div>
		      
		
		      <div class="form-group">
		        <label for="" class="control-label col-xs-1">电子邮箱</label>
		        <div class="col-xs-11">
		          <input type="text" class="form-control" value="zhan@vciur.com"  requried>
		        </div>
		      </div>
		
		      <div class="form-group">
		        <div class="col-lg-12">
		          <button class="btn btn-primary pull-right" type="button" onclick="cancel()">取消</button>
		          <button class="btn btn-primary pull-right" type="button" onclick="save()" style="margin-right:1em;">保存信息</button>
		          
		        </div> 
		      </div>
		
		    </form>
		  </section>
		
		<div id="part2" style="width:100%; height: 2em; "></div>
		
		<section class="view password" style="margin-top:1em">
		    <div class="subtitle">
		        <h3 class="text-left">修改密码</h3>
		    </div>
		    <div class="clearfix"></div>
		    <div class="main-info info" id="">
		      <table class="table table-hover table-border table-striped">
			      <tbody>
			        
			        <tr>
			          <td style="font-weight:bold">原密码</td>
			          <td><input type="password" style="display:none;"><input type="password" value="" class="form-control"></td>
			        </tr>
			        <tr>
			          <td style="font-weight:bold">修改密码</td>
			          <td><input type="password" value="" class="form-control"></td>
			        </tr>
			        <tr>
			          <td style="font-weight:bold">确认密码</td>
			          <td><input type="password" value="" class="form-control"></td>
			        </tr>
			        
			      </tbody>
			    
			    </table>
		    
		    </div>
		    <div class="modify">
	           <button id="infoModify" onclick="editPassword()">修改</button>
	           
	   	</div>
		</section>
		
		
	     </div>
	   </div>
	</div>
<script type="text/javascript">
    function edit(){
      $("section.info").hide();
	  $("#form").show();
	  window.location = "#";
    }
    
    function cancel(){
      $("section.info").show();
  	  $("#form").hide();
  	  window.location = "#";
    }
    
    function save(){
      $("section.info").show();
   	  $("#form").hide();
   	  window.location = "#";
    }
    
    var part2Top = $("#part2").offset().top;  //导航部分2高度
    var anchorHeight=$("#part2").height();
    $("#navigate li").click(function(){
  	  $(this).siblings().removeClass("active");
  	  $(this).addClass("active");
  	  if($(this).attr("id")== "menu1"){
  		  $("body").animate({scrollTop:0},10);
  	  }
  	  else{		  
  		  $("body").animate({scrollTop:part2Top-anchorHeight*4},10);
  	  }
  	  
  })
  
    $(function(){
	  $("body").animate({scrollTop:0},300);
	  //返回上级列表的位置定位
	  var sliberHeight = $("#navigate").height();
	  var sliberLength = $("#navigate li").length;
	  $("#back").css("top",(sliberHeight*(sliberLength+1)/sliberLength)+"px");
	  $(window).scroll(function(){
			var targetTop = $(this).scrollTop();
			//alert(orgMapTop+"_"+(orgMapHright*5)+"_"+targetTop);
			if( (part2Top-anchorHeight*5) < targetTop ){
				$("#menu2").siblings().removeClass("active");
				$("#menu2").addClass("active");
			}
			else{
				$("#menu1").siblings().removeClass("active");
				$("#menu1").addClass("active");
			}
			//alert(targetTop)
	  })
  });
</script>
<jsp:include page="/footer.jsp" flush="true" />