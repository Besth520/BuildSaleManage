<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 导入jquery核心类库 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<!-- 导入easyui类库 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/ext/portal.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/default.css">	
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/ext/jquery.portal.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/ext/jquery.cookie.js"></script>
<script
	src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"
	type="text/javascript"></script>
<script 
	src="${pageContext.request.contextPath }/js/easyui/outOfBounds.js" type="text/javascript"></script>
<script type="text/javascript">
	function doAdd(){
		//alert("增加...");
		$('#addHouseWindow').window("open");
	}
	
	function doView(){
		$('#searchWindow').window("open");
	}
	
	function doEdit(){
		var rows = $("#grid").datagrid("getSelections");
		if(rows.length!=1){
			$.messager.alert("提示信息","请选择唯一一个需要修改的区域","warning");
		}else {
			$("#editHouseWindow").window("open");
			$("#updateForm").form("load",rows[0]);
		}
	}
	//工具栏
	var toolbar = [ {
		id : 'button-view',	
		text : '查询',
		iconCls : 'icon-search',
		handler : doView
	}, {
		id : 'button-add',
		text : '增加',
		iconCls : 'icon-add',
		handler : doAdd
	}
	, {
		id : 'button-edit',	
		text : '修改',
		iconCls : 'icon-edit',
		handler : doEdit
	}];
	// 定义列
	var columns = [ [ {
		field : 'id',
		checkbox : true,
	},{
		field : 'name',
		title : '楼盘名称',
		width : 120,
		align : 'center'
	}, {
		field : 'position',
		title : '地理位置',
		width : 120,
		align : 'center'
	}, {
		field : 'parea',
		title : '占地面积(m²)',
		width : 120,
		align : 'center',
	}, {
		field : 'barea',
		title : '建筑面积(m²)',
		width : 120,
		align : 'center',
	}, {
		field : 'rarea',
		title : '建筑占地面积(m²)',
		width : 120,
		align : 'center'
	}, {
		field : 'garea',
		title : '绿化面积(m²)',
		width : 120,
		align : 'center'
	}, {
		field : 'cdate',
		title : '开发日期',
		width : 120, 
		align : 'center'
	}, {
		field : 'sum',
		title : '楼房幢数',
		width : 100, 
		align : 'center'
	}, {
		field : 'remark',
		title : '备注',
		width : 150, 
		align : 'center'
	} ] ];
	
	$(function(){
		// 先将body隐藏，再显示，不会出现页面刷新效果
		$("body").css({visibility:"visible"});
		
		// 取派员信息表格
		$('#grid').datagrid( {
			iconCls : 'icon-forward',
			fit : true,
			border : false,
			rownumbers : true,
			striped : true,
			pageList: [10,30,50,100],
			pagination : true,
			toolbar : toolbar,
			url : "${pageContext.request.contextPath }/houseAction_pageQuery",
			idField  : 'id',
			columns : columns,
			onDblClickRow : doDblClickRow
		});
		
		// 添加楼房窗口
		$('#addHouseWindow').window({
	        title: '添加楼盘',
	        width: 600,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 500,
	        resizable:false
	    });
	    
	    
	    // 修改楼房窗口
		$('#editHouseWindow').window({
	        title: '修改楼盘',
	        width: 600,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 500,
	        resizable:false
	    });
	    
	    $('#searchWindow').window({
	        title: '查询楼盘',
	        width: 400,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false
	    });
		
		
		$("#save").click(function(){
			var v = $("#form").form("validate");
			if(v){
				$("#form").submit();
			}
		});
		
		$("#update").click(function(){
			var v = $("#updateForm").form("validate");
			if(v){
				$("#updateForm").submit();
			}
		});
		
		$("#btn").click(function(){
			var param = $("#searchForm").serializeJson();
			$("#grid").datagrid("load",param);
			$("#searchWindow").window("close");
		});
		//序列化查询表格
		$.fn.serializeJson=function(){  
            var serializeObj={};  
            var array=this.serializeArray();
            $(array).each(function(){  
                if(serializeObj[this.name]){  
                    if($.isArray(serializeObj[this.name])){  
                        serializeObj[this.name].push(this.value);  
                    }else{  
                        serializeObj[this.name]=[serializeObj[this.name],this.value];  
                    }  
                }else{  
                    serializeObj[this.name]=this.value;   
                }  
            });  
            return serializeObj;  
        };
        
		
	});

	function doDblClickRow(rowIndex, rowData){
		$("#editHouseWindow").window("open");
		$("#updateForm").form("load",rowData);
	}
