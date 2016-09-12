<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" /> 
<title>SnowSlideTeam</title>

<!-- Place favicon.ico in the root directory -->

<!-- build:css styles\vendor.css -->
<!-- bower:css -->
<link rel="stylesheet" href="<c:url value='resources/js/bootstrap-select/dist/css/bootstrap-select.min.css?version=201100108'/>">
<link rel="stylesheet" href="<c:url value='resources/js/bootstrap/dist/css/bootstrap.min.css?version=201100108' />">

<!-- endbower -->
<!-- endbuild -->

<!-- build:css styles\main.css -->

<link rel="stylesheet" href="<c:url value='resources/css/app/main.css?version=201100108' />">
<link rel="stylesheet" href="<c:url value='resources/css/app/mycss.css?version=201100108' />">
<link rel="stylesheet" href="<c:url value='resources/css/app/CommonStyle.css?version=201100108' />">
<link rel="stylesheet" href="<c:url value='resources/css/app/HomeStyle.css?version=201100108' />">
<link rel="stylesheet" href="<c:url value='resources/css/app/item.css?version=201100108' />">
<link rel="stylesheet" href="<c:url value='resources/css/app/Nav.css?version=201100108' />">

<jsp:include page="/header.jsp" flush="true" />

<br>
<div id="context" class="container" style="width:90%;">
  <div class="row">
  
    <div class="col-lg-2 bs-docs-sidebar">
      <ul class="nav nav-list bs-docs-sidenav affix">
<%--         <li class="active"><a href="<c:url value='http://localhost:8080/iur/'/>">到处看看</a></li> --%>
      </ul>
    </div>
    
