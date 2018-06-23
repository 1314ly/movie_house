<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'employeeManager.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<%@include file="top.jsp" %>

	<script type="text/javascript">
		$(function(){
			// 权限设置窗口
			$("#dl").dialog({
				title:"权限设置",
				toolbar: [{
					text:"保存",
					iconCls: 'icon-save',
					handler: function(){
						var lids = getChecklids();
						var rid = $("#tables").datagrid("getChecked")[0].rid;
						// 添加
						$.post("role_lib/savePermission",{"rid":rid,"lids":lids.toString()},function(data){
							
							if(data==1){
								$.messager.show({
									title:'提示',
									msg:"操作成功！"
								});
								$("#dl").dialog('close');
								$("#tables").datagrid("reload");
							}else{
								$.messager.show({
									title:'提示',
									msg:"操作失败！"
								});
							}
						});
					}
				}]
			});
			
			// 默认关闭
			$("#dl").dialog('close');
			//数据窗口隐藏
			$("#dm").window("close");
			
			// 初始化权限树状菜单
			$("#tt").tree({
				checkbox:true,
				onLoadSuccess:function(){
					var checked = $("#tables").datagrid("getChecked");
					if(checked.length==1){
						var lids = checked[0].lids.split(",");
						// 查询当前角色的权限id;
						for(var i=0;i<lids.length;i++){
							var node = $("#tt").tree("find",lids[i]);
							if( null!=node && null==node.children){
								$("#tt").tree("check",node.target);
							}
						}
					}
				}
			});
			
			// 初始化数据表格
			$("#tables").datagrid({
				url:"roles/queryAll",
				columns:[[
				  {field:'rid',title:'编号',width:40},  
				  {field:'rname',title:'角色名',width:60},
				  {field:'eid',title:'修改人编号',width:100,hidden:true},
				  {field:'uptime',title:'时间',width:100},
				  {field:'lids',title:'权限id',width:100,hidden:true},
				]],
				idField:'rid',
				fitColumns:true,
				striped:true,
				singleSelect:true,// 只能选中一行
				toolbar: [{
				    text:"添加",
					iconCls: 'icon-edit',
					handler: function(){
						$("#fm").form('reset');
			            $("#dm").window("open").window('setTitle',"新增");
			            url = "roles/add";
						
					}
				},'-',{ 
					text:"权限设置",
					iconCls: 'icon-edit',
					handler: function(){
						var checked = $("#tables").datagrid("getChecked");
						if(checked.length==0){
							$.messager.show({
								title:"提示",
								msg:"请选择要设置权限的角色"
							});
						}else{
							$("#dl").dialog('open');
							// 加载权限
							$("#tt").tree({
								url:"lib/getTree"
							});		
						}
					}
				}]
			});
		});
		
		// 获取树状菜单所有选中的节点id
		function getChecklids(){
			// var a = ["1","2","3","1","5",6,7];
			// alert($.inArray("1",a)); // 判断字符是否在数组中存在,返回的字符在数组中第一次出现的位置的下标
			var options = $("#tt").tree("getChecked");

			var lids = [];
			for(var i=0;i<options.length;i++){
				// 保存选中项的节点
				lids.push(options[i].id);
				
				// 获取选中项的父节点
				var node = options[i];
				do{
					node = getParentNode(node);
					// 判断是否有父节点,判断父节点的id是否已经保存
					if(null != node && $.inArray(node.id,lids) == -1){
						lids.push(node.id);
					}
				}while(null != node);
			}
			return lids;
		}
		
		// 获取指定节点的父节点
		function getParentNode(node){
			var parent = $("#tt").tree("getParent",node.target);
			return parent;
		}
		
		// 提交
		function submits(){
			 if($("#rid").textbox("getValue")=="自动生成"){
				$("#rid").textbox("setValue",-1);
			} 
			$("#fm").form("submit",{
				url:url,
				success:function(data){
					if(data==1){
						$.messager.show({
							title:'提示',
							msg:"操作成功！"
						});
						$("#dm").window("close");
						$("#tables").datagrid("reload");
					}else{
						$.messager.show({
							title:'提示',
							msg:"操作失败！"
						});
					}
				}
			});
		}
		
		// 取消
		function cancel(){
			$("#dm").window("close");
		}
		
		// 重置
		function resets(){
			$("#fm").form('reset');
		}
		
		
	</script>
  </head>
  
  <body>
    <table id="tables" style="width:100%;height:100%"></table>
    
    <div id="dl" style="width:300px;height:400px" >
    	<ul id="tt"></ul>
    </div>
    
   <div id="dm" class="easyui-window" style="width:100%;max-width:400px;padding:30px 40px">

    	<form id="fm" method="post">
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" style="width:100%" readonly="readonly"
					id="rid" name="rid" data-options="label:'角色编号:'" value="自动生成"/>
			</div>
			
			<div style="margin-bottom: 20px"> 
				<input class="easyui-textbox" data-options="label:'角色名称:'" style="width:100%"
					id="rname" name="rname" />
			</div>
			
			<div style="margin-bottom: 20px">
				<input type="hidden" name="eid" value="${logEmp.eid }"/>
				<input class="easyui-textbox" value="${logEmp.ename }" disabled="disabled"
					data-options="label:'操作人:'" style="width:100%"/>
			</div>
			
			<div style="margin-bottom: 20px;text-align: center">
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" onclick="submits()">提交</a>
		    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" onclick="resets()">重置</a>
		    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" onclick="cancel()">取消</a>
			</div>
		</form>
    </div>
  </body>
</html>
