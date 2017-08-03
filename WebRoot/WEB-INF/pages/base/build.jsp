<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>区域设置</title>
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
	src="${pageContext.request.contextPath }/js/jquery.ocupload-1.1.2.js"
	type="text/javascript"></script>
<script 
	src="${pageContext.request.contextPath }/js/easyui/outOfBounds.js" type="text/javascript"></script>
<script type="text/javascript">
	function doAdd(){
		$('#addBuildWindow').window("open");
	}
	
	function doEdit(){
		var rows = $("#grid").datagrid("getSelections");
		if(rows.length!=1){
			$.messager.alert("提示信息","请选择唯一一个需要修改的区域","warning");
		}else {
			$("#editBuildWindow").window("open");
			$("#updateForm").form("load",rows[0]);
			$('#house').combobox('setValue',rows[0].house.id);
		}
	}
	
	function doView(){
		$('#searchWindow').window("open");
	}
	
	function doDelete(){
		var rows = $("#grid").datagrid("getSelections");
		if(rows.length==0){
			$.messager.alert("提示信息","请选择要删除的信息","warning");
		}else {
			var arr = new Array();
			for(var i = 0;i<rows.length;i++){
				arr.push(rows[i].id);
			}
			var ids = arr.join(",");
			window.location.href="${pageContext.request.contextPath }/regionAction_delete?ids="+ids;
		}
	}
	
	//工具栏
	var toolbar = [ {
		id : 'button-view',	
		text : '查询',
		iconCls : 'icon-search',
		handler : doView
	},{
		id : 'button-edit',	
		text : '修改',
		iconCls : 'icon-edit',
		handler : doEdit
	}, {
		id : 'button-add',
		text : '增加',
		iconCls : 'icon-add',
		handler : doAdd
	}];
	// 定义列
	var columns = [ [ {
		field : 'id',
		checkbox : true,
	},{
		field : 'name',
		title : '楼房名称',
		width : 120,
		align : 'center'
	},{
		field : 'house.name',
		title : '所属楼盘',
		width : 120,
		align : 'center',
		formatter : function(data,row ,index){
			return row.house.name;
		}
	}, {
		field : 'construction',
		title : '楼房结构',
		width : 120,
		align : 'center',
		formatter : function(data,row, index){
			if(data=="0"){
				return "砖混结构";
			}else if(data=="1"){
				return "框架结构";
			}else if(data=="2"){
				return "剪力墙结构";
			}else if(data=="3"){
				return "框架剪力墙结构";
			}else if(data=="4"){
				return "钢结构";
			}
		}
	}, {
		field : 'direction',
		title : '楼房朝向',
		width : 120,
		align : 'center',
		formatter : function(data,row, index){
			if(data=="0"){
				return "正南朝向";
			}else if(data=="1"){
				return "东南朝向";
			}else if(data=="2"){
				return "西南朝向";
			}else if(data=="3"){
				return "正东朝向";
			}else if(data=="4"){
				return "正西朝向";
			}else if(data=="5"){
				return "正北朝向";
			}else if(data=="6"){
				return "西北朝向";
			}else if(data=="7"){
				return "东北朝向";
			}
		}
	}, {
		field : 'type',
		title : '楼房类型',
		width : 120,
		align : 'center',
		formatter : function(data,row, index){
			if(data=="0"){
				return "低层住宅";
			}else if(data=="1"){
				return "多层住宅";
			}else if(data=="2"){
				return "中高层住宅";
			}else if(data=="3"){
				return "高层住宅";
			}else if(data=="4"){
				return "别墅";
			}
		}
	}, {
		field : 'sdate',
		title : '建成日期',
		width : 120,
		align : 'center'
	}, {
		field : 'sum',
		title : '房屋数量(间)',
		width : 120,
		align : 'center'
	}, {
		field : 'remark',
		title : '备注',
		width : 200,
		align : 'center'
	} ] ];
	
	$(function(){
		// 先将body隐藏，再显示，不会出现页面刷新效果
		$("body").css({visibility:"visible"});
		
		// 收派标准数据表格
		$('#grid').datagrid( {
			iconCls : 'icon-forward',
			fit : true,
			border : false,
			rownumbers : true,
			striped : true,
			pageList: [10,30,50,100],
			pagination : true,
			toolbar : toolbar,
			url : "${pageContext.request.contextPath }/buildAction_pageQuery",
			idField : 'id',
			columns : columns,
			onDblClickRow : doDblClickRow
		});
		
		// 添加、修改区域窗口
		$('#addBuildWindow').window({
	        title: '添加楼房',
	        width: 500,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 500,
	        resizable:false
	    });
	    
	    $('#editBuildWindow').window({
	        title: '修改楼房',
	        width: 500,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 500,
	        resizable:false
	    });
	    
	     $('#searchWindow').window({
	        title: '查询楼房',
	        width: 400,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false
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
	    
		//一键上传
		$("#button-import").upload({
			action:"${pageContext.request.contextPath }/regionAction_importXls",
			name:"myFile",
			onComplete: function (data, self, element) {
				if (data=="true") {
					$.messager.alert("提示信息","数据上传成功","info");
				}else {
					$.messager.alert("提示信息","数据上传失败","warning")
				}
			}
		});
		
		$("#save").click(function(){
			var v = $("#saveForm").form("validate");
			if(v){
				$("#saveForm").submit();
			}
		});
		
		$("#update").click(function(){
			var v = $("#updateForm").form("validate");
			if(v){
				$("#updateForm").submit();
			}
		});
	});

	function doDblClickRow(rowIndex, rowData){
		$("#editBuildWindow").window("open");
		$("#updateForm").form("load",rowData);
		$('#house').combobox('setValue',rowData.house.id);
	}
</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<div region="center" border="false">
    	<table id="grid"></table>
	</div>
	<div class="easyui-window" title="楼房添加" id="addBuildWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="save" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
			</div>
		</div>
		
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="saveForm" action="${pageContext.request.contextPath }/buildAction_save" method="post">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">楼房信息</td>
					</tr>
					<tr>
						<td>楼房名称</td>
						<td><input type="text" name="name" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>所属楼盘</td>
						<td>
							<input class="easyui-combobox" name="house.id"  
    							data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/houseAction_findByAjax'" /> 
						</td>
					</tr>
					<tr>
						<td>楼房结构</td>
						<td>
							<select class="easyui-combobox" name="construction" style="width:150px;">  
							    <option value="0">砖混结构</option>  
							    <option value="1">框架结构</option>  
							    <option value="2">剪力墙结构</option>  
							    <option value="3">框架剪力墙结构</option>  
							    <option value="4">钢结构</option>  
							</select>
						</td>
					</tr>
					<tr>
						<td>楼房朝向</td>
						<td>
							<select class="easyui-combobox" name="direction" style="width:150px;">  
							    <option value="0">正南朝向</option>  
							    <option value="1">东南朝向</option>  
							    <option value="2">西南朝向</option>  
							    <option value="3">正东朝向</option>  
							    <option value="4">正西朝向</option>  
							    <option value="5">正北朝向</option>  
							    <option value="6">西北朝向</option>  
							    <option value="7">东北朝向</option>  
							</select>
						</td>
					</tr>
					<tr>
						<td>楼房类型</td>
						<td>
							<select class="easyui-combobox" name="type" style="width:150px;">  
							    <option value="0">低层住宅</option>  
							    <option value="1">多层住宅</option>  
							    <option value="2">中高层住宅</option>  
							    <option value="3">高层住宅</option>  
							    <option value="4">别墅</option>  
							</select>
						</td>
					</tr>
					<tr>
						<td>建成日期</td>
						<td><input type="text" name="sdate" class="easyui-datebox"/></td>
					</tr>
					<tr>
						<td>房屋数量(间)</td>
						<td><input type="text" name="sum" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>备注</td>
						<td colspan="2"><textarea name="remark" style="width:80%"></textarea></td>
					</tr>
					</table>
			</form>
		</div>
	</div>
	
	
	
	<div class="easyui-window" title="楼房修改" id="editBuildWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="update" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
			</div>
		</div>
		
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="updateForm" action="${pageContext.request.contextPath }/buildAction_update" method="post">
				<input type="hidden" name="id">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">楼房信息</td>
					</tr>
					<tr>
						<td>楼房名称</td>
						<td><input type="text" name="name" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>所属楼盘</td>
						<td>
							<input id="house" class="easyui-combobox" name="house.id"  
    							data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/houseAction_findByAjax'" /> 
						</td>
					</tr>
					<tr>
						<td>楼房结构</td>
						<td>
							<select class="easyui-combobox" name="construction" style="width:150px;">  
							    <option value="0">砖混结构</option>  
							    <option value="1">框架结构</option>  
							    <option value="2">剪力墙结构</option>  
							    <option value="3">框架剪力墙结构</option>  
							    <option value="4">钢结构</option>  
							</select>
						</td>
					</tr>
					<tr>
						<td>楼房朝向</td>
						<td>
							<select class="easyui-combobox" name="direction" style="width:150px;">  
							    <option value="0">正南朝向</option>  
							    <option value="1">东南朝向</option>  
							    <option value="2">西南朝向</option>  
							    <option value="3">正东朝向</option>  
							    <option value="4">正西朝向</option>  
							    <option value="5">正北朝向</option>  
							    <option value="6">西北朝向</option>  
							    <option value="7">东北朝向</option>  
							</select>
						</td>
					</tr>
					<tr>
						<td>楼房类型</td>
						<td>
							<select class="easyui-combobox" name="type" style="width:150px;">  
							    <option value="0">低层住宅</option>  
							    <option value="1">多层住宅</option>  
							    <option value="2">中高层住宅</option>  
							    <option value="3">高层住宅</option>  
							    <option value="4">别墅</option>  
							</select>
						</td>
					</tr>
					<tr>
						<td>建成日期</td>
						<td><input type="text" name="sdate" class="easyui-datebox"/></td>
					</tr>
					<tr>
						<td>房屋数量(间)</td>
						<td><input type="text" name="sum" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>备注</td>
						<td colspan="2"><textarea name="remark" style="width:80%"></textarea></td>
					</tr>
					</table>
			</form>
		</div>
	</div>
	
	
	<div class="easyui-window" title="查询楼房窗口" id="searchWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div style="overflow:auto;padding:5px;" border="false">
			<form id="searchForm">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">查询条件</td>
					</tr>
					<tr>
						<td>楼房名称</td>
						<td><input type="text" name="name"/></td>
					</tr>
					<tr>
						<td>所属楼盘</td>
						<td><input type="text" name="house.name"/></td>
					</tr>
					<tr>
						<td>楼房结构</td>
						<td>
							<select class="easyui-combobox" id="construction" data-options="selected:false"  name="construction" style="width:150px;"> 
								<option value="">--请选择--</option> 
							    <option value="0">砖混结构</option>  
							    <option value="1">框架结构</option>  
							    <option value="2">剪力墙结构</option>  
							    <option value="3">框架剪力墙结构</option>  
							    <option value="4">钢结构</option>  
							</select>
						</td>
					</tr>
					<tr>
						<td>楼房朝向</td>
						<td>
							<select class="easyui-combobox" id="direction" name="direction" style="width:150px;">
								<option value="">--请选择--</option>   
							    <option value="0">正南朝向</option>  
							    <option value="1">东南朝向</option>  
							    <option value="2">西南朝向</option>  
							    <option value="3">正东朝向</option>  
							    <option value="4">正西朝向</option>  
							    <option value="5">正北朝向</option>  
							    <option value="6">西北朝向</option>  
							    <option value="7">东北朝向</option>  
							</select>
						</td>
					</tr>
					<tr>
						<td>楼房类型</td>
						<td>
							<select class="easyui-combobox" id="type" name="type" style="width:150px;">
								<option value="">--请选择--</option>   
							    <option value="0">低层住宅</option>  
							    <option value="1">多层住宅</option>  
							    <option value="2">中高层住宅</option>  
							    <option value="3">高层住宅</option>  
							    <option value="4">别墅</option>  
							</select>
						</td>
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