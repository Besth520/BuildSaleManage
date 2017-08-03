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
	$(function(){
		$("body").css({visibility:"visible"});
		$('#save').click(function(){
			if($("#form").form("validate")){
				$('#form').submit();
			}
		});
	});
</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
		<div class="datagrid-toolbar">
			<a id="save" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
		</div>
	</div>
    <div region="center" style="overflow:auto;padding:5px;" border="false">
       <form id="form" method="post" action="${pageContext.request.contextPath }/recordAction_save">
           <table class="table-edit"  width="95%" align="center">
           		<tr class="title"><td colspan="4">基本信息</td></tr>
	           	<tr><td>所售房屋:</td><td><input class="easyui-combobox" id="room" name="room.id"  
    							data-options="valueField:'id',textField:'allName',url:'${pageContext.request.contextPath}/roomAction_findByAjaxCondition'" /> </td>
					<td>销售总价(¥):</td><td><input type="text" name="subtotal" class="easyui-validatebox" required="true"/></td></tr>
				<tr><td>客户姓名:</td><td><input class="easyui-combobox" id="customer" name="customer.id"  
    							data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/customerAction_findByAjax'" /></td>
					<td>客户电话:</td><td><input type="text" id="phone" name="customer.phone" class="easyui-validatebox" required="true"/></td></tr>
				<tr class="title"><td colspan="4">其他信息</td></tr>
	           	<tr><td>购买日期:</td><td><input type="text" name="buydate" class="easyui-datebox"/></td>
					<td>销售状态:</td><td><select class="easyui-combobox" id="state" name="room.state" style="width:150px;">  
							    <option value="0">非售</option>  
							    <option value="1">可售</option>  
							    <option value="2">订购，待审核</option>  
							    <option value="3">审核完成，拟定合同</option>  
							    <option value="4">已签合同，销售完成</option>  
							</select></td></tr>
	           	<tr><td>销售人员:</td><td>
	           		<input class="easyui-combobox" id="user" name="user.id"  
    							data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/userAction_findByAjax'" />
	           	</td>
					<td>审核状态:</td><td>
					<select class="easyui-combobox" name="isok" style="width:150px;">  
							    <option value="0">待审核</option>  
							    <option value="1">已通过</option>  
					</select>
				</td></tr>
	           	<tr><td>备注:</td><td colspan="3"><textarea name="remark" style="width:80%"></textarea></td></tr>
           </table>
       </form>
	</div>
</body>
</html>