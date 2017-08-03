<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理房屋</title>
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
<script 
	src="${pageContext.request.contextPath }/js/easyui/outOfBounds.js" type="text/javascript"></script>
<script type="text/javascript">
	function doAdd(){
		$('#addRoomWindow').window("open");
	}
	
	function doEdit(){
		var rows = $("#grid").datagrid("getSelections");
		if(rows.length!=1){
			$.messager.alert("提示信息","请选择唯一一个需要修改的区域","warning");
		}else {
			$("#editRoomWindow").window("open");
			$("#updateForm").form("load",rows[0]);
			$('#house').combobox('setValue',rows[0].build.house.id);
			$('#build').combobox('setValue',rows[0].build.id);
		}
	}
	
	function doDelete(){
		alert("删除...");
	}
	
	function doSearch(){
		$('#searchWindow').window("open");
	}
	
	function doExport(){
		window.location.href="pageContext.request.contextPath}/subareaAction_exprotXls";
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
		title : '房屋名称',
		width : 100,
		align : 'center',
	}, {
		field : 'build.allName',
		title : '所属楼房和楼盘',
		width : 130,
		align : 'center',
		formatter : function(data,row ,index){
			return row.build.allName;
		}
	},{
		field : 'type',
		title : '房屋类型',
		width : 100,
		align : 'center',
		formatter : function(data,row, index){
			if(data=="0"){
				return "一室一厅";
			}else if(data=="1"){
				return "二室一厅";
			}else if(data=="2"){
				return "三室一厅";
			}else if(data=="3"){
				return "四室一厅";
			}else if(data=="4"){
				return "五室一厅";
			}else if(data=="5"){
				return "两室两厅 ";
			}else if(data=="6"){
				return "三室两厅";
			}else if(data=="7"){
				return "四室两厅";
			}else if(data=="8"){
				return "五室两厅";
			}else if(data=="9"){
				return "四室三厅";
			}else if(data=="10"){
				return "五室三厅";
			}else if(data=="11"){
				return "五室户以上";
			}
		}
	}, {
		field : 'direction',
		title : '房屋朝向',
		width : 100,
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
		field : 'style',
		title : '房屋户型',
		width : 100,
		align : 'center',
		formatter : function(data,row, index){
			if(data=="0"){
				return "平层住宅";
			}else if(data=="1"){
				return "跃层住宅";
			}else if(data=="2"){
				return "错层住宅";
			}else if(data=="3"){
				return "复式住宅";
			}else if(data=="4"){
				return "花园洋房式住宅(别墅)";
			}
		}
	}, {
		field : 'parea',
		title : '公摊面积(m²)',
		width : 100,
		align : 'center'
	}, {
		field : 'oarea',
		title : '套内面积(m²)',
		width : 100,
		align : 'center'
	}, {
		field : 'tarea',
		title : '销售面积(m²)',
		width : 100,
		align : 'center'
	} , {
		field : 'price',
		title : '销售单价(¥/m²)',
		width : 100,
		align : 'center'
	} , {
		field : 'state',
		title : '销售状态',
		width : 100,
		align : 'center',
		formatter : function(data,row, index){
			if(data=="0"){
				return "非售";
			}else if(data=="1"){
				return "可售";
			}else if(data=="2"){
				return "订购，待审核";
			}else if(data=="3"){
				return "审核完成，拟定合同";
			}else if(data=="4"){
				return "已签合同，销售完成";
			}
		}
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
			url : "{pageContext.request.contextPath}/roomAction_pageQuery",
			idField : 'id',
			columns : columns,
			onDblClickRow : doDblClickRow
		});
		
		// 添加房屋
		$('#addRoomWindow').window({
	        title: '添加房屋',
	        width: 600,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false
	    });
	    
	    $('#editRoomWindow').window({
	        title: '修改房屋',
	        width: 600,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false
	    });
		
		// 查询分区
		$('#searchWindow').window({
	        title: '查询房屋',
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
		$("#editRoomWindow").window("open");
		$("#updateForm").form("load",rowData);
		$('#house').combobox('setValue',rowData.build.house.id);
		$('#build').combobox('setValue',rowData.build.id);
	}
</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<div region="center" border="false">
    	<table id="grid"></table>
	</div>
	<!-- 添加房屋 -->
	<div class="easyui-window" title="房屋添加" id="addRoomWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
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
			<form id="saveForm" action="${pageContext.request.contextPath}/roomAction_save" method="post">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">房屋信息</td>
					</tr>
					<tr>
						<td>房屋名称</td>
						<td><input type="text" name="name" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>所属楼房和楼盘</td>
						<td>
							<input class="easyui-combobox" name="build.id"  
    							data-options="valueField:'id',textField:'allName',url:'${pageContext.request.contextPath}/buildAction_findByAjax'" />  
						</td>
					</tr>
					<tr>
						<td>房屋类型</td>
						<td>
							<select class="easyui-combobox" name="type" style="width:150px;">  
							    <option value="0">一室一厅</option>  
							    <option value="1">二室一厅</option>  
							    <option value="2">三室一厅</option>  
							    <option value="3">四室一厅</option>  
							    <option value="4">五室一厅</option>  
							    <option value="5">两室两厅 </option>  
							    <option value="6">三室两厅</option>  
							    <option value="7">四室两厅</option>  
							    <option value="8">五室两厅</option>  
							    <option value="9">四室三厅</option>  
							    <option value="10">五室三厅</option>  
							    <option value="11">五室户以上</option>  
							</select>
						</td>
					</tr>
					<tr>
						<td>房屋朝向</td>
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
						<td>房屋户型</td>
						<td>
							<select class="easyui-combobox" name="style" style="width:150px;">  
							    <option value="0">平层住宅</option>  
							    <option value="1">跃层住宅</option>  
							    <option value="2">错层住宅</option>  
							    <option value="3">复式住宅</option>  
							    <option value="4">花园洋房式住宅(别墅)</option>  
							</select>
						</td>
					</tr>
					<tr>
						<td>公摊面积(m²)</td>
						<td><input type="text" name="parea" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>套内面积(m²)</td>
						<td><input type="text" name="oarea" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>销售面积(m²)</td>
						<td><input type="text" name="tarea" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>销售单价(¥/m²)</td>
						<td><input type="text" name="price" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>销售状态</td>
						<td>
							<select class="easyui-combobox" name="state" style="width:150px;">  
							    <option value="0">非售</option>  
							    <option value="1">可售</option>  
							</select>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<!--修改房屋 -->
	<div class="easyui-window" title="房屋修改" id="editRoomWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
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
			<form id="updateForm" action="${pageContext.request.contextPath}/roomAction_update" method="post">
				<input type="hidden" name="id">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">房屋信息</td>
					</tr>
					<tr>
						<td>房屋名称</td>
						<td><input type="text" name="name" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>所属楼房和楼盘</td>
						<td>
							<input class="easyui-combobox" id="build" name="build.id"  
    							data-options="valueField:'id',textField:'allName',url:'${pageContext.request.contextPath}/buildAction_findByAjax'" />  
						</td>
					</tr>
					<tr>
						<td>房屋类型</td>
						<td>
							<select class="easyui-combobox" name="type" style="width:150px;">  
							    <option value="0">一室一厅</option>  
							    <option value="1">二室一厅</option>  
							    <option value="2">三室一厅</option>  
							    <option value="3">四室一厅</option>  
							    <option value="4">五室一厅</option>  
							    <option value="5">两室两厅 </option>  
							    <option value="6">三室两厅</option>  
							    <option value="7">四室两厅</option>  
							    <option value="8">五室两厅</option>  
							    <option value="9">四室三厅</option>  
							    <option value="10">五室三厅</option>  
							    <option value="11">五室户以上</option>  
							</select>
						</td>
					</tr>
					<tr>
						<td>房屋朝向</td>
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
						<td>房屋户型</td>
						<td>
							<select class="easyui-combobox" name="style" style="width:150px;">  
							    <option value="0">平层住宅</option>  
							    <option value="1">跃层住宅</option>  
							    <option value="2">错层住宅</option>  
							    <option value="3">复式住宅</option>  
							    <option value="4">花园洋房式住宅(别墅)</option>  
							</select>
						</td>
					</tr>
					<tr>
						<td>公摊面积(m²)</td>
						<td><input type="text" name="parea" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>套内面积(m²)</td>
						<td><input type="text" name="oarea" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>销售面积(m²)</td>
						<td><input type="text" name="tarea" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>销售单价(¥/m²)</td>
						<td><input type="text" name="price" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>销售状态</td>
						<td>
							<select class="easyui-combobox" name="state" style="width:150px;">  
							    <option value="0">非售</option>  
							    <option value="1">可售</option>  
							</select>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- 查询房屋 -->
	<div class="easyui-window" title="查询房屋窗口" id="searchWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div style="overflow:auto;padding:5px;" border="false">
			<form id="searchForm">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">查询条件</td>
					</tr>
					<tr>
						<td>房屋名称</td>
						<td><input type="text" name="name"/></td>
					</tr>
					<tr>
						<td>所属楼房和楼盘</td>
						<td>
							<input class="easyui-combobox" id="build" name="build.id"  
    							data-options="valueField:'id',textField:'allName',url:'${pageContext.request.contextPath}/buildAction_findByAjax'" />  
						</td>
					</tr>
					<tr>
						<td>房屋类型</td>
						<td>
							<select class="easyui-combobox" name="type" style="width:150px;">
								<option value="">--请选择--</option>   
							    <option value="0">一室一厅</option>  
							    <option value="1">二室一厅</option>  
							    <option value="2">三室一厅</option>  
							    <option value="3">四室一厅</option>  
							    <option value="4">五室一厅</option>  
							    <option value="5">两室两厅 </option>  
							    <option value="6">三室两厅</option>  
							    <option value="7">四室两厅</option>  
							    <option value="8">五室两厅</option>  
							    <option value="9">四室三厅</option>  
							    <option value="10">五室三厅</option>  
							    <option value="11">五室户以上</option>  
							</select>
						</td>
					</tr>
					<tr>
						<td>房屋朝向</td>
						<td>
							<select class="easyui-combobox" name="direction" style="width:150px;">
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
						<td>房屋户型</td>
						<td>
							<select class="easyui-combobox" name="style" style="width:150px;">
								<option value="">--请选择--</option>   
							    <option value="0">平层住宅</option>  
							    <option value="1">跃层住宅</option>  
							    <option value="2">错层住宅</option>  
							    <option value="3">复式住宅</option>  
							    <option value="4">花园洋房式住宅(别墅)</option>  
							</select>
						</td>
					</tr>
					<tr>
						<td>销售面积(m²)</td>
						<td><input type="text" name="tarea"/></td>
					</tr>
					<tr>
						<td>销售单价(¥/m²)</td>
						<td><input type="text" name="price"/></td>
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