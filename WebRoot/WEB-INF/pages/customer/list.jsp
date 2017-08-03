<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理分区</title>
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
		$('#addCustomerWindow').window("open");
	}
	
	function doEdit(){
		var rows = $("#grid").datagrid("getSelections");
		if(rows.length!=1){
			$.messager.alert("提示信息","请选择唯一一个需要修改的区域","warning");
		}else {
			$("#editCustomerWindow").window("open");
			$("#updateForm").form("load",rows[0]);
		}
	}
	
	function doDelete(){
		alert("删除...");
	}
	
	function doSearch(){
		$('#searchWindow').window("open");
	}
	
	function doExport(){
		/* window.location.href="pageContext.request.contextPath}/subareaAction_exprotXls"; */
	}
	
	function doImport(){
		alert("导入");
	}
	
	//工具栏
	var toolbar = [ {
		id : 'button-search',	
		text : '查询',
		iconCls : 'icon-search',
		handler : doSearch
	}, {
		id : 'button-add',
		text : '增加',
		iconCls : 'icon-add',
		handler : doAdd
	}, {
		id : 'button-edit',	
		text : '修改',
		iconCls : 'icon-edit',
		handler : doEdit
	}];
	// 定义列
	var columns = [ [ {
		field : 'id',
		checkbox : true,
	}, {
		field : 'name',
		title : '客户姓名',
		width : 120,
		align : 'center',
	},{
		field : 'gender',
		title : '性别',
		width : 90,
		align : 'center',
		formatter : function(data,row, index){
			if(data=="0"){
				return "女";
			}else if(data=="1"){
				return "男";
			}
		}
	}, {
		field : 'job',
		title : '职业',
		width : 120,
		align : 'center',
	}, {
		field : 'phone',
		title : '联系电话',
		width : 120,
		align : 'center',
	}, {
		field : 'narea',
		title : '需求面积(m²)',
		width : 120,
		align : 'center'
	}, {
		field : 'style',
		title : '需求房型',
		width : 120,
		align : 'center'
	}, {
		field : 'howprice',
		title : '价格反映',
		width : 100,
		align : 'center',
		formatter : function(data,row, index){
			if(data=="0"){
				return "较高";
			}else if(data=="1"){
				return "高";
			}else if(data=="2"){
				return "适当";
			}else if(data=="3"){
				return "低";
			}else if(data=="4"){
				return "较优惠";
			}
		}
	} , {
		field : 'isbuy',
		title : '购买意向',
		width : 150,
		align : 'center',
		formatter : function(data,row, index){
			if(data=="0"){
				return "决定购买";
			}else if(data=="1"){
				return "考虑中（意向较高）";
			}else if(data=="2"){
				return "考虑中（意向较低）";
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
			url : "{pageContext.request.contextPath}/customerAction_pageQuery",
			idField : 'id',
			columns : columns,
			onDblClickRow : doDblClickRow
		});
		
		// 添加、修改客户
		$('#addCustomerWindow').window({
	        title: '添加修改客户',
	        width: 600,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 500,
	        resizable:false
	    });
	    
	    $('#editCustomerWindow').window({
	        title: '添加修改客户',
	        width: 600,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 500,
	        resizable:false
	    });
		
		// 查询客户
		$('#searchWindow').window({
	        title: '查询客户',
	        width: 400,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false
	    });
	    
	    
	    $.extend($.fn.validatebox.defaults.rules,{
			telephone:{
				validator:function(value,param){
					var phone = /^1[3|5|7|8][0-9]{9}$/;
					return phone.test(value);
				},
				message:'手机号格式错误'	
			}
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
        
        $("#update").click(function(){
			var v = $("#updateForm").form("validate");
			if(v){
				$("#updateForm").submit();
			}
		}); 
        
		
	});

	function doDblClickRow(rowIndex, rowData){
		$("#editCustomerWindow").window("open");
		$("#updateForm").form("load",rowData);
	}
</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<div region="center" border="false">
    	<table id="grid"></table>
	</div>
	<!-- 添加 修改客户 -->
	<div class="easyui-window" title="客户添加修改" id="addCustomerWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="save" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
				<script type="text/javascript">
					$("#save").click(function(){
						var v = $("#saveForm").form("validate");
						if(v){
							$("#saveForm").submit();
						}
					});
				</script>
			</div>
		</div>
		
		<div style="overflow:auto;padding:5px;" border="false">
			<form id="saveForm" action="${pageContext.request.contextPath}/customerAction_save" method="post">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">客户信息</td>
					</tr>
					<tr>
						<td>客户姓名</td>
						<td><input type="text" name="name" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>性别</td>
						<td>
							<select class="easyui-combobox" name="gender" style="width:150px;">  
							    <option value="0">女</option>  
							    <option value="1">男</option>  
							</select>
						</td>
					</tr>
					<tr>
						<td>职业</td>
						<td><input type="text" name="job" class="easyui-validatebox" /></td>
					</tr>
					<tr>
						<td>联系电话</td>
						<td><input type="text" validType="telephone" name="phone" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>需求面积</td>
						<td><input type="text" name="narea" class="easyui-validatebox" /></td>
					</tr>
					<tr>
						<td>需求房型</td>
						<td>
							<select class="easyui-combobox" name="style" style="width:150px;">  
							    <option value="一室一厅">一室一厅</option>  
							    <option value="两室一厅">两室一厅</option>  
							    <option value="三室一厅">三室一厅</option>  
							    <option value="两室两厅">两室两厅</option>  
							    <option value="三室两厅">三室两厅</option>  
							    <option value="别墅">别墅</option>  
							    <option value="其他类型">其他类型</option>  
							</select> 
						</td>
					</tr>
					<tr>
						<td>价格反映</td>
						<td>
							<select class="easyui-combobox" name="howprice" style="width:150px;">  
							    <option value="0">较高</option>  
							    <option value="1">高</option>  
							    <option value="2">适当</option>  
							    <option value="3">低</option>  
							    <option value="4">较优惠</option>  
							</select>
						</td>
					</tr>
					<tr>
						<td>购买意向</td>
						<td>
							<select class="easyui-combobox" name="isbuy" style="width:150px;">  
							    <option value="0">决定购买</option>  
							    <option value="1">考虑中（意向较高）</option>  
							    <option value="2">考虑中（意向较低）</option>  
							</select>
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
	<!-- 查询客户 -->
	<div class="easyui-window" title="查询客户窗口" id="searchWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div style="overflow:auto;padding:5px;" border="false">
			<form id="searchForm">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">查询条件</td>
					</tr>
					<tr>
						<td>客户姓名</td>
						<td><input type="text" name="name"/></td>
					</tr>
					<tr>
						<td>职业</td>
						<td><input type="text" name="job"/></td>
					</tr>
					<tr>
						<td>联系电话</td>
						<td><input type="text" name="phone"/></td>
					</tr>
					<tr>
						<td>需求房型</td>
						<td><input type="text" name="style"/></td>
					</tr>
					<tr>
						<td colspan="2"><a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a> </td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<div class="easyui-window" title="客户修改" id="editCustomerWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="update" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >修改并保存</a>
			</div>
		</div>
		
		<div style="overflow:auto;padding:5px;" border="false">
			<form id="updateForm" action="${pageContext.request.contextPath}/customerAction_update" method="post">
				<input type="hidden" name="id">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">客户信息</td>
					</tr>
					<tr>
						<td>客户姓名</td>
						<td><input type="text" name="name" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>性别</td>
						<td>
							<select class="easyui-combobox" name="gender" style="width:150px;">  
							    <option value="0">女</option>  
							    <option value="1">男</option>  
							</select>
						</td>
					</tr>
					<tr>
						<td>职业</td>
						<td><input type="text" name="job" class="easyui-validatebox" /></td>
					</tr>
					<tr>
						<td>联系电话</td>
						<td><input type="text" validType="telephone" name="phone" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>需求面积</td>
						<td><input type="text" name="narea" class="easyui-validatebox" /></td>
					</tr>
					<tr>
						<td>需求房型</td>
						<td>
							<select class="easyui-combobox" name="style" style="width:150px;">  
							    <option value="一室一厅">一室一厅</option>  
							    <option value="两室一厅">两室一厅</option>  
							    <option value="三室一厅">三室一厅</option>  
							    <option value="两室两厅">两室两厅</option>  
							    <option value="三室两厅">三室两厅</option>  
							    <option value="别墅">别墅</option>  
							    <option value="其他类型">其他类型</option>  
							</select> 
						</td>
					</tr>
					<tr>
						<td>价格反映</td>
						<td>
							<select class="easyui-combobox" name="howprice" style="width:150px;">  
							    <option value="0">较高</option>  
							    <option value="1">高</option>  
							    <option value="2">适当</option>  
							    <option value="3">低</option>  
							    <option value="4">较优惠</option>  
							</select>
						</td>
					</tr>
					<tr>
						<td>购买意向</td>
						<td>
							<select class="easyui-combobox" name="isbuy" style="width:150px;">  
							    <option value="0">决定购买</option>  
							    <option value="1">考虑中（意向较高）</option>  
							    <option value="2">考虑中（意向较低）</option>  
							</select>
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
</body>
</html>