<!--     
    <div class="col-lg-10" id="container4context">
      <section id="search-box" class="row" style="padding:3em 0;">
        <div class="col-lg-1 pull-right">
           <button class="btn btn-primary" onclick="showSsearch()">高级检索</button>
        </div>
        
        <div class="col-lg-11 pull-right">
           <div class="input-group">
            <input id="Skeywords" type="text" class="form-control" placeholder="输入关键字搜索">
            <span class="input-group-btn">
              <button class="btn btn-default" type="button" onclick="search()">搜索</button>
            </span>
          </div>
        </div>
        
      </section>
      
     <section id="sSearch-box"  value="0" style="display:none;padding-top:2em;">
	     <div class="view" class="row" style="padding:0 1em;">
	       <div class="col-lg-1 pull-right">
	           <button class="btn btn-primary" onclick="showSearch()">简单检索</button>
	       </div>
	       <div class="subtitle">
	         <h3 class="text-left">高级检索模式</h3>
	       </div>
	     </div>
	       
	     <div class="row" style="margin-left:15px;">
	       <div class="col-lg-3 info-title" style="height: 30px;margin-left:0px;border-radius: 2px; border-color:#6699cc">
	         <h4 style="margin-top:0px">输入内容检索条件</h4>
	       </div>            
	     </div>
	     <div class="row" style="padding-left:15px; margin-top:15px;">
	       <div class="col-lg-1">
	         <select class="selectpicker" data-width="auto">
	           <option>政策名称</option>
	           <option>印发部门</option>
	           <option>行政区域</option>
	           <option>关键字</option>
	           <option>摘要</option>
	           <option>内容</option>
	           <option>全文</option>
	         </select>
	       </div>
	         <div class="proj-body" src="images/perfume.jpg">
                <div class="proj-container" src="images/perfume.jpg">
                    <div class="proj-status" src="images/perfume.jpg"></div>
                    <a href="#">
                        <div class="proj-img" > <img src="images/perfume.jpg"></div>
                    </a>
                    <div class="proj-tag" rc="images/perfume.jpg">
                        <div class="divider-pro" rc="images/perfume.jpg"></div>
                        <h4>商品名</h4>
                        <h4>项目名</h4>
                        <br/>
                        一口价￥<h5 class="data-inline">5623</h5>
                        <div class="progress bar-defined bar-defined-tag">
                            <div class="progress-bar progress-bar-warning" style="width: 100%"></div>
                        </div>
                        当前价格：100%
                    </div>
                </div>
	       <div class="col-lg-3">
	         <input type="text" class="form-control " placeholder="输入搜索词" style="margin-left:35px" />
	       </div>
	       <div class="col-lg-1" style="margin-left:20px">
	         <select class="selectpicker" data-width="auto">
	           <option>词频</option>
	           <option>2</option>
	           <option>3</option>
	           <option>4</option>
	           <option>5</option>
	           <option>6</option>
	           <option>7</option>
	           <option>8</option>
	           <option>9</option>
	         </select>
	       </div>
	       <div class="col-lg-1">
	         <select class="selectpicker" data-width="auto">
	           <option>并含</option>
	           <option>或含</option>
	           <option>不含</option>
	         </select>
	       </div>
	       <div class="col-lg-3">
	         <input type="text" class="form-control col-lg-3" placeholder="输入搜索词"/>
	       </div>
	       <div class="col-lg-1" style="padding-left:0px;">
	         <select class="selectpicker" data-width="auto">
	           <option>词频</option>
	           <option>2</option>
	           <option>3</option>
	           <option>4</option>
	           <option>5</option>
	           <option>6</option>
	           <option>7</option>
	           <option>8</option>
	           <option>9</option>
	         </select>
	       </div>
	       <div class="col-lg-1" style="padding-left:0px;">
	         <select class="selectpicker" data-width="auto">
	           <option>精确</option>
	           <option>模糊</option>
	         </select>
	       </div>
	       <div class="col-lg-1" style="padding:0px; width:3%">
	         <button class="btn btn-md" style="background-color:transparent; color:#2e6ca5">
	           <i class="glyphicon glyphicon-plus"></i>
	         </button>
	       </div>
	     </div>
	
	     <div class="row" style="padding-left:15px; margin-top:15px;">
	       <div class="col-lg-1">
	         <select class="selectpicker" data-width="auto">
	           <option>政策名称</option>
	           <option>印发部门</option>
	           <option>行政区域</option>
	           <option>关键字</option>
	           <option>摘要</option>
	           <option>内容</option>
	           <option>全文</option>
	         </select>
	       </div>
	       <div class="col-lg-3">
	         <input type="text" class="form-control col-lg-3" placeholder="输入搜索词" style="margin-left:35px" />
	       </div>
	       <div class="col-lg-1" style="margin-left:20px">
	         <select class="selectpicker" data-width="auto">
	           <option>词频</option>
	           <option>2</option>
	           <option>3</option>
	           <option>4</option>
	           <option>5</option>
	           <option>6</option>
	           <option>7</option>
	           <option>8</option>
	           <option>9</option>
	         </select>
	       </div>
	       <div class="col-lg-1">
	         <select class="selectpicker" data-width="auto">
	           <option>并含</option>
	           <option>或含</option>
	           <option>不含</option>
	         </select>
	       </div>
	       <div class="col-lg-3">
	         <input type="text" class="form-control col-lg-3" placeholder="输入搜索词"/>
	       </div>
	       <div class="col-lg-1" style="padding-left:0px;">
	         <select class="selectpicker" data-width="auto">
	           <option>词频</option>
	           <option>2</option>
	           <option>3</option>
	           <option>4</option>
	           <option>5</option>
	           <option>6</option>
	           <option>7</option>
	           <option>8</option>
	           <option>9</option>
	         </select>
	       </div>
	       <div class="col-lg-1" style="padding-left:0px;">
	         <select class="selectpicker" data-width="auto">
	           <option>精确</option>
	           <option>模糊</option>
	         </select>
	       </div>
	       <div class="col-lg-1" style="padding:0px; width:3%">
	         <button class="btn btn-md" style="background-color:transparent; color:#dd6666">
	           <i class="glyphicon glyphicon-minus"></i>
	         </button>
	       </div>
	     </div>
	
	     <div class="row" style="margin:15px; margin-top:30px;">
	       <div class="col-lg-3 info-title" style="height: 30px;margin-left:0px;border-radius: 2px; border-color:#6699cc">
	         <h4 style="margin-top:0px">输入检索控制条件</h4>
	       </div>            
	     </div>
	     <div class="row">
	       <div class="col-lg-1"></div>
	       <div class="col-lg-6">
	         <div class="row">
	           <h4 class="col-lg-4 text-center">印发时间：</h4>
	           <h4 class="col-lg-1 text-center">从</h4>
	           <input style="margin-top:6px" class="col-lg-3 input-append date form_datetime" id="datetimepicker" size="10" type="text" value="" data-date-format="yyyy-mm-dd">
	           <h4 class="col-lg-1 text-center">到</h4>
	           <input style="margin-top:6px" class="col-lg-3 input-append date form_datetime" id="datetimepicker" size="10" type="text" value="" data-date-format="yyyy-mm-dd">
	         </div>
	       </div>  
	     </div>
	     <div class="row">
	       <div class="col-lg-1"></div>
	       <div class="col-lg-6">
	         <div class="row">
	           <h4 class="col-lg-4 text-center">有效时间：</h4>
	           <h4 class="col-lg-1 text-center">从</h4>
	           <input style="margin-top:6px" class="col-lg-3 input-append date form_datetime" id="datetimepicker" size="10" type="text" value="" data-date-format="yyyy-mm-dd">
	           <h4 class="col-lg-1 text-center">到</h4>
	           <input style="margin-top:6px" class="col-lg-3 input-append date form_datetime" id="datetimepicker" size="10" type="text" value="" data-date-format="yyyy-mm-dd">
	         </div>
	       </div>  
	     </div>
	     <div class="row">
	       <div class="col-lg-1"></div>
	       <div class="col-lg-6">
	         <div class="row">
	           <h4 class="col-lg-4 text-center">印发部门：</h4>
	           <div class="col-lg-8" style="padding:0px">
	             <input type="text" class="form-control" placeholder="输入发布机构搜索" />
	           </div>
	         </div>
	       </div>  
	     </div>
	
	     <div class="row">           检索模式
	       <input-group style="margin:15px;" class="col">
	         <div class="row" style="margin-left:15px;margin-top:15px;">    第一行
	           <h4 class="col-lg-2" style="margin:0px; padding:0px; text-align:center;">检索技巧：</h4>
	           <label class="col-lg-2"><input type="checkbox" >前缀检索</label>
	           <label class="col-lg-2"><input type="checkbox">短语检索</label>
	           <label class="col-lg-2"><input type="checkbox" >模糊检索</label>
	           <label class="col-lg-4"><input type="checkbox" >多关键字检索</label>
	           <label class="col-lg-2"></label>
	           <label class="col-lg-2"><input type="checkbox" >正则表达式检索</label>
	           <label class="col-lg-2"><input type="checkbox" >通配符检索</label>
	         </div>
	         <div class="row" style="margin-left:15px;margin-top:15px;">          第三行
	           <h4 class="col-lg-2" style="margin:0px; padding:0px; text-align:center;">其他选项：</h4>
	           <label class="col-lg-2"><input type="checkbox" checked="checked" >检索已过期文件</label>
	           <label class="col-lg-2"><input type="checkbox" checked="checked" >检索范围边界</label>
	         </div>
	         <div class="row" style="margin-left:15px;">          第三行
	           <h4 class="col-lg-2" style="margin:0px; padding:0px; text-align:center;">结果排序：</h4>
	           <label class="col-lg-2"><input name="sort" type="radio" />按匹配度排序</label>
	           <label class="col-lg-2"><input name="sort" type="radio" />按相似度排序</label>
	         </div>
	       </input-group>
	     </div>
	     <div class="row">
	       <div class="col-lg-6 ">
	         <button class="btn btn-primary pull-right" type="button">开始检索</button>
	       </div>
	       <div class="col-lg-6">
	         <button class="btn btn-default" type="button">结果中检索</button>
	       </div>   
	     </div>
	         
   </section>-->
   <section class="view rTable">
       <div class="row" style="margin-left:15px;">
	       <div class="subtitle">
	         <h4 class="text-left col">我的拍卖</h4>
	       </div>            
	     </div> 
	   <!--   <div id="searchResult">
	     <table class="table table-hover table-border">
          <thead>
            <tr>
	            <th>序号</th>
	            <th>名称</th>
	            <th>所属部门</th>
	            <th>印发时间</th>
	            <th>有效时间</th>
	            <th>操作</th> 
            </tr>
          </thead>
          <tbody>
             
	        
          </tbody>
        </table> 
	    
	    <nav class="pull-right">
	      <ul class="pagination">
	        <li class="pagepre">
	          <a aria-label="Previous">
	            <span aria-hidden="true">&laquo;</span>
	          </a>
	        </li>
	        
	        <li class='page_number'><a>1</a></li>
	        
	        <li class="pagenext">
	          <a href="#" aria-label="Next">
	            <span aria-hidden="true">&raquo;</span>
	          </a>
	        </li>
	      </ul>
	    </nav>
       </div>  
   </section>
