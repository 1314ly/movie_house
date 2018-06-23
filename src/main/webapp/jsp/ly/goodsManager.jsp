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
			
			/* $("#goods_id").combobox({
				url:"goods/queryAll",
				valueField:'goods_id', //提交
				textField:'goods_name'
			}); */
			
			 $("#goods_status").combobox({
				url:"goods/queryAll",
				valueField:'goods_status', //提交
				textField:'goods_status' //显示文本
			}); 
			
			$("#tables").datagrid({
				url:"good/queryPage",
				columns:[[
				  {field:'goods_id',checkbox:true,title:'编号',width:40},  
				  {field:'goods_name',title:'商品名称',width:60},
				  {field:'goods_img',title:'图片',width:100},
				  {field:'goods_price',title:'价格',width:100},
				  {field:'goods_num',title:'数量',width:100},
				  {field:'goods_status',title:'状态',width:100},
				]],
				idField:'goods_id',
				fitColumns:true,
				pagination:true, //显示分页工具栏
				pageList:[10,15,20],
				pageSize:10,
				striped:true,
				loadFilter:function(data){// 所有数据,源数据被修改
					var rows = data.rows;
					for(var i=0;i<rows.length;i++){
						if(rows[i].goods_status==0){
							rows[i].goods_status ="已上架";
						}else if(rows[i].goods_status==1){
							rows[i].goods_status ="已下架";
						}
					}
					return data;
				}
			});
		});
		
		function query(){
			$("#tables").datagrid("load", {    
			    goods_name: $("#goods_name").val(),
			}); 
		};
		
		// 打开新增窗口
		function add(){
			$("#fm").form('reset');
			$("#datawindow").window("open").window('setTitle',"新增");
			url = "good/add";
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
				url = "good/edit";
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
			if($("#goods_id").textbox("getValue")=="自动生成"){
				$("#goods_id").textbox("setValue",-1);
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
           data-options="fitColumns:true,toolbar:'#tools',idField:'goods_id',
    	   pagination:true,rownumbers:true">
      <center>
	    <input class="easyui-textbox" data-options="label:'商品名称:'" style="width:30%"
						id="goods_name" name="goods_name" />
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
				<input class="easyui-textbox" style="width:100%" readonly="readonly"
					id="goods_id" name="goods_id" data-options="label:'商品编号:'" value="自动生成"/>
			</div>
			
			<div style="margin-bottom: 20px"> 
				<input class="easyui-textbox" data-options="label:'商品名称:'" style="width:100%"
					id="goods_name" name="goods_name" />
			</div>
			
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" data-options="label:'图片:'" style="width:100%"
					id="goods_img" name="goods_img"/>
			</div>
			
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" data-options="label:'价格:'" style="width:100%"
					id="goods_price" name="goods_price"/>
			</div>
			
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" data-options="label:'数量:'" style="width:100%"
					id="goods_num" name="goods_num"/>
			</div>
			
			<div style="margin-bottom: 20px">
				<input class="easyui-combobox" data-options="label:'状态:'" style="width:100%"
					id="goods_status" name="goods_status" value="0"/>
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
