<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Home</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="${pageContext.request.contextPath}/easyui/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${pageContext.request.contextPath}/easyui/css/slider.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/js/jquery-1.9.0.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/js/move-top.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/js/easing.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/js/jquery.nivo.slider.js"></script>
<script type="text/javascript">

    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    </script>
</head>
<body>
	<%@ include file="head.jsp" %>
	   
				<div class="header_bottom">
					<div class="header_bottom_left">				
						<div class="categories">
						   <ul>
						  	   <h3>分类</h3>
							      <li><a href="#">全部</a></li>
							      <li><a href="#">印度语</a></li>
							      <li><a href="#">泰语</a></li>
							      <li><a href="#">英语</a></li>
							      <li><a href="#">泰米尔语</a></li>
							       <li><a href="#">玛拉雅拉姆语</a></li>
							       <li><a href="#">卡纳达语</a></li>
							       <li><a href="#">孟加拉语</a></li>
							       <li><a href="#">Assami</a></li>
							       <li><a href="#">儿童</a></li>
							       <li><a href="#">卡通</a></li>
							       <li><a href="#">游戏</a></li>
						  	 </ul>
						</div>					
		  	         </div>
						    <div class="header_bottom_right">					 
						 	    <!------ Slider ------------>
								  <div class="slider">
							      	<div class="slider-wrapper theme-default">
							            <div id="slider" class="nivoSlider">
							                <img src="${pageContext.request.contextPath}/easyui/images/1.jpg" data-thumb="${pageContext.request.contextPath}/easyui/images/1.jpg" alt="" />
							                <img src="${pageContext.request.contextPath}/easyui/images/2.jpg" data-thumb="${pageContext.request.contextPath}/easyui/images/2.jpg" alt="" />
							                <img src="${pageContext.request.contextPath}/easyui/images/3.jpg" data-thumb="${pageContext.request.contextPath}/easyui/images/3.jpg" alt="" />
							                <img src="${pageContext.request.contextPath}/easyui/images/4.jpg" data-thumb="${pageContext.request.contextPath}/easyui/images/4.jpg" alt="" />
							                 <img src="${pageContext.request.contextPath}/easyui/images/5.jpg" data-thumb="${pageContext.request.contextPath}/easyui/images/5.jpg" alt="" />
							            </div>
							        </div>
						   		</div>
			         </div>
			     <div class="clear"></div>
			</div>
   		</div>
   </div>

  <div class="main">
  	<div class="wrap">
      <div class="content">
    	<div class="content_top">
    		<div class="heading">
    		<h3>最新电影</h3>
    		</div>
    	</div>
	      <div class="section group">
				<div class="grid_1_of_5 ${pageContext.request.contextPath}/easyui/images_1_of_5">
					 <a href="preview.html"><img src="${pageContext.request.contextPath}/easyui/images/end-game.jpg" alt="" /></a>
					 <h2>电影名：<a href="preview.html">End Game</a></h2>
					<div class="price-details">
				       <div class="price-number">
							<p>标签：<span class="rupees">动作|剧情|惊悚</span></p>
							
							<div class="add-cart">								
									<h4><a href="preview.html">Add to Cart</a></h4>
						</div>
					    </div>
					    
							 <div class="clear"></div>
					</div>					 
				</div>
				
			
				
			</div>
			<div class="content_bottom">
    		<div class="heading">
    		<h3>热门电影</h3>
    		</div>
    	  </div>
			<div class="section group">
				<div class="grid_1_of_5 ${pageContext.request.contextPath}/easyui/images_1_of_5">
					 <a href="preview.html"><img src="${pageContext.request.contextPath}/easyui/images/beauty_and_the_beast.jpg" alt="" /></a>
					 <h2><a href="preview.html">Beauty and the beast</a></h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees">$620.87</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><a href="preview.html">Add to Cart</a></h4>
							     </div>
							 <div class="clear"></div>
					</div>
					 
				</div>
				
			
				
				
			</div>
       </div>
  </div>
</div>
  <%@ include file="low.jsp" %>
</body>
</html>

