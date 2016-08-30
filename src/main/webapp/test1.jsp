<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2016/8/26
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <meta charset="utf-8">
<head>
    <title></title>
    <script src="/static/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                url: 'user/list',
                type: 'get',
                dataType: 'json',
                timeout: 1000,
                cache: false,
                beforeSend: LoadFunction, //加载执行方法
                error: erryFunction,  //错误执行方法
                success: succFunction //成功执行方法
            })
            function LoadFunction() {
                $("#list").html('加载中...');
            }
            function erryFunction() {
                alert("error");
            }
            function succFunction(data) {
                $("#list").html('');

                //eval将字符串转成对象数组
                //var json = { "id": "10086", "uname": "zhangsan", "email": "zhangsan@qq.com" };
                //json = eval(json);
                //alert("===json:id=" + json.id + ",uname=" + json.uname + ",email=" + json.email);

                var json = eval(data); //数组
                $.each(json, function (index, item) {
                    //循环获取数据
                    var userName = json[index].userName;
                    var id = json[index].userId;
                    var sex = json[index].sex;
                    $("#list").html($("#list").html() + "<br>" + id + " - " + userName + " - " + sex + "<br/>");
                });
            }
        });
    </script>
</head>
<body>
<ul id="list">
</ul>
</body>
</html>
