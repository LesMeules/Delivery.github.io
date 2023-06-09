<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=basePath%>">

		<title>添加员工</title>

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>assets/jslib/bootstrap/css/bootstrap.css">
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>assets/css/theme.css">
			<link rel="stylesheet" type="text/css" href="<%=basePath%>assets/jslib/bootstrap/css/bootstrap-datetimepicker.min.css">
		<link rel="stylesheet"
			href="<%=basePath%>assets/jslib/font-awesome/css/font-awesome.css">
		<script src="<%=basePath%>assets/jslib/jquery-1.7.2.min.js"
			type="text/javascript"></script>
		<script src="<%=basePath%>assets/jslib/bootstrap/js/bootstrap.min.js"></script>
		<script src="<%=basePath%>assets/jslib/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
			<script src="<%=basePath%>assets/jslib/bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
            
        <script type="text/javascript">
        
        	$(function(){
				
				$.ajax({
					type:"post",
					url:"<%=basePath%>emp/listarea",
					success:function(list){
						$.each(list,function(i,item){
							var addr=$("#addr");
							$("<option></option>").val(item.id).html(item.areaName+item.level).appendTo(addr);
					    });
					}
			    });
				
				$.ajax({
					type:"post",
					url:"<%=basePath%>emp/listjson",
					success:function(list){
						$.each(list,function(i,item){
							var addr=$("#addr1");
							$("<option></option>").val(item.id).html(item.companyName).appendTo(addr);
					    });
					}
			    });
				
				
				
				
			});
        
        
        
        
        </script>

	</head>

	<body class="content1">
		<div class="header">
			<h1 class="page-title">
				添加员工
			</h1>
		</div>

		<ul class="breadcrumb">
			<li>
				<a href="<%=basePath%>/emp/list">员工管理</a>
				<span class="divider">/</span>
			</li>
			<li class="active">
				添加员工
			</li>
		</ul>

		<div class="container-fluid">
				<div class="row-fluid">
				
				
    
				<form method="post" action="<%=basePath%>emp/add" enctype="multipart/form-data">
					<div class="btn-toolbar">
					
						<input type="submit" class="btn btn-primary" value="保存 ">
						<a href="<%=basePath%>emp/list" class="btn">取消</a>
						
					</div>

					<div class="well">
						<div class="tab-pane active in">

							<label>
								员工姓名：
							</label>
							<input type="text" name="truename" maxlength="100"
								>
							<label>
								员工电话：
							</label>
							<input type="text" name="phonenumber" maxlength="100"
								>
								
							<label>
								员工性别：
							
								<input type="radio" name="sex" value="男" checked="checked">男&nbsp;&nbsp;
								<input type="radio" name="sex" value="女">女
							</label>
							<label>
								身份证号：
							</label>
							<input type="text" name="idcart" maxlength="100"
								>
							<label>
								职工性质：
							</label>
							<input type="text" name="property" maxlength="100"
								>
								
							<label>
								职工头像：
							</label>
							<input type="file" name="file" maxlength="100">
								
							<label>
								职工年龄：
							</label>
							<input type="text" name="age" maxlength="100">
							
			               
							<label>
								住址：
							</label>
							<select name="aid" id="addr">
                            	
                            
                            </select>
                            <label>
								归属公司：
							</label>
							<select name="cid" id="addr1">
                            	
                            
                            </select>
							
						
							


<script type="text/javascript">
   
	$('.form_date').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0,

		 format: "yyyy-mm-dd",
        autoclose: true,
      
        pickerPosition: "bottom-left"
    })
   </script>



							<div style="color: red">
								${msg}
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>
