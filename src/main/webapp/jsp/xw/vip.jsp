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
<div class="header">
		 <div class="headertop_desc">
			<div class="wrap">
				<div class="nav_list">
					<ul>
						<li><a href="index.html">首页</a></li>
			
						
					</ul>
				</div>
					<div class="account_desc">
						<ul>
							<li><a href="contact.jsp">注册</a></li>
							<li><a href="contact.jsp">登陆</a></li>
							<li><a href="preview.jsp">交付</a></li>
							<li><a href="#">付款</a></li>
							<li><a href="#">我的账户</a></li>
						</ul>
					</div>
				<div class="clear"></div>
			</div>
	  	</div>
  	  		<div class="wrap">
				<div class="header_top">
					<div class="logo">
						<a href="index.jsp"><img src="${pageContext.request.contextPath}/easyui/images/vip.jpg" alt="" style="width: 200px;height: 100px" /></a>
					</div>
						<div class="header_top_right">
						  <div class="cart" style="display: none">
						  	   
						  </div>
							  <div class="search_box" dis>
					     		余额：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					     		<a id="btn" href="index.jsp" class="easyui-linkbutton">充值</a>
					     	</div>
						 <div class="clear"></div>
					</div>
					
					 <script type="text/javascript">
								function DropDown(el) {
									this.dd = el;
									this.initEvents();
								}
								DropDown.prototype = {
									initEvents : function() {
										var obj = this;
					
										obj.dd.on('click', function(event){
											$(this).toggleClass('active');
											event.stopPropagation();
										});	
									}
								};
					
								$(function() {
					
									var dd = new DropDown( $('#dd') );
					
									$(document).click(function() {
										// all dropdowns
										$('.wrapper-dropdown-2').removeClass('active');
									});
					
								});
</script>
			   <div class="clear"></div>
  		    </div>     				
   		</div>
   </div>
 <div class="main">
 	<div class="wrap">
     <div class="content">
     	<div class="content_top">
    		<div class="back-links">
    		
    		<p><h1>充值记录 </h1>  </p>
    	    </div>
    		<div class="clear"></div>
    	</div>
    	<div class="section group">
				<div class="col span_2_of_3">
				  <div class="contact-form">
				  	
					    <form method="post" action="${pageContext.request.contextPath }/users/regist">
					    	<div>
						    	<span><label>用户名</label></span>
						    	<span><input name="user_name" type="text" class="textbox" ></span>
						    </div>
						    <div>
						    	<span><label>密码</label></span>
						    	<input class="easyui-passwordbox" name="user_pwd" iconWidth="28" style="width:98%;height:40px;padding:10px"> 
						    </div>
						    <div>
						     	<span><label>生日</label></span>
						    	<span><input  id="dd"  type= "text" name="user_birth" class= "easyui-datebox"/> </span>
						    </div>
						    <div>
						     	<span><label>性别</label></span>
						    	<select id="sex" class="easyui-combobox" name="user_sex" style="width:98%;">   
								    <option value="男">男</option>   
								    <option value="女">女</option>     
								</select>  
						    </div>
						   <div>
						     	<span><label>电话号</label></span>
						    	  <span><input name="user_phone" type="text" class="textbox" ></span>
						    </div>
						   <div>
						   		<span><input type="submit" value="提交"  class="mybutton"></span>
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