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

	<title>拍品页面</title>
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
		function search() {
			$("#dg2").datagrid('load', {
				"goodName" : $("#goodName").val()
			});
		}
		function openGoodAddDialog() {
			$("#dlg2").dialog("open").dialog("setTitle", "添加拍品信息");
			url = "${pageContext.request.contextPath}/manage/good/save";
		}

		function openGoodModifyDialog() {
			var selectedRows = $("#dg2").datagrid("getSelections");
			if (selectedRows.length != 1) {
				$.messager.alert("系统提示", "请选择一条要编辑的数据！");
				return;
			}
			var row = selectedRows[0];
			$("#dlg2").dialog("open").dialog("setTitle", "编辑拍品信息");
			$("#goodForm").form("load", row);
			url = "${pageContext.request.contextPath}/manage/good/save?id=" + row.id;
		}

		function saveGood() {
			$("#goodForm").form("submit", {
				url : url,
				onSubmit : function() {
					return $(this).form("validate");
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success) {
						$.messager.alert("系统提示", "保存成功！");
						resetValue();
						$("#dlg2").dialog("close");
						$("#dg2").datagrid("reload");
					} else {
						$.messager.alert("系统提示", "保存失败！");
						return;
					}
				}
			});
		}
//		function resetValue() {
//			$("#name").val("");
//			$("#password").val("");
//			$("#sex").val("");
//			$("#birthday").val("");
//			$("#stuclass").val("");
//
//
//		}


		function closeGoodDialog() {
			$("#dlg2").dialog("close");
			$('#goodName   input').val('');
		}

		function deleteGood() {
			var selectedRows = $("#dg2").datagrid("getSelections");
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
					$.post("${pageContext.request.contextPath}/manage/good/delete", {
						ids : ids
					}, function(result) {
						if (result.success) {
							$.messager.alert("系统提示", "数据已成功删除！");
							$("#dg2").datagrid("reload");
						} else {
							$.messager.alert("系统提示", "数据删除失败，请联系系统管理员！");
						}
					}, "json");
				}
			});
		}
	</script>
</head>

<body style="margin: 1px">

<table id="dg2" title="拍品管理" class="easyui-datagrid" fitColumns="true"
	   pagination="true" rownumbers="true"
	   url="${pageContext.request.contextPath}/manage/good/goodList" fit="true"
	   toolbar="#tb">
	<thead>
	<tr>
		<th field="cb" checkbox="true" align="center"></th>
		<th field="goodId" width="50" align="center">编号</th>
		<th field="goodName" width="50" align="center">拍品名</th>
		<th field="goodState" width="50" align="center">状态</th>
		<th field="price" width="50" align="center">一口价</th>
		<th field="currPrice" width="50" align="center">当前价</th>
		<th field="beginPrice" width="50" align="center">起拍价</th>

		<%--<th field="goodImage" width="50" align="center">性别</th>--%>
		<%--<th field="birthday" width="50" align="center" > 出生年月</th>--%>
		<%--<th field="createdate"  width="50" align="center">创建时间</th>--%>
		<%--<th field="stuclass" width="50" align="center">班级</th>--%>
		<%--<th width="60">操作</th>--%>
	</tr>
	</thead>
</table>
<div id="tb">
	<a href="javascript:openGoodAddDialog()" class="easyui-linkbutton"
	   iconCls="icon-add" plain="true">添加</a> <a
		href="javascript:openGoodModifyDialog()" class="easyui-linkbutton"
		iconCls="icon-edit" plain="true">修改</a>
	<a
			href="javascript:deleteGood()" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true">删除</a>
	<div>
		&nbsp;商品名：&nbsp;<input type="text" id="goodName" size="20"
							   onkeydown="if(event.keyCode == 13)search()" /> <a
			href="javascript:search()" class="easyui-linkbutton"
			iconCls="icon-search" plain="true">查询</a>
	</div>

	<div id="dlg-buttons">
		<a href="javascript:saveGood()" class="easyui-linkbutton"
		   iconCls="icon-ok">保存</a> <a href="javascript:closeGoodDialog()"
									   class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>


</div>
</body>
</html>
