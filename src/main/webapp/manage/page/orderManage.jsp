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

	<title>My JSP 'goodManage.jsp' starting page</title>
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
		function searchOrder() {
			$("#dg").datagrid('load', {
				"goodName" : $("#goodName").val(),
				"userName" : $("#userName").val(),
				"orderId" : $("#orderId").val(),
				"orderState" : $('#orderState').combobox('getValue')
			});
		}

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
				field: 'goodId'
			});
			row.goodId = $(ed.target).combobox('getText');
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
//		var selectedRows = $("#dg").datagrid("getSelections");
//		if (selectedRows.length == 0) {
//			return;
			var rows = $('#dg').datagrid('getChanges');
			if (rows.length == 1){
				//endEdit该方法触发此事件
				$.post("${pageContext.request.contextPath}/manage/good/edit", {
							orderState : row.orderState,
							orderId : row.orderId
						}, function(result) {
							if (result.success) {
								$.messager.alert("系统提示", "数据已成功修改！");
								$("#dg").datagrid("reload");
							} else {
								$.messager.alert("系统提示", "数据修改失败！");
							}
						}, "json"
				);

				editRow = undefined;
			}

		}
	</script>
</head>

<body style="margin: 1px">

<table id="dg" title="订单管理" class="easyui-datagrid"
	   data-options="
		   		fitColumns:true,
				pagination:true,
				rownumbers:true,
                iconCls: 'icon-edit',
                fit:true,
                singleSelect: true,
                toolbar: '#tb',
                url: '${pageContext.request.contextPath}/manage/order/orderList',
                method: 'get',
                onClickCell: onClickCell,
                onEndEdit: onEndEdit,
                onAfterEdit:onAfterEdit
            ">
	<thead>
	<tr>
		<th field="cb" checkbox="true" align="center"></th>
		<th data-options = "field:'orderId',sortable:true,editor:'textbox'"  align="center">订单Id</th>
		<th field="userId"  align="center">用户Id</th>
		<th field="userName" width="50" align="center">用户名</th>
		<th data-options = "field:'goodId',sortable:true"  width="50" align="center">商品id</th>
		<th field="goodName" width="100" align="center">商品名称</th>
		<th field="orderPrice" width="50" align="center">订单金额</th>
		<th field="payWay" width="50" align="center">支付方式</th>
		<th field="updateBy"  align="center">操作员</th>
		<th field="createTime"  align="center">创建时间</th>
		<th field="updateTime"  align="center">更新时间</th>
		<th data-options="field:'orderState',formatter:function(value,row){
                          						  if(row.orderState == 0)
                          						  	return '未付款';
                          						  if(row.orderState == 1)
                          						  	return '已付款未发货';
                          						  if(row.orderState == 2)
                          						  	return '已发货未收货';
                          						  if(row.orderState == 3)
                          						    return '已收货';
                          						  if(row.orderState == 4)
                          						    return  '结束'
                          						  if(row.orderState == -1)
                          						    return  '取消订单';
                          						  if(row.order.orderState == -2)
                          							return '退货';
                        						},editor:{
														type:'combobox',
														options:{
														valueField:'orderState',
														textField:'chinese',
														method:'get',
														url:'/manage/page/orderState.json',
														required:true
													}
												}" width="50" align="center">状态</th>
	</tr>
	</thead>
</table>
<div id="tb">
	<a href="javascript:openUserAddDialog()" class="easyui-linkbutton"
	   iconCls="icon-add" plain="true">添加</a> <a
		href="javascript:openUserModifyDialog()" class="easyui-linkbutton"
		iconCls="icon-edit" plain="true">修改</a> <a
		href="javascript:saveUser()" class="easyui-linkbutton"
		iconCls="icon-save" plain="true">保存</a> <a
		href="javascript:deleteUser()" class="easyui-linkbutton"
		iconCls="icon-remove" plain="true">删除</a>
	<div>
		&nbsp;用户名：&nbsp;
		<input type="text" id="userName" size="20" placeholder="可选"
			   onkeydown="if(event.keyCode == 13)searchOrder()" />
		&nbsp;商品名：&nbsp;
		<input type="text" id="goodName" size="20"  placeholder="可选"
			   onkeydown="if(event.keyCode == 13)searchOrder()" />
		&nbsp;订单编号：&nbsp;
		<input type="text" id="orderId" size="20" placeholder="可选"
			   onkeydown="if(event.keyCode == 13)searchOrder()" />
		&nbsp;&nbsp;状态：&nbsp;
		<select id="orderState" class="easyui-combobox" name="state" size="30" labelPosition="top">
			<option value="" selected>可选...</option>
			<option value="0">未付款</option>
			<option value="1">已付款未发货</option>
			<option value="2">已发货未收货</option>
			<option value="3">已收货</option>
			<option value="4">结束订单</option>
			<option value="-1">取消订单</option>
			<option value="-2">退货</option>
		</select>
		<a
				href="javascript:searchOrder()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">查询</a>
	</div>
</div>
</body>
</html>
