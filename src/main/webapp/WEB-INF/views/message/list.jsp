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
				

				<div class="well">
					<table class="table">
						<thead>
							<tr>
								<th>
									用户名
								</th>
								<th>
									邮箱
								</th>
								<th>
									电话
								</th>
								<th>
									创建时间
								</th>
								<th style="width: 90px;">
									操作
								</th>
								
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pager.list}" var="item">
								<tr>
									<td>
										${item.name}
									</td>
									<td>
										${item.email}
									</td>
									<td>
										${item.phone}
									</td>
									<td>
									<fmt:formatDate value="${item.createdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
										
									</td>
									<td>
									
										<a href="<%=basePath%>message/delete?id=${item.id}" onclick="return confirm('确认删除吗？')">删除</a>
										<a href="<%=basePath%>message/view?id=${item.id}" >查看</a>
									</td>
									
									
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="page-info">
						<span>当前第${pager.current }页/共${pager.count }条/${pager.total }页</span>
						
						<c:if test="${pager.current gt 1 }">
							<a href="<%=basePath%>message/list?current=1">首页</a>
							<a href="<%=basePath%>message/list?current=${pager.current - 1 }">上一页</a>
						</c:if>
						
						<c:if test="${pager.current lt pager.total }">
							<a href="<%=basePath%>message/list?current=${pager.current + 1 }">下一页</a>
							<a href="<%=basePath%>message/list?current=${pager.total }">尾页</a>
						</c:if>
					</div>
					
				</div>
			</div>
		</div>
	</body>
</html>
