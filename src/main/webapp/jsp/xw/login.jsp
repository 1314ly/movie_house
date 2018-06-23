<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Contact</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="${pageContext.request.contextPath}/easyui/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/js/jquery-1.9.0.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/js/move-top.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/js/easing.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
	
</head>
<body>
	<%@ include file="head.jsp" %>
 <div class="main">
 	<div class="wrap">
     <div class="content">
     	<div class="content_top">
    		<div class="back-links">
    		<p><a href="index.html">Home</a> &gt;&gt;&gt;&gt; <a href="#" class="active">Contact</a></p>
    	    </div>
    		<div class="clear"></div>
    	</div>
    	<div class="section group">
				<div class="col span_2_of_3">
				  <div class="contact-form">
				  	<h2 align="center">登陆</h2>
					    <form method="post" action="${pageContext.request.contextPath }/users/">
					    	<div>
						    	<span><label>用户名</label></span>
						    	<span><input name="user_name" type="text" class="textbox" ></span>
						    </div>
						    <div>
						    	<span><label>密码</label></span>
						    	<input class="easyui-passwordbox" name="user_pwd" iconWidth="28" style="width:98%;height:40px;padding:10px"> 
						    </div>
						   <div>
						   		<span><input type="submit" value="登陆"  class="mybutton"></span>
						  </div>
					    </form>
				  </div>
  				</div>
  			
				<div class="col span_1_of_3">
					<div class="contact_info">
    	 				
      				</div>
      			
				 </div>
			  </div>		
         </div> 
    </div>
 </div>
   <%@ include file="low.jsp" %>
</body>
</html>