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
		function searchgood() {
			$("#dg").datagrid('load', {
				"goodName" : $("#goodName").val(),
				"realName" : $("#realName").val(),
				"freeze" : $('#freeze').combobox('getValue')
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
			var rows = $('#dg').datagrid('getChanges');
			if (rows.length == 1){
				//endEdit该方法触发此事件
				$.post("${pageContext.request.contextPath}/manage/good/edit", {
							goodId : row.goodId,
							goodState : row.goodState,
							finishTime : row.completeTime
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

<table id="dg" title="拍品管理" class="easyui-datagrid"
	   data-options="
		   		fitColumns:true,
				pagination:true,
				rownumbers:true,
                iconCls: 'icon-edit',
                fit:true,
                singleSelect: true,
                toolbar: '#tb',
                url: '${pageContext.request.contextPath}/manage/good/goodList',
                method: 'get',
                onClickCell: onClickCell,
                onEndEdit: onEndEdit,
                onAfterEdit:onAfterEdit
            ">
	<%--<thead frozen="true">--%>
	<%--<tr>--%>
	<%--<th field="goodId" width="80">用户编号</th>--%>
	<%--</tr>--%>
	<%--</thead>--%>
	<thead>
	<tr>
		<th field="cb" checkbox="true" align="center" ></th>
		<th data-options = "field:'goodId',editor:'textbox'" align="center">编号</th>
		<th data-options = "field:'goodName'" align="center">拍品名</th>

		<th data-options = "field:'price'" align="center">一口价</th>
		<th data-options = "field:'currPrice'" align="center">当前价</th>
		<th data-options = "field:'beginPrice'" align="center">起拍价</th>
		<th data-options = "field:'sellerId'" align="center">卖者</th>
		<th data-options = "field:'buyerId'" align="center">买者</th>
		<th data-options = "field:'click'" align="center">点击量</th>

		<th align="center" data-options="field:'createTime'">创建时间</th>
		<th align="center" data-options="field:'upTime'">上架时间</th>
		<th align="center" data-options="field:'completeTime',editor:'datetimebox'">结束时间</th>


		<th data-options = "field:'introduction'" width="25" align="center">简述</th>
		<th data-options = "field:'goodState' ,formatter:function(value,row){
													if(row.goodState == 0)
														return '未审核';
													if(row.goodState == 1)
														return '审核上架';
													if(row.goodState == 2)
														return '竞拍结束';
													if(row.goodState == -1)
														return '审核不通过'
													},editor:{
														type:'combobox',
														options:{
														valueField:'goodState',
														textField:'chinese',
														method:'get',
														url:'/manage/page/goodState.json',
														required:true
													}
												}" align="center">状态</th>
	</tr>
	</thead>
</table>
<div id="tb">
	<a href="javascript:append()" class="easyui-linkbutton"
	   iconCls="icon-add" plain="true">添加</a> <a
		href="javascript:onClickCell()" class="easyui-linkbutton"
		iconCls="icon-edit" plain="true">修改</a> <a
		href="javascript:savegood()" class="easyui-linkbutton"
		iconCls="icon-save" plain="true">保存</a> <a
		href="javascript:deletegood()" class="easyui-linkbutton"
		iconCls="icon-remove" plain="true">删除</a>
	<div>
		&nbsp;拍品名：&nbsp;<input type="text" id="goodName" size="20" placeholder="可选"
							   onkeydown="if(event.keyCode == 13)searchgood()" />
		&nbsp;真名：&nbsp;<input type="text" id="realName" size="20" placeholder="可选"
							  onkeydown="if(event.keyCode == 13)searchgood()" />
		&nbsp; 状态：&nbsp;
		<select id="freeze" class="easyui-combobox" name="freeze" size="20" labelPosition="top">
			<option value="" selected>可选...</option>
			<option value="0">正常</option>
			<option value="1">冻结</option>
		</select>
		<a
				href="javascript:searchgood()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">查询</a>
	</div>
</div>
</body>
</html>