</div>
</div>
</div> -->

                <h4 style="display: inline">我的拍品</h4>
                <div data-original-title="点击查看更多最新项目" id="newbtn" class="btn-defined label-more" data-placement="top"></div>
            </div>
            <div class="proj-body" src="resources/images/perfume.jpg">
                <div class="proj-container" src="resources/images/perfume.jpg">
                    <div class="proj-status" src="resources/images/perfume.jpg"></div>
                    <a href="#">
                        <div class="proj-img" > <img src="resources/images/perfume.jpg"></div>
                    </a>
                    <div class="proj-tag" rc="resources/images/perfume.jpg">
                        <div class="divider-pro" rc="resources/images/perfume.jpg"></div>
                        <h4>商品名</h4>
                        <h4>项目名</h4>
                        <br/>
                        审核状态： <h5 class="data-inline">已审核</h5>
                        <div class="progress bar-defined bar-defined-tag">
                            <div class="progress-bar progress-bar-warning" style="width: 100%"></div>
                        </div>
                    
                    </div>
                </div>
                <div class="proj-container">
                    <div class="proj-status"></div>
                    <a href="#">
                        <div class="proj-img"> <img src="resources/images/tangbao.jpg"></div>
                    </a>
                    <div class="proj-tag">
                        <div class="divider-pro"></div>
                        <h4>商品名</h4>
                        <h4>项目名</h4>
                        <br/>
                         审核状态： <h5 class="data-inline" ><color:red>待审核</h5>
                        <div class="progress bar-defined bar-defined-tag">
                            <div class="progress-bar progress-bar-warning" style="width: 100%"></div>
                        </div>
                   
                    </div>
                </div>
              
                </div>
            </div>
        </div>
    </div>
    <div class="body-footer"></div>

