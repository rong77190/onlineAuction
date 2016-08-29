//search-box 随屏幕滚动 
/*var _box_y = $("#name").offset().top; 
var _box_x = $("#name").offset().left; 

$(window).scroll(function(){ 
if($(window).scrollTop() > _box_y){ 
$("#name").attr("style","position: absolute;top:"+($(window).scrollTop()+60)+"px; left:"+_box_x+"px;z-index:99;width:87%;"); 
}else{ 
$("#name").attr("style","position:fixed;width:87%"); 
} 
}) */



//定义函数
/*function scr_top(div_id, offset)
    {
    	//var obj = $("#"+div_id);//
    	var obj = "#"+div_id;
        var _box_y = $(obj).offset().top; 
        var _box_x = $(obj).offset().left; 

        $(window).scroll(function(){ 
        if($(window).scrollTop() > _box_y){ 
        $(obj).attr("style","position:absolute;top:"+($(window).scrollTop()+offset)+"px; left:"+_box_x+"px;z-index:99;width:87%;"); 
        }else{ 
        $(obj).attr("style","position:fixed;width:87%"); 
        } 
    }) 
    }

scr_top('name', 60);*/


var _box_y = $("#name").offset().top-$("#nav_sec").outerHeight(true); 
console.log("_box_y="+_box_y);
console.log("name.height="+$("#name").height());

$(window).scroll(function(){ 
if($(window).scrollTop() >= _box_y){
	console.log("$(window).scrollTop()"+$(window).scrollTop());
	if($("#nav_id #name").length > 0){
		return;
	}
	else{
		$("#nav_id").append($("#name"));
        $('#view').css("padding-top",$('#name').height());
	}
	
}else{ 
	if($("#view #name").length > 0){
		return;
	}
	else{
		$("#view").append($("#name")); 
        $('#view').css("padding-top",0);
	}
} 
})

function divShow()
    {
        var iDiv = document.getElementById("message");
        if(iDiv)
        {
            if(iDiv.style.display=="block")
            {
                iDiv.style.display="none";
            }
            else
            {
                iDiv.style.display="block";
            }
        }
    }