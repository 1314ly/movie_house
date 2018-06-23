<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'personal.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!-- 引入easyui -->
	<%@include file="top.jsp" %>
	
	<script type="text/javascript">
		$(function(){
			$("#submits,#repwd,#cancle").hide();
			$("#eid,#ename,#pwd,#idcard,#phone,#address,#uptime").textbox("disable","true");
			
			$("#edit").click(function(){
				$("#submits,#repwd,#cancle").show();
				$("#edit").hide();
				$("#eid,#ename,#pwd,#idcard,#phone,#address,#uptime").textbox("enable","true");
			    $("#eid").textbox("readonly","true");
			});
			
			$("#cancle").click(function(){
				$("#submits,#repwd,#cancle").hide();
				$("#edit").show();
				$("#eid,#ename,#pwd,#idcard,#phone,#address,#uptime").textbox("disable","true");
				// 重新加载
				$.post("emp/getLogEmp",function(data){
					$("#fm").form('load',data);
				});
			});
			
			$("#submits").click(function(){
			   if($("#eid").textbox("getValue")=="自动生成"){
				$("#eid").textbox("setValue",-1);
			   }
			$("#fm").form("submit",{
				url:"emp/updEmp",
				success:function(data){
					if(data==1){
						$.messager.show({
							title:'提示',
							msg:"操作成功！"
						});
						$("#fm").window("close");
						
					}else{
						$.messager.show({
							title:'提示',
							msg:"操作失败！"
						});
					}
				}
			});
			});
			
		});
	
	</script>
  </head>
  
  <body>
    <form id="fm" action="">
    	<table>
    		<tr>
    			<td>员工编号：</td>
    			<td>
    				<input class="easyui-textbox" value="${logEmp.eid }" name="eid" id="eid"/>
    			</td>
    		</tr>
    		<tr>
    			<td>姓名：</td>
    			<td>
    				<input class="easyui-textbox" value="${logEmp.ename }" name="ename" id="ename"/>
    			</td>
    		</tr>
    		<tr>
    			<td>密码：</td>
    			<td>
    				<input class="easyui-passwordbox" value="${logEmp.pwd }" name="pwd" id="pwd"/>
    			</td>
    		</tr>
    		<tr id="repwd">
    			<td>重复密码：</td>
    			<td>
    				<input class="easyui-passwordbox" value="${logEmp.pwd }" />
    			</td>
    		</tr>
    		<tr>
    			<td>身份证号：</td>
    			<td>
    				<input class="easyui-textbox" value="${logEmp.idcard }" name="idcard" id="idcard"/>
    			</td>
    		</tr>
    		<tr>
    			<td>手机号：</td>
    			<td>
    				<input class="easyui-textbox" value="${logEmp.phone }" name="phone" id="phone"/>
    			</td>
    		</tr>
    		<tr>
    			<td>地址：</td>
    			<td>
    				<input class="easyui-textbox" value="${logEmp.address }" name="address" id="address"/>
    			</td>
    		</tr>
    		<tr>
    			<td>修改时间：</td>
    			<td>
    				<input class="easyui-textbox" value="${logEmp.uptime }" name="uptime" id="uptime"/>
    			</td>
    		</tr>
			<tr>
				<td>
					<a class="easyui-linkbutton" href="javascript:void(0)" id="edit" data-options="iconCls:'icon-edit'">修改</a>
					<a class="easyui-linkbutton" href="javascript:void(0)" id="submits" data-options="iconCls:'icon-save'">提交</a>
					<a class="easyui-linkbutton" href="javascript:void(0)" id="cancle" data-options="iconCls:'icon-cancel'">取消</a>
				</td>
			</tr>
    	</table>
    
    </form>
  </body>
</html>
