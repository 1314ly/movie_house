<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
						<a href="index.html"><img src="${pageContext.request.contextPath}/easyui/images/logo.png" alt="" /></a>
					</div>
						<div class="header_top_right">
						  <div class="cart">
						  	   <p><span>购物车</span><div id="dd" class="wrapper-dropdown-2"> (empty)
						  	   	<ul class="dropdown">
										<li>你的购物车里没有东西</li>
								</ul></div></p>
						  </div>
							  <div class="search_box">
					     		<form>
					     			<input type="text" value="Search" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Search';}"><input type="submit" value=""/>
					     		</form>
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