<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">


    <title>后台管理系统</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/manage/jquery-easyui-1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/manage/jquery-easyui-1.4.4/themes/icon.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/manage/jquery-easyui-1.4.4/jquery.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/manage/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/manage/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript">

        function openTab(text,url,iconCls){
            if($("#tabs").tabs("exists",text)){
                $("#tabs").tabs("select",text);
            }else{
                var content="<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${pageContext.request.contextPath}/manage/page/"+url+"'></iframe>";
                $("#tabs").tabs("add",{
                    title:text,
                    iconCls:iconCls,
                    closable:true,
                    content:content
                });
            }
        }

        function logout(){

        }
    </script>
</head>

<body class="easyui-layout">

<div region="north" style="height:78px;background-color: #E0ECFF">
    <table style="padding:5px;" width="100%">
        <tr>
            <td>
                <div style="height: 60px;width: 326px;background-color: #E0ECFF; font:italic bold 40px/60px arial">
                    雪崩管理系统
                </div>
            </td>
            <td valign="bottom" align="right" width="100%">
                <font size="3">&nbsp;&nbsp;<strong>欢迎：</strong>${manager.name}
            </td>
        </tr>
    </table>
</div>

<div region="south" style="height:25px;" align="center">
    欢迎访问 <a href="http://www.baidu.com" target="_blank">http://www.baidu.com</a>
</div>

<div region="center">
    <div class="easyui-tabs" fit="true" border="false" id="tabs">
        <div title="首页" data-options="iconCls:'icon-home'">
            <div align="center" style="padding-top: 100px;">
                <font size="10" color="red">欢迎</font>
            </div>
        </div>
    </div>
</div>

<div region="west" style="width:200px;" title="导航菜单" split="true">
    <div class="easyui-accordion" data-options="fit:true,border:false">
        <div title="基本管理"  data-options="iconCls:'icon-khgl'" style="padding:10px;">
            <a href="javascript:openTab('用户信息管理','userManage.jsp','icon-user')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khxxgl'" style="width: 150px;">用户信息管理</a>
            <a href="javascript:openTab('拍品信息管理','goodManage.jsp','icon-good')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khlsgl'" style="width: 150px;">拍品信息管理</a>
            <a href="javascript:openTab('订单信息管理','orderManage.jsp','icon-good')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khlsgl'" style="width: 150px;">订单信息管理</a>
            <a href="javascript:openTab('押金信息管理','depositManage.jsp','icon-good')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khlsgl'" style="width: 150px;">押金信息管理</a>
        </div>
        <div title="基础数据管理"  data-options="iconCls:'icon-jcsjgl'" style="padding:10px">
            <a href="javascript:openTab('数据字典管理','dataDicManage.jsp','icon-sjzdgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-sjzdgl'" style="width: 150px;">数据字典管理</a>
            <a href="javascript:openTab('产品信息查询','productSearch.jsp','icon-cpxxgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cpxxgl'" style="width: 150px;">产品信息查询</a>
            <a href="javascript:openTab('用户信息管理','userManage.jsp','icon-user')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-user'" style="width: 150px;">用户信息管理</a>
            <a href="javascript:openTab('拍品信息管理','goodManage.jsp','icon-student')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-student'" style="width: 150px;">拍品信息管理</a>
        </div>
        <div title="系统管理"  data-options="iconCls:'icon-item'" style="padding:10px">
            <a href="javascript:openPasswordModifyDialog()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-modifyPassword'" style="width: 150px;">修改密码</a>
            <a href="${pageContext.request.contextPath}/manage/admin/logout" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-exit'" style="width: 150px;">安全退出</a>
        </div>
    </div>
</div>
</body>
</html>
