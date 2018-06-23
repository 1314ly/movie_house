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
			
			/* $("#eid").combobox({
				url:"emp/queryAll",
				valueField:'eid', //提交
				textField:'ename'
			}); */
			
			 $("#rid").combobox({
				url:"roles/queryAll",
				valueField:'rid', //提交
				textField:'rname' //显示文本
			}); 
			
			$("#tables").datagrid({
				url:"emp/queryPage",
				columns:[[
				  {field:'eid',checkbox:true,title:'编号',width:40},  
				  {field:'ename',title:'员工姓名',width:60},
				  {field:'idcard',title:'身份证号',width:100},
				  {field:'phone',title:'电话',width:100},
				  {field:'address',title:'地址',width:100},
				  {field:'did',title:'部门',width:100},
				  {field:'status',title:'状态',width:50},
				  {field:'photo',title:'照片',width:100},
				  {field:'hiredate',title:'入职日期',width:100},
				  {field:'leavedate',title:'离职日期',width:100},
				  {field:'uptime',title:'修改时间',width:100},
				]],
				idField:'eid',
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
				}
			});
		});
		
		//模糊查询
		function query(){
			$("#tables").datagrid("load", {    
			    ename: $("#ename").val(),
			}); 
		};
		
		// 打开新增窗口
		function add(){
			$("#fm").form('reset');
			$("#datawindow").window("open").window('setTitle',"新增");
			url = "emp/add";
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
                // 设置重复密码值等于密码
				$("#repwd").passwordbox("setValue",rows[0].pwd);

				// 设置表单提交路径
				url = "emp/updEmp";
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
			 if($("#eid").textbox("getValue")=="自动生成"){
				$("#eid").textbox("setValue",-1);
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
           data-options="fitColumns:true,toolbar:'#tools',idField:'eid',
    	   pagination:true,rownumbers:true">
      <center>
	    <input class="easyui-textbox" data-options="label:'用户名:'" style="width:30%"
						id="ename" name="ename" />
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" onclick="query()">查询</a>
	  </center>
    </table>
    
    <div id="tools">
    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" onclick="add()">新增</a>
    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" onclick="edit()">修改</a>
    </div>
    
	<div id="datawindow" class="easyui-window" style="width:100%;max-width:400px;padding:30px 40px">
		<form id="fm" method="post">
			<div style="margin-bottom: 20px">
				<!-- disabled：不提交 -->
				<input class="easyui-textbox" style="width:100%" readonly="readonly"
					id="eid" name="eid" data-options="label:'员工编号:'" value="自动生成"/>
			</div>
			
			<div style="margin-bottom: 20px"> 
				<input class="easyui-textbox" data-options="label:'用户名:'" style="width:100%"
					id="ename" name="ename" />
			</div>
			
			<div style="margin-bottom: 20px">
				<input class="easyui-passwordbox" data-options="label:'密码:'" style="width:100%"
					id="pwd" name="pwd" value="111"/>
			</div>
			
			<div style="margin-bottom: 20px">
				<input class="easyui-passwordbox" data-options="label:'重复密码:'" style="width:100%"
					id="repwd" value="111"/>
			</div>
			
			<div style="margin-bottom: 20px">
				<input class="easyui-combobox" data-options="label:'角色:'" style="width:100%"
					id="rid" name="rid" value="1"/>
			</div>
			
			<div style="margin-bottom: 20px">
				<input type="hidden" name="upuid" value="${logEmp.eid }"/>
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
