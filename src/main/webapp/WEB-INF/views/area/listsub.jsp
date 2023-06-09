<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

		<title>地域列表</title>
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>assets/jslib/bootstrap/css/bootstrap.css">
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>assets/css/theme.css">
		<link rel="stylesheet"
			href="<%=basePath%>assets/jslib/font-awesome/css/font-awesome.css">
		<script src="<%=basePath%>assets/jslib/jquery-1.7.2.min.js"
			type="text/javascript"></script>
	</head>

	<body class="content1">
		<div class="header">
			<h1 class="page-title">
				地域管理
			</h1>
		</div>
		<ul class="breadcrumb">
			<li>
				<a href="<%=basePath%>/user/welcome">Home</a>
				<span class="divider">/</span>
			</li>
			<li class="active">
				地域列表
			</li>
		</ul>
		<div class="container-fluid">
			<div class="row-fluid">
				
					
					<a class="btn btn-primary" href="<%=basePath%>area/addsub?aid=${param.aid}">
						<i class="icon-plus"></i> 添加市
					</a>
					<a href="<%=basePath%>area/list" class="btn">取消</a>
						

				<div class="well">
					<table class="table">
						<thead>
							<tr>
								<th>
									地域名
								</th>
								<th>
									地域级别
								</th>
								
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listsub}" var="item">
								<tr>
									<td>
										${item.areaName}
									</td>
									<td>
										${item.level}
									</td>
									
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					
				</div>
			</div>
		</div>
	</body>
</html>
