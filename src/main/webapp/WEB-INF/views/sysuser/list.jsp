<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>员工管理</title>
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
		<h1 class="page-title">员工管理</h1>
	</div>
	<ul class="breadcrumb">
		<li><a href="<%=basePath%>/user/welcome">Home</a> <span class="divider">/</span>
		</li>
		<li class="active">员工列表</li>
	</ul>
	<div class="container-fluid">
		<div class="row-fluid">
			<form class="form-inline" method="post"
				action="<%=basePath%>user/search">
				<input class="input-xlarge" placeholder="员工姓名..." name="username"
					type="text" value="${param.username}"> <input
					class="btn icon-search" type="submit" value="查询" /> <a
					class="btn btn-primary" href="<%=basePath%>user/add"> <i
					class="icon-plus"></i> 增加员工
				</a>
			</form>

			<div class="well">
				<table class="table">
					<thead>
						<tr>
							<th>员工ID</th>
							<th>职位</th>
							<th>用户名</th>
							<th>员工姓名</th>
							<th>性别</th>
							<th>电话</th>
							<th>员工状态</th>
							<th style="width: 90px; text-align: center">操作</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${listuser}" var="item">
							<tr>
								<td>${item.userid}</td>
								<td>${item.rolename}</td>
								<td>${item.username}</td>
								<td>${item.usertruename}</td>
								<td>
									<c:choose>
										<c:when test="${item.sex==1}">男</c:when>
										<c:otherwise>女</c:otherwise>
									</c:choose>
								</td>
								<td>${item.userphone}</td>
								<td><c:choose>
										<c:when test="${item.userstate==1}">在职</c:when>
										<c:otherwise>离职</c:otherwise>
									</c:choose></td>
								<td><a
									href="<%=basePath%>user/update?userid=${item.userid}">编辑</a>
									&ensp; <a href="<%=basePath%>user/delete?userid=${item.userid}" onclick="return confirm('确认移除${item.usertruename}吗')">删除</a>
									&ensp;</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>

			</div>
		</div>
	</div>
</body>
</html>
