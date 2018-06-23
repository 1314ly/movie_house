<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'movieManager.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<!-- 引入easyui -->
	<%@include file="top.jsp" %>
	
	<script type="text/javascript">
	    $(function(){
	       $("#tables").datagrid({
				url:"movie/getRequest1",
				columns:[[
				  {field:'movieid',checkbox:true,title:'电影编号',width:20},  
				  {field:'title',title:'电影名称',width:60},
				  {field:'rating',title:'电影评分',width:20},
				  {field:'genres',title:'电影标签',width:30},
				  {field:'runtime',title:'电影时长',width:20},
				  {field:'language',title:'语言',width:60},
				  {field:'poster',title:'电影图片',width:60},
				  {field:'runtime',title:'电影时长',width:100},
				]],
				idField:'eid',
				fitColumns:true,
				pagination:true, //显示分页工具栏
				pageList:[10,15,20],
				pageSize:10,
				striped:true,
				loadFilter:function(data){// 所有数据,源数据被修改
				    alert(date);
					var rows = data.rows;
					for(var i=0;i<rows.length;i++){
						
					}
					return data;
				}
			});
		});
    </script>
    
  </head>
  
  <body>
    <table id="tables" style="width:100%;height:100%"
           data-options="fitColumns:true,toolbar:'#tools',idField:'eid',
    	   pagination:true,rownumbers:true">
      <center>
	    <input class="easyui-textbox" data-options="label:'电影标题:'" style="width:30%"
						id="title" name="title" />
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" onclick="query()">查询</a>
	  </center>
    </table>
  </body>
</html>
