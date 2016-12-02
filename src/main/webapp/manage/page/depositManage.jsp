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

<title>押金页面</title>
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
	function searchDeposit() {
//		alert($('#state').combobox('getValue'));
		$("#dg").datagrid('load', {
			"depositId" : $("#depositId").val(),
			"userId": $("#userId").val(),
			"goodId": $("#goodId").val(),
            "state": $('#state').combobox('getValue')
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
			$("#dlg").dialog("open").dialog("setTitle", "编辑信息");
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
				$.post("${pageContext.request.contextPath}/user/delete.do", {
					ids : ids
				}, function(result) {
					if (result.success) {
						$.messager.alert("系统提示", "数据已成功删除！");
						$("#dg").datagrid("reload");
					} else {
						$.messager.alert("系统提示", "数据删除失败，请联系系统管理员！");
					}
				}, "json");
			}
		});
	}

	function backDeposit() {
		alert("123123");
		var selectedRows = $("#dg").datagrid("getSelections");
		if (selectedRows.length == 0) {
			$.messager.alert("系统提示", "选择您要返还的押金！");
			return;
		var strIds = [];
		for ( var i = 0; i < selectedRows.length; i++) {
			if(selectedRows[i].state.val() == 0)
				$.messager.alert("系统提示", "请选择需要返还的用户");
				return;
			strIds.push(selectedRows[i].depositId);
		}
		var ids = strIds.join(",");
		$.messager.confirm("系统提示", "您确定要删除这<font color=red>"
				+ selectedRows.length + "</font>条数据吗？", function(r) {
			if (r) {
				$.post("${pageContext.request.contextPath}/manage/deposit/backDeposit", {
							ids : ids
						}, function(result) {
							if (result.success) {
								$.messager.alert("系统提示", "已成功返还！");
								$("#dg").datagrid("reload");
							} else {
								$.messager.alert("系统提示", "返还失败，请联系系统管理员！");
							}
						}, "json"
				);
			}});
			}
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

	 function onAfterEdit(index, row, changes) {

		 var rows = $('#dg').datagrid('getChanges');
//		console.info(row);
		 if (rows.length == 1){
			 var data = {
				 "depositId":row.depositId,
				 "state":row.state
			 }
			 $.ajax({
				 url: '${pageContext.request.contextPath}/manage/deposit/edit',
				 data: data,
				 type: 'POST',
				 success: function (data) {
					 if (data.success == true){
						 $.messager.show({
							 title:'押金修改',
							 msg:'成功!',
						 });
					 }else {
						 alert(data.success);
						 $.messager.show({
							 title:'押金修改',
							 msg:'失败!',
						 });
					 }
				 }
			 });
		 }

		editIndex = undefined;
	}

	function onEndEdit(index, row){
		var ed = $(this).datagrid('getEditor', {
			index: index,
			field: 'depositId'
		});
		row.depositId = $(ed.target).combobox('getText');
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
	 function rowStyler(index,row){
		if (index%2 == 0){
			return 'background-color:#d5d5d5;color:#000;';
		}
	}

	function formatOper(val,row,index){
		return '<a href="#" onclick="editUser('+index+')">修改</a>';
	}

	function editUser(index){
		$('#dg').datagrid('selectRow',index);// 关键在这里
		var row = $('#dg').datagrid('getSelected');
		if (row){
			$('#dlg').dialog('open').dialog('setTitle','修改学生信息');
			$('#fm').form('load',row);
			url = '${ctx}updateStudent.do?id='+row.id;
		}
	}
</script>
</head>

<body style="margin: 1px">

	<table id="dg" title="用户管理" class="easyui-datagrid"
		   data-options="
		   		fitColumns:true,
		   		fit: true,
                striped: true,
                border: false,
				pagination: true,
				rownumbers: true,
                iconCls: 'icon-edit',
                singleSelect: true,
                toolbar: '#tb',
                url: '${pageContext.request.contextPath}/manage/deposit/depositList',
                method: 'get',
            ">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center" ></th>
				<th data-options = "field:'depositId',editor:'numberbox',sortable:true" align="center">押金ID</th>
				<th data-options = "field:'userId',editor:'numberbox',sortable:true" align="center">用户ID</th>
				<th data-options = "field:'goodId',editor:'numberbox',sortable:true"  align="center">拍品ID</th>
				<th data-options = "field:'price',sortable:true,editor:{type:'numberbox',options:{precision:2}}" width="50" align="center">押金金额/元</th>
				<th data-options = "field:'state',sortable:true,
					                        formatter:function(value,row){
                          						  if(row.state == 1)
                          						  	return '已返还';
                          						  else
                          						  	return '未返还';
                        					},
											editor:{type:'textbox'}" align="center">状态</th>
				<th data-options = "field:'createTime',sortable:true,width:100,editor:'datetimebox'" align="center">创建时间</th>
				<th data-options = "field:'updateTime',sortable:true,width:100,editor:'datetimebox'" align="center">更新时间</th>
				<%--<th data-options = "field:'123',formatter:formatOper">操作</th>--%>
			</tr>
			<%--<tr>--%>

			<%--</tr>--%>
		</thead>
	</table>
	<div id="tb">
		<a href="javascript:append()" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">添加</a> <a
			href="javascript:openUserModifyDialog()" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true">修改</a> <a
			href="javascript:saveUser()" class="easyui-linkbutton"
			iconCls="icon-save" plain="true">保存</a> <a
			href="javascript:backDeposit()" class="easyui-linkbutton"
			iconCls="icon-tip" plain="true">返还押金</a> <a
			href="javascript:deleteUser()" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true">删除</a>

		<div>
			&nbsp;押金编号：&nbsp;<input type="text" id="depositId" size="20" placeholder="可选"
				onkeydown="if(event.keyCode == 13)searchDeposit()" />
			&nbsp;用户编号：&nbsp;<input type="text" id="userId" size="20" placeholder="可选"
				   onkeydown="if(event.keyCode == 13)searchDeposit()" />
			&nbsp;拍品编号：&nbsp;<input type="text" id="goodId" size="20" placeholder="可选"
				   onkeydown="if(event.keyCode == 13)searchDeposit()" />
            &nbsp; 状态：&nbsp;
			<select id="state" class="easyui-combobox" name="state" size="20" labelPosition="top">
				<option value="" selected>可选...</option>
				<option value="0">未返还</option>
				<option value="1">已返还</option>
			</select>
            <a href="javascript:searchDeposit()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">查询</a>
		</div>

		<div id="dlg-buttons">
			<a href="javascript:saveUser()" class="easyui-linkbutton"
				iconCls="icon-ok">保存</a> <a href="javascript:closeUserDialog()"
				class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
		</div>

		<div id="dlg" class="easyui-dialog"
			style="width: 730px;height:280px;padding:10px 10px;" closed="true"
			buttons="#dlg-buttons">
			<form method="post" id="fm">
				<table cellspacing="8px;">
					<tr>
						<td>用户名：</td>
						<td><input type="text" id="userName" name="userName"
							class="easyui-validatebox" required="true" />&nbsp;<span
							style="color: red">*</span>
						</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>密码：</td>
						<td><input type="password" id="password" name="password"
							class="easyui-validatebox" required="true" />&nbsp;<span
							style="color: red">*</span>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
