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
	<script type="text/javascript"
			src="${pageContext.request.contextPath}/manage/js/easyuiExtension.js"></script>

<script type="text/javascript">
	var url;
	function searchUser() {
		$("#dg").datagrid('load', {
			"userName" : $("#userName1").val()
		});
	}
	function openUserAddDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "添加用户信息");
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
			url = "${pageContext.request.contextPath}/manage/user/?userId=" + row.userId;
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

	function resetValue() {
		$("#userName").val("");
		$("#password").val("");
	}

	function closeUserDialog() {
		$("#dlg").dialog("close");
		resetValue();
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

//	function formatBirthday(val,row){
//		if (val < 2022-08-02){
//			return '<span style="color:red;">('+val+')</span>';
//		} else {
//			return val;
//		}
//	}

	var editIndex = undefined;
	function endEditing(){
		if (editIndex == undefined){return true}
		if ($('#dg').datagrid('validateRow', editIndex)){
			$('#dg').datagrid('endEdit', editIndex);
			editIndex = undefined;
			return true;
		} else {
			return false;
		}
	}
	function onClickCell(index, field){
		if (editIndex != index){
			if (endEditing()){
				$('#dg').datagrid('selectRow', index)
						.datagrid('beginEdit', index);
				var ed = $('#dg').datagrid('getEditor', {index:index,field:field});
				if (ed){
					($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
				}
				editIndex = index;
			} else {
				setTimeout(function(){
					$('#dg').datagrid('selectRow', editIndex);
				},0);
			}
		}
	}
	function onEndEdit(index, row){
		var ed = $(this).datagrid('getEditor', {
			index: index,
			field: 'userId'
		});
		row.userId = $(ed.target).combobox('getText');
	}
	function append(){
		if (endEditing()){
			$('#dg').datagrid('appendRow',{status:'P'});
			editIndex = $('#dg').datagrid('getRows').length-1;
			$('#dg').datagrid('selectRow', editIndex)
					.datagrid('beginEdit', editIndex);
		}
	}
	function removeit(){
		if (editIndex == undefined){return}
		$('#dg').datagrid('cancelEdit', editIndex)
				.datagrid('deleteRow', editIndex);
		editIndex = undefined;
	}
	function accept(){
		if (endEditing()){
			$('#dg').datagrid('acceptChanges');
		}
	}
	function reject(){
		$('#dg').datagrid('rejectChanges');
		editIndex = undefined;
	}
	function getChanges(){
		var rows = $('#dg').datagrid('getChanges');
		alert(rows.length+' rows are changed!');
	}
	function onAfterEdit(index, row, changes) {
		//endEdit该方法触发此事件
		$.post("${pageContext.request.contextPath}/manage/user/edit", {
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
		$.console.info(row);
		editRow = undefined;
	}
</script>
</head>

<body style="margin: 1px">

	<table id="dg" title="用户管理" class="easyui-datagrid" fitColumns="true"
		pagination="true" rownumbers="true"


		   data-options="
		   		fitColumns:true,
				pagination:true,
				rownumbers:true,
                iconCls: 'icon-edit',
                fit:true,
                singleSelect: true,
                toolbar: '#tb',
                url: '${pageContext.request.contextPath}/manage/user/userList',
                method: 'get',
                onClickCell: onClickCell,
                onEndEdit: onEndEdit,
                onAfterEdit:onAfterEdit
            ">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center" ></th>
				<th data-options = "field:'userId',
                    editor:'textbox'
					" align="center">用户Id</th>
				<th data-options = "field:'userName',editor:'textbox'" align="center">用户名</th>
				<th data-options = "field:'sex',editor:'textbox'"  align="center">性别</th>
				<th data-options = "field:'birthday',editor:'datebox'" width="50" align="center">生日</th>
				<th data-options = "field:'realName',editor:'textbox'" align="center">真名</th>
				<th data-options = "field:'phone',editor:'textbox'" align="center">手机号</th>
				<th align="center" data-options="field:'registerTime'
					">注册时间</th>
				<th field="userEmail" align="center">邮箱</th>
				<th field="balance" align="center">余额</th>
				<th data-options = "field:'freeze',editor:'textbox'" align="center">冻结</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
		<a href="javascript:append()" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">添加</a> <a
			href="javascript:onClickCell()" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true">修改</a> <a
			href="javascript:saveUser()" class="easyui-linkbutton"
			iconCls="icon-save" plain="true">保存</a> <a
			href="javascript:deleteUser()" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true">删除</a>
		<div>
			&nbsp;用户名：&nbsp;<input type="text" id="userName1" size="20"
				onkeydown="if(event.keyCode == 13)searchUser()" /> <a
				href="javascript:searchUser()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">查询</a>
		</div>

		<div id="dlg-buttons">
			<a href="javascript:saveUser()" class="easyui-linkbutton"
				iconCls="icon-ok">保存</a> <a href="javascript:closeUserDialog()"
				class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
		</div>
	</div>
</body>
</html>
