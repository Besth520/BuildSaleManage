<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/easyui/themes/icon.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/ztree/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/ztree/jquery.ztree.all-3.5.js"></script>
  	<script type="text/javascript">
  		var setting = {
			data: {
				simpleData: {
					enable: true
				}
			},
			callback:{
				onClick:addT
			}
		};
		var zNodes = [
			{id:1,pId:0,name:"父1",open:"true"},
			{id:11,pId:1,name:'子11'},
			{id:12,pId:1,name:'子12'},
			{id:2,pId:0,name:"父2",open:"true"},
			{id:21,pId:2,name:'子21'},
			{id:22,pId:2,name:'子22',page:'http://www.baidu.com'}
		];
		function addT(event, treeId, treeNode, clickFlag) {
			var page = treeNode.page;
			if(page != undefined){
				var tab = $("#tabs").tabs("exists",treeNode.name);
				if(tab){
					$("#tabs").tabs("select",treeNode.name);
				}else {
					$("#tabs").tabs("add",{
						iconCls:'icon-add',
						closable:'true',
						title:treeNode.name,
						content:'<iframe frameborder="0" width="100%" height="100%" src="https://www.baidu.com"></iframe>'
					})
				}
			}
		
		};
		$(function(){
			$.fn.zTree.init($("#tree"),setting,zNodes);
		});
  	</script>
  </head>
  
  <body class="easyui-layout">
    <div data-options="region:'north'" style="height:100px" title="宅急送">north</div>
    <div data-options="region:'west'" style="width:200px" title="系统菜单">
    	<div class="easyui-accordion" data-options="fit:'true'">
    		<div data-options="iconCls:'icon-ok'" title="基础功能">
    			<a onclick="addTab()" class="easyui-linkbutton">google</a>
    			<ul id="tree" class="ztree"></ul>
    		</div>
    		<script type="text/javascript">
    			function addTab(){
    				$("#tabs").tabs("add",{
    					iconCls:'icon-search',
    					closable:'true',
    					title:'google',
    					content:'<iframe frameborder="0" width="100%" height="100%" src="https://www.google.com"></iframe>'
    				});
    			}
    		</script>
    		<div data-options="iconCls:'icon-ok'" title="系统功能">
    			用户
    		</div>
    	</div>
    </div>
    <div data-options="region:'center'">
    	<div class="easyui-tabs" id="tabs">
    		<div title="t1" data-options="iconCls:'icon-add',closable:'true'"></div>
    		<div title="t2" data-options="iconCls:'icon-remove',closable:'true'"></div>
    		<div title="t3" data-options="iconCls:'icon-ok',closable:'true'"></div>
    		
    	</div>
    </div>
    <div data-options="region:'east'" style="width:200px">east</div>
    <div data-options="region:'south'" style="height:100px">south</div>
  </body>
</html>
