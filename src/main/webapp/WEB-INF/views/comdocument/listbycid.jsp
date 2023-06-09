<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

		<title>证书列表</title>
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
				证书管理
			</h1>
		</div>
		<ul class="breadcrumb">
			<li>
				<a href="<%=basePath%>/user/welcome">Home</a>
				<span class="divider">/</span>
			</li>
			<li class="active">
				证书列表
			</li>
		</ul>
		<div class="container-fluid">
			<div class="row-fluid">
				
					
					<a class="btn btn-primary" href="<%=basePath%>comdocument/add?cid=${param.cid}">
						<i class="icon-plus"></i> 添加证书
					</a>
					<a href="<%=basePath%>company/list" class="btn">取消</a>

				<div class="well">
					<table class="table">
						<thead>
							<tr>
								<th>
									证书号码
								</th>
								<th>
									证书名称
								</th>
								<th>
									操作
								</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="item" varStatus="i">
								<tr>
									
									<td>
										${item.number}
									</td>
										<td>
										${item.name}
									</td>
									
									<td>
										<a href="<%=basePath%>comdocument/update?id=${item.id}&cid=${param.cid}">修改</a>
										<a href="<%=basePath%>comdocument/delete?id=${item.id}&cid=${item.cid}">删除</a>
										
									</td>
									<td>
									
										<input type="hidden" name="bycid${i.count}" value="${item.cid}">
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
