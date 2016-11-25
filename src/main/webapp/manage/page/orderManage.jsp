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

<title>My JSP 'userManage.jsp' starting page</title>
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
	var url;
	function searchUser() {
		$("#dg").datagrid('load', {
			"userName" : $("#userName").val(),
			"goodName" : $("#goodName").val(),
			"orderId" : $("#orderId").val()
		});
	}
	function openUserAddDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "添加订单信息");
		url = "${pageContext.request.contextPath}/manage/user/add";
	}

	function openUserModifyDialog() {
		var selectedRows = $("#dg").datagrid("getSelections");
		if (selectedRows.length != 1) {
			$.messager.alert("系统提示", "请选择一条要编辑的数据！");
			return;
		}
		var row = selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle", "编辑用户信息");
		$("#fm").form("load", row);
		url = "${pageContext.request.contextPath}/manage/user/save?userId=" + row.userId;
	}

	function saveUser() {
		$("#fm").form("submit", {
			url : url,
			onSubmit : function() {
				return $(this).form("validate");
			},
			success : function(result) {
				var result = eval('(' + result + ')');
				if (result.success) {
					$.messager.alert("系统提示", "保存成功！");
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				} else {
					$.messager.alert("系统提示", "保存失败！");
					return;
				}
			}
		});
	}


	function deleteUser() {
		var selectedRows = $("#dg").datagrid("getSelections");
		if (selectedRows.length == 0) {
			$.messager.alert("系统提示", "请选择要删除的数据！");
			return;
		}
		var strIds = [];
		for ( var i = 0; i < selectedRows.length; i++) {
			strIds.push(selectedRows[i].id);
		}
		var ids = strIds.join(",");
		$.messager.confirm("系统提示", "您确定要删除这<font color=red>"
				+ selectedRows.length + "</font>条数据吗？", function(r) {
			if (r) {
				$.post("${pageContext.request.contextPath}/manage/user/delete", {
					ids : ids
				}, function(result) {
					if (result.success) {
						$.messager.alert("系统提示", "数据已成功删除！");
						$("#dg").datagrid("reload");
					} else {
						$.messager.alert("系统提示", "数据删除失败，请联系系统管理员！");
					}
				}, "json"
			);
			}
		});
	}
</script>
</head>

<body style="margin: 1px">

	<table id="dg" title="订单管理" class="easyui-datagrid" fitColumns="true"
		pagination="true" rownumbers="true"
		url="${pageContext.request.contextPath}/manage/order/orderList" fit="true"
		toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="orderId" align="center">订单Id</th>
				<th field="userId"  align="center">用户Id</th>
				<th field="userName" width="50" align="center">用户名</th>
				<th field="goodId" width="50" align="center">商品id</th>
				<th field="goodName" width="100" align="center">商品名称</th>
				<th field="orderPrice" width="50" align="center">订单金额</th>
				<th field="orderState" width="50" align="center">状态</th>
				<th field="payWay" width="50" align="center">支付方式</th>
				<th field="updateBy"  align="center">操作员</th>
				<th field="createTime"  align="center">创建时间</th>
				<th field="updateTime"  align="center">更新时间</th>

			</tr>
		</thead>
	</table>
	<div id="tb">
		<a href="javascript:openUserAddDialog()" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">添加</a> <a
			href="javascript:openUserModifyDialog()" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true">修改</a> <a
			href="javascript:deleteUser()" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true">删除</a>
		<div>
			&nbsp;用户名：&nbsp;
			<input type="text" id="userName" size="5" placeholder="可选"
				onkeydown="if(event.keyCode == 13)searchUser()" />
			&nbsp;商品名：&nbsp;
			<input type="text" id="goodName" size="5"  placeholder="可选"
				   onkeydown="if(event.keyCode == 13)searchUser()" />
			&nbsp;订单编号：&nbsp;
			<input type="text" id="orderId" size="3" placeholder="可选"
				   onkeydown="if(event.keyCode == 13)searchUser()" />
			<a
				href="javascript:searchUser()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">查询</a>
		</div>
	</div>
</body>
</html>
