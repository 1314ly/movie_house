<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!-- 引入easyui -->
	<%@include file="top.jsp" %>
	
	<script type="text/javascript">
		$(function(){
		});
		
		function submits(){
			$("#fm").form('submit',{
			    onSubmit:function(){
                    return $(this).form('enableValidation').form('validate');
                },
				url:"emp/checkEmp",
				success:function(data){
					if(data==0){
						$.messager.show({
							title:"提示",
							msg:"登陆成功"
						});
						window.location="jsp/ly/home.jsp";
					}else if(data==1){
						$.messager.show({
							title:"提示",
							msg:"账号异常"
						});
						$("#fm").form('clear');
					}else{
						$.messager.show({
							title:"提示",
							msg:"登陆失败"
						});
						$("#fm").form('clear');
					}
				}
			});
		}
	</script>
  </head>
  
  <body>
  	<div class="easyui-window" title="登录" maximizable="false" style="width:500px;height:300px;padding:30px 40px"
  		data-options="collapsible:false,minimizable:false,closable:false,draggable:false,resizable:false,border:false" >
  		<form id="fm" method="post">
			<div style="margin-bottom: 30px">
				<input class="easyui-textbox" style="width:100%" name="ename" 
					data-options="label:'用户名:',iconCls:'icon-man'"
					required="required" validtype="username"/>
			</div>
			
			<div style="margin-bottom: 30px"> 
				<input class="easyui-passwordbox" style="width:100%" name="pwd" 
					data-options="label:'密码:'" required="required" />
			</div>
  			
  			<div style="margin-bottom: 30px;text-align: center">
				<a class="easyui-linkbutton" href="javascript:void(0)" onclick="submits()" data-options="iconCls:'icon-save'">提交</a>
			</div>
  		</form>
  	</div>
  </body>
</html>