<jsp:include page="/footer.jsp" flush="true" />


<script type="text/javascript">
  $('.selectpicker').selectpicker();
  $("#navigate li").click(function(){
	  $(this).siblings().removeClass("active");
	  $(this).addClass("active");
  })
  
  
  function showSsearch(){
	  $("#sSearch-box").show();
	  $("#search-box").hide();
  }
  function showSearch(){
	  $("#sSearch-box").hide();
	  $("#search-box").show();
  }
  
  //搜索
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
  
  function search(){
	  
	  var data = {
		 "pageContext":{
			 "pageCount":10,
			 "currentPage":currentPage,
		 },
	     "criteraContext":{
	    	 "keywords":$("#Skeywords").val()
	     }
	  }
	  $("#searchResult table tbody").empty();
	  $("#searchResult .page_number").remove();
	  totalPage = 1;
	  $.ajax({
	        type: "POST",
	        url: "<c:url value='/gp/list' />",
	        data: JSON.stringify(data),
	        contentType: "application/json; charset=utf-8",
	        dataType: "json",
	        success:function(data){
	        	$("#search_result").show();
	        	data.gpolicy.forEach(function(x,i,a){
	        		$("#searchResult table tbody").append(
	        				"<tr id='"+x.id+"'>"
	        		          +"<td>"+(i+1)+"</td>"
	        		          +"<td>"+x.name+"</td>"
	        		          +"<td>"+x.relatedDepartment+"</td>"
	        		          +"<td>"+timeFormat(x.publishTime)+"</td>"
					          +"<td>"+timeFormat(x.validTime)+"</td>"
	        		          +"<td>"
	        		           +"<a href='<c:url value='/gp/view/"+x.id+"&"+x.departmentId+"' />'>查看</a>"
	        		            +"<span>|</span>"
	        		           +"<a class='deletePolicy'>删除</a>"
	        		          +"</td>"
	        		        +"</tr>" );
	        	});
	        	delePolicy();
	        	totalPage = data.searchContext.pageContext.totalPage;
	        	for(var i = 0; i< totalPage; i++){
	        		$(".pagenext").before("<li class='page_number'><a>"+(i+1)+"</a></li>");
	        	}
	        	$(".pagination li.page_number:eq("+(currentPage-1)+")").addClass("ved");
	        	$(".pagination li.page_number").click(function(){
	        		currentPage = parseInt($(this).find("a").text());
	        		search();
	        	})
	        	
	        },
	        error:function(XMLHttpRequest){
	        	$("#search_result").hide();
	        	showMessage(XMLHttpRequest.responseJSON["not-found"],false,"#search-box");
			}
	    });
  }
  
  function delePolicy(){
	  $("a.deletePolicy").click(function(){
		  var policyId = $(this).parent().parent().attr("id");
		  $.ajax({
		        type: "DELETE",
		        url: "<c:url value='/gp/delete/' />"+policyId,
		        data: "",
		        dataType: "json",
		        success:function(data){
		        	showMessage(data.deleted,true,".rTable");
		        	search();
		        },
		        error:function(XMLHttpRequest){
		        	showMessage(XMLHttpRequest.responseJSON["not-found"],false,".rTable");
				}
		    });
	  })
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
		  
	  
	  }
  })
  
  $(function(){
	  search();
  })
</script>

</body>

</html>