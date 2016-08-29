/*
 * author:zhangyu
 * date:2016.1.27
 *  
 *  */


//滚动条滚动响应
function autoMenu(box_y,part2Top,part3Top,anchorHeight){
	$(window).scroll(function(){
		   var viewH =$(this).height();  //可见高度
           var contentH =$(this).get(0).scrollHeight;  //内容高度
		   var targetTop = $(this).scrollTop(); //滚动高度
		   if( targetTop > box_y && targetTop < (part2Top-anchorHeight*5)){
			    $("#menu1").siblings().removeClass("active");
			    $("#menu1").addClass("active");
				
			}		   

			else if( targetTop > (part2Top-anchorHeight*5)   && targetTop < (part3Top-anchorHeight*5)){
				$("#menu2").siblings().removeClass("active");
				$("#menu2").addClass("active");
			}
			else if ( targetTop > (part3Top-anchorHeight*5)) {
				$("#menu3").siblings().removeClass("active");
				$("#menu3").addClass("active");
			}
			
			//alert(targetTop)
	  })
}


//获取网页跳转参数
function getSuffix(str){
	var arr=window.location.href.split('/');
	var arr1 = arr[(arr.length-1)].split(';');
	return arr1[0];
}


//同时存在departmentId和gpolicyId时分别获取
function getSuffixGpId(str){
	var arr=window.location.href.split('/');
	var arr1 = arr[(arr.length-1)].split('&');
	return arr1[0];
}

function getSuffixDepId(str){
	var arr=window.location.href.split('/');
	var arr1 = arr[(arr.length-1)].split('&');
	return arr1[1];
}


//消息
function showMessage(message,state,anchor){
	if(state){
		$("#request_success").css("top",$(anchor).offset().top);
		$("#request_success span").text(message);
		$("#request_success").fadeIn();
		setTimeout(function(){
			$("#request_success").fadeOut();
		},2000);
	}
	else{
		$("#request_error").css("top",$(anchor).offset().top);
		$("#request_error span").text(message);
		$("#request_error").fadeIn();
		$("#request_error .cloaeMessage").click(function(){
			$("#request_error").fadeOut();
		})
		$("input").click(function(){
			$("#request_error").fadeOut();
		})
		
	}
}


//提交表单提示
function checkRequired(form){
	var state = true;
	$(form).each(function(){
        if($(this).attr("required") == "required" && state){
        	if($(this).val() == ""){
        		$("body").animate({scrollTop:$(this).offset().top -200},300);
        		$("#formAttention").css("top",$(this).offset().top);
        		$("#formAttention").css("right","5%");
        		$("#formAttention span").text("该字段不能为空!");
        		$("#formAttention").fadeIn();
        		state = false;
        	}
        } 
        
	});
	$(form).click(function(){
		$("#formAttention").fadeOut();
	})
	return state;
}


//时间转换

 function timeFormat(date) {
	 var time =  new Date(parseInt(date));
	 var result = time.getFullYear()+'-'+(time.getMonth()+1)+'-'+time.getDate();
	 return result;
	 
}
 function timeFormat1(date) {
	 var result = date.getFullYear()+'-'+(date.getMonth()+1)+'-'+date.getDate();
	 return result;
	 
}
 
 function timeStamp(str){
	var date = new Date(Date.parse(str.replace(/-/g, "/")));
	return date.getTime();
 }