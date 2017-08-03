<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript">
	// 工具栏
	var toolbar = [ {
		id : 'button-view',	
		text : '查询',
		iconCls : 'icon-search',
		handler : doView
	}, {
		id : 'button-edit',	
		text : '修改',
		iconCls : 'icon-edit',
		handler : doEdit
	}, {
		id : 'button-add',
		text : '新增',
		iconCls : 'icon-add',
		handler : doAdd
	}];
	// 定义列
	var columns = [ [ {
		field : 'id',
		checkbox : true,
	}, {
		field : 'room.allName',
		title : '所售房屋',
		width : 180,
		align : 'center',
		formatter : function(data,row ,index){
			return row.room.allName;
		}
	},{
		field : 'subtotal',
		title : '销售总价',
		width : 90,
		align : 'center',
	}, {
		field : 'customer.name',
		title : '客户姓名',
		width : 120,
		align : 'center',
		formatter : function(data,row ,index){
			return row.customer.name;
		}
	}, {
		field : 'customer.phone',
		title : '客户电话',
		width : 120,
		align : 'center',
		formatter : function(data,row ,index){
			return row.customer.phone;
		}
	},{
		field : 'buydate',
		title : '购买日期',
		width : 120,
		align : 'center'
	}, {
		field : 'room.state',
		title : '销售状态',
		width : 120,
		align : 'center',
		formatter : function(data,row, index){
			if(row.room.state=="0"){
				return "非售";
			}else if(row.room.state=="1"){
				return "可售";
			}else if(row.room.state=="2"){
				return "订购，待审核";
			}else if(row.room.state=="3"){
				return "审核完成，拟定合同";
			}else if(row.room.state=="4"){
				return "已签合同，销售完成";
			}
		}
	}, {
		field : 'user.name',
		title : '销售人员',
		width : 120,
		align : 'center',
		formatter : function(data,row ,index){
			return row.user.name;
		}
	} , {
		field : 'isok',
		title : '审核状态',
		width : 100,
		align : 'center',
		formatter : function(data,row, index){
			if(data=="0"){
				return "待审核";
			}else if(data=="1"){
				return "已通过";
			}
		}
	} , {
		field : 'remark',
		title : '备注',
		width : 150,
		align : 'center'
	} ] ];
	
	$(function(){
		// 先将body隐藏，再显示，不会出现页面刷新效果
		$("body").css({visibility:"visible"});
		
		// 收派标准数据表格
		$('#grid').datagrid( {
			iconCls : 'icon-forward',
			fit : true,
			border : true,
			rownumbers : true,
			striped : true,
			pageList: [10,30,50,100],
			pagination : true,
			toolbar : toolbar,
			url : "{pageContext.request.contextPath}/recordAction_pageQueryByUser",
			idField : 'id',
			columns : columns,
			onDblClickRow : doDblClickRow
		});
		
		/* // 添加销售记录
		$('#addRecordWindow').window({
	        title: '添加销售记录',
	        width: 600,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false
	    }); */
	    
	    // 修改销售记录
		$('#editRecordWindow').window({
	        title: '修改销售记录',
	        width: 600,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false
	    });
		
		// 查询分区
		$('#searchWindow').window({
	        title: '查询销售记录',
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
		$("#editRecordWindow").window("open");
		$("#updateForm").form("load",rowData);
		$('#phone').val(rowData.customer.phone);
		$('#customer').combobox('setValue',rowData.customer.id);
		$('#user').combobox('setValue',rowData.user.id);
		$('#state').combobox('setValue',rowData.room.state);
		$('#room').combobox('setValue',rowData.room.id);
	}
	
	function doEdit(){
		var rows = $("#grid").datagrid("getSelections");
		if(rows.length!=1){
			$.messager.alert("提示信息","请选择唯一一个需要修改的区域","warning");
		}else {
			$("#editRecordWindow").window("open");
			$("#updateForm").form("load",rows[0]);
			$('#phone').val(rows[0].customer.phone);
			$('#customer').combobox('setValue',rows[0].customer.id);
			$('#user').combobox('setValue',rows[0].user.id);
			$('#room').combobox('setValue',rows[0].room.id);
			$('#state').combobox('setValue',rows[0].room.state);
		}
	}
	
	function doAdd() {
		location.href="${pageContext.request.contextPath}/page_room_roominfo.action";
	}

	function doView() {
		$('#searchWindow').window("open");
	}

	function doDelete() {
		alert("删除用户");
		var ids = [];
		var items = $('#grid').datagrid('getSelections');
		for(var i=0; i<items.length; i++){
		    ids.push(items[i].id);	    
		}
			
		console.info(ids.join(","));
		
		$('#grid').datagrid('reload');
		$('#grid').datagrid('uncheckAll');
	}
	
</script>		
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<div region="center" border="false">
    	<table id="grid"></table>
	</div>
	<div class="easyui-window" title="销售记录修改" id="editRecordWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="update" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >修改并保存</a>
				<script type="text/javascript">
					$("#update").click(function(){
						var v = $("#updateForm").form("validate");
						if(v){
							$("#updateForm").submit();
						}
					});
				</script>
			</div>
		</div>
		
		<div style="overflow:auto;padding:5px;" border="false">
			<form id="updateForm" action="${pageContext.request.contextPath}/recordAction_update" method="post">
				<input type="hidden" name="id">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">房屋销售记录信息</td>
					</tr>
					<tr>
						<td>所售房屋</td>
						<td>
							<input class="easyui-combobox" id="room" name="room.id"  
    							data-options="valueField:'id',textField:'allName',url:'${pageContext.request.contextPath}/roomAction_findByAjax'" />  
						</td>
					</tr>
					<tr>
						<td>销售总价(¥)</td>
						<td><input type="text" name="subtotal" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>客户姓名</td>
						<td>
							<input class="easyui-combobox" id="customer" name="customer.id"  
    							data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/customerAction_findByAjax'" />  
						</td>
					</tr>
					<tr>
						<td>客户电话</td>
						<td><input type="text" id="phone" name="customer.phone" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>购买日期</td>
						<td><input type="text" name="buydate" class="easyui-datebox" required="true"/></td>
					</tr>
					<tr>
						<td>销售状态</td>
						<td>
							<select class="easyui-combobox" id="state" name="room.state" style="width:150px;">  
							    <option value="0">非售</option>  
							    <option value="1">可售</option>  
							    <option value="2">订购，待审核</option>  
							    <option value="3">审核完成，拟定合同</option>  
							    <option value="4">已签合同，销售完成</option>  
							</select> 
						</td>
					</tr>
					<tr>
						<td>销售人员</td>
						<td>
							<input class="easyui-combobox" id="user" name="user.id"  
    							data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/userAction_findByAjax'" />  
						</td>
					</tr>
					<tr>
						<td>审核状态</td>
						<td>
							<select class="easyui-combobox" name="isok" style="width:150px;">  
							    <option value="0">待审核</option>  
							    <option value="1">已通过</option>  
							</select> 
						</td>
					</tr>
					<tr>
						<td>备注</td>
						<td><input type="text" name="remark" class="easyui-validatebox" required="true"/></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- 查询分区 -->
	<div class="easyui-window" title="查询销售记录窗口" id="searchWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div style="overflow:auto;padding:5px;" border="false">
			<form id="searchForm">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">查询条件</td>
					</tr>
					<tr>
						<td>所售房屋</td>
						<td>
							<input class="easyui-combobox" name="room.id"  
    							data-options="valueField:'id',textField:'allName',url:'${pageContext.request.contextPath}/roomAction_findByAjax'" />  
						</td>
					</tr>
					<tr>
						<td>客户姓名</td>
						<td>
							<input class="easyui-combobox" name="customer.id"  
    							data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/customerAction_findByAjax'" />  
						</td>
					</tr>
					<tr>
						<td>客户电话</td>
						<td><input type="text" name="customer.phone" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>销售状态</td>
						<td>
							<select class="easyui-combobox" name="room.state" style="width:150px;"> 
								<option value="">--请选择--</option>  
							    <option value="0">非售</option>  
							    <option value="1">可售</option>  
							    <option value="2">订购，待审核</option>  
							    <option value="3">审核完成，拟定合同</option>  
							    <option value="4">已签合同，销售完成</option>  
							</select> 
						</td>
					</tr>
					<%-- <tr>
						<td>销售人员</td>
						<td>
							<input class="easyui-combobox" name="user.id"  
    							data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/userAction_findByAjax'" />  
						</td>
					</tr> --%>
					<tr>
						<td colspan="2"><a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a> </td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>