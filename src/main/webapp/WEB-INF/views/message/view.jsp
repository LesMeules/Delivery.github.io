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

		<title>留言列表</title>
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
				留言管理
			</h1>
		</div>
		<ul class="breadcrumb">
			<li>
				<a href="<%=basePath%>/user/welcome">Home</a>
				<span class="divider">/</span>
			</li>
			<li class="active">
				留言列表
			</li>
		</ul>
		<div class="container-fluid">
			<div class="row-fluid">
			<a href="<%=basePath%>message/list" class="btn">返回</a>
				

				<div class="well">
					<table class="table">
						<thead>
							<tr>
								<th colspan="4">
									留言信息
								</th>
							</tr>
						</thead>
						<tbody>
								<tr>
									<td colspan="4">
										${message.mess}
									</td>
								</tr>
							
						</tbody>
					</table>
					
				</div>
			</div>
		</div>
	</body>
</html>
