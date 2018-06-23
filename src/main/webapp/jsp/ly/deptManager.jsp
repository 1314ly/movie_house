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
	
	<!-- 引入easyui -->
	<%@include file="top.jsp" %>
	
	<script type="text/javascript">
	    var url;
	    
		$(function(){
		    //数据窗口隐藏
			$("#datawindow").window("close");
			
			$("#tables").datagrid({
				url:"dept/queryAll",
				columns:[[
				  {field:'dept_id',checkbox:true,title:'部门编号',width:40},  
				  {field:'dept_name',title:'部门名称',width:60},
				  {field:'ename',title:'操作人',width:60},
				  {field:'dept_time',title:'修改时间',width:100},
				]],
				/* idField:'dept_id',
				fitColumns:true,
				pagination:true, //显示分页工具栏
				pageList:[10,15,20],
				pageSize:10,
				striped:true,
				loadFilter:function(data){// 所有数据,源数据被修改
					var rows = data.rows;
					for(var i=0;i<rows.length;i++){
						if(rows[i].status==0){
							rows[i].status ="在职";
						}else if(rows[i].status==1){
							rows[i].status ="离职";
						}
					}
					return data;
				} */
			});
		});
		
		function query(){
			$("#tables").datagrid("load", {    
			    dept_name: $("#dept_name").val(),
			}); 
		};
		
		// 删除
		function dels(){
			// 获取所有选中行
			var rows = $("#tables").datagrid("getChecked");
			
			if(rows!=""){
				var ids=[];
				for(var i=0;i<rows.length;i++){
					ids[i] = rows[i].dept_id;
				}
				
				$.messager.confirm('提示','确定删除选中用户么?',function(r){
					if(r){
						$.post("dept/dels",{"ids":ids.toString()},function(data){
							if(data==1){
								$.messager.show({
									title:'提示',
									msg:"删除成功！"
								});
								$("#tables").datagrid("reload");	
							}
						});
					}
				});
				
			}else{
				$.messager.alert('提示','请选择要删除的数据');
			}
		}
		
		// 打开新增窗口
		function add(){
			$("#fm").form('reset');
			$("#datawindow").window("open").window('setTitle',"新增");
			url = "dept/add";
		}
		
		// 打开修改窗口
		function edit(){
			// 判断是否有选中项
			var rows = $("#tables").datagrid("getSelections");
			
			if(rows.length == 1){
                 // 重置表单
				$("#fm").form("reset");
				// 加载修改的数据信息
				$("#fm").form("load",rows[0]);

				// 设置表单提交路径
				url = "dept/edit";
			    // 打开窗口
				$("#datawindow").window("open").window('setTitle',"修改");
				
			}else if(rows.length > 1){
				$.messager.show({
					title:'提示',
					msg:"一次只能修改一条数据,请重新选择！"
				});
			}else{
				$.messager.show({
					title:'提示',
					msg:"请选择修改的数据！"
				});
			}
		}
		
		
		// 提交
		function submits(){
			 if($("#dept_id").textbox("getValue")=="自动生成"){
				$("#dept_id").textbox("setValue",-1);
			} 
			$("#fm").form("submit",{
				url:url,
				success:function(data){
					if(data==1){
						$.messager.show({
							title:'提示',
							msg:"操作成功！"
						});
						$("#datawindow").window("close");
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
			$("#datawindow").window("close");
		}
		
		// 重置
		function resets(){
			$("#fm").form('reset');
		}
		
	</script>
  </head>
  
  <body>
    <table id="tables" style="width:100%;height:100%"
           data-options="fitColumns:true,toolbar:'#tools',idField:'dept_id'">
    </table>
    
    <div id="tools">
    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" onclick="add()">新增</a>
    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" onclick="edit()">修改</a>
    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" onclick="dels()">删除</a>
    </div>
    
	<div id="datawindow" class="easyui-window" style="width:100%;max-width:400px;padding:30px 40px">
		<form id="fm" method="post">
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" style="width:100%" readonly="readonly"
					id="dept_id" name="dept_id" data-options="label:'部门编号:'" value="自动生成"/>
			</div>
			
			<div style="margin-bottom: 20px"> 
				<input class="easyui-textbox" data-options="label:'部门名称:'" style="width:100%"
					id="dept_name" name="dept_name" />
			</div>
			
			<div style="margin-bottom: 20px">
				<input type="hidden" name="dept_upeid" value="${logEmp.eid }"/>
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