</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<div region="center" border="false">
    	<table id="grid"></table>
	</div>
	<div class="easyui-window" title="对楼房进行添加或者修改" id="addHouseWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar" >
				<a id="save" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
			</div>
		</div>
		
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="form" action="${pageContext.request.contextPath }/houseAction_save" method="post">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">楼盘信息</td>
					</tr>
					<!-- TODO 这里完善收派员添加 table -->
					<tr>
						<td>楼盘名称</td>
						<td><input type="text" name="name" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>地理位置</td>
						<td><input type="text" name="position" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>占地面积(m²)</td>
						<td><input type="text" name="parea" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>建筑面积(m²)</td>
						<td><input type="text" name="barea" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>建筑占地面积(m²)</td>
						<td><input type="text" name="rarea" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>绿化面积(m²)</td>
						<td><input type="text" name="garea" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>开发日期</td>
						<td><input type="text" name="cdate" class="easyui-datebox"/></td>
					</tr>
					<tr>
						<td>楼房幢数</td>
						<td>
							<input type="text" name="sum" class="easyui-validatebox" required="true"/>  
						</td>
					</tr>
					<tr>
						<td>备注</td>
						<td colspan="2"><textarea name="remark" style="width:80%"></textarea></td>
					</tr>
					</table>
			</form>
		</div>
	</div>
	
	<div class="easyui-window" title="对楼房进行修改" id="editHouseWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar" >
				<a id="update" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >修改并保存</a>
			</div>
		</div>
		
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="updateForm" action="${pageContext.request.contextPath }/houseAction_update" method="post">
				<input type="hidden" name="id">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">楼盘信息</td>
					</tr>
					<!-- TODO 这里完善收派员添加 table -->
					<tr>
						<td>楼盘名称</td>
						<td><input type="text" name="name" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>地理位置</td>
						<td><input type="text" name="position" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>占地面积(m²)</td>
						<td><input type="text" name="parea" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>建筑面积(m²)</td>
						<td><input type="text" name="barea" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>建筑占地面积(m²)</td>
						<td><input type="text" name="rarea" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>绿化面积(m²)</td>
						<td><input type="text" name="garea" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>开发日期</td>
						<td><input type="text" name="cdate" class="easyui-datebox" /></td>
					</tr>
					<tr>
						<td>楼房幢数</td>
						<td>
							<input type="text" name="sum" class="easyui-validatebox" required="true"/>  
						</td>
					</tr>
					<tr>
						<td>备注</td>
						<td colspan="2"><textarea name="remark" style="width:80%"></textarea></td>
					</tr>
					</table>
			</form>
		</div>
	</div>
	
	<div class="easyui-window" title="查询楼盘窗口" id="searchWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div style="overflow:auto;padding:5px;" border="false">
			<form id="searchForm">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">查询条件</td>
					</tr>
					<tr>
						<td>楼盘名称</td>
						<td><input type="text" name="name"/></td>
					</tr>
					<tr>
						<td>地理位置</td>
						<td><input type="text" name="position"/></td>
					</tr>
					<tr>
						<td>楼房幢数</td>
						<td><input type="text" name="sum"/></td>
					</tr>
					<tr>
						<td colspan="2"><a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a> </td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
</body>
</html>	