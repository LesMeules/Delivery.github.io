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

		<title>添加公司</title>

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
					url:"<%=basePath%>company/listarea",
					success:function(list){
						$.each(list,function(i,item){
							var addr=$("#addr");
							
							$("<option></option>").val(item.id).html(item.areaName+item.level).appendTo(addr);
							
							
							
							
					    });
						
					}
					
					
					
			    });
				
				
				
				
			});
        
        
        
        
        </script>

	</head>

	<body class="content1">
		<div class="header">
			<h1 class="page-title">
				添加公司
			</h1>
		</div>

		<ul class="breadcrumb">
			<li>
				<a href="<%=basePath%>/company/list">公司管理</a>
				<span class="divider">/</span>
			</li>
			<li class="active">
				添加公司
			</li>
		</ul>

		<div class="container-fluid">
				<div class="row-fluid">
				
				
    
				<form method="post" action="<%=basePath%>company/add" enctype="multipart/form-data">
					<div class="btn-toolbar">
					<input type="hidden" name="cmd" value="add"/>
						<input type="submit" class="btn btn-primary" value="保存 ">
						<a href="<%=basePath%>company/list" class="btn">取消</a>
						<input type="hidden" name="artstate" value="0">

					</div>

					<div class="well">
						<div class="tab-pane active in">

							<label>
								公司名称：
							</label>
							<input type="text" name="companyName" maxlength="100"
								>
							<label>
								电话号码：
							</label>
							<input type="text" name="phoneNumber" maxlength="100"
								>
							<label>
								法人代表：
							</label>
							<input type="text" name="corporation" maxlength="100"
								>
							<label>
								公司属性：
							</label>
							<input type="text" name="property" maxlength="100"
								>
							<label>
								公司简介：
							</label>
							<textarea rows="10" cols="30" name="introduction"></textarea><br/>
							<label>
								成立时间：
							</label>	
								
								<div class="controls input-append date form_date"   data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
			                    <input size="16" type="text" value="" readonly name="createdate">
			                    <span class="add-on"><i class="icon-remove"></i></span>
								<span class="add-on"><i class="icon-th"></i></span>
			               		 </div>
			               	<label>
								资质等级：
							</label>
							<select name="level">
								<option value="0">黑名单</option>
								<option value="1">等级一</option>
								<option value="2">等级二</option>
								<option value="3">等级三</option>
								<option value="4">等级四</option>
							</select>
							<label>
								公司所在地址：
							</label>
							<select name="aid" id="addr">
                            	
                            
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
