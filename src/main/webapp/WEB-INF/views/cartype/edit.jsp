<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

		<title>编辑车型</title>

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
            
      

	</head>

	<body class="content1">
		<div class="header">
			<h1 class="page-title">
				添加车型
			</h1>
		</div>

		<ul class="breadcrumb">
			<li>
				<a href="<%=basePath%>/cartype/list">车型管理</a>
				<span class="divider">/</span>
			</li>
			<li class="active">
				添加车型
			</li>
		</ul>

		<div class="container-fluid">
				<div class="row-fluid">
				
				
    
				<form method="post" action="<%=basePath%>cartype/update" >
					<div class="btn-toolbar">
					<input type="hidden" name="cmd" value="add"/>
						<input type="submit" class="btn btn-primary" value="保存 ">
						<a href="<%=basePath%>cartype/list" class="btn">取消</a>
						<input type="hidden" name="artstate" value="0">

					</div>

					<div class="well">
						<div class="tab-pane active in">
							<input type="hidden" name="id" maxlength="100"
								value="${cartype.id}">
							<label>
								车型名称：
							</label>
							<input type="text" name="carType" maxlength="100"
								value="${cartype.carType}">
							<label>
								运载单位：
							</label>
							<select name="loadType">
								<option value="座" ${cartype.carType eq '座'?"selected='selected'":''}>座</option>
								<option value="吨" ${cartype.carType == '吨'?"selected='selected'":''}>吨</option>
								<option value="方" ${cartype.carType eq '方'?"selected='selected'":''}>方</option>
							</select>
							
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