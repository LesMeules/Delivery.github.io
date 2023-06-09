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

		<title>货物列表</title>
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
				货物管理
			</h1>
		</div>
		<ul class="breadcrumb">
			<li>
				<a href="<%=basePath%>/user/welcome">Home</a>
				<span class="divider">/</span>
			</li>
			<li class="active">
				货物列表
			</li>
		</ul>
		<div class="container-fluid">
			<div class="row-fluid">
				<form class="form-inline" method="post"
					action="<%=basePath%>goods/list">
					<input class="input-xlarge" placeholder="货物名称..." name="goodsname"
						type="text" value="${param.goodsname}">
					<input class="btn icon-search" type="submit" value="查询" />
					<a class="btn btn-primary" href="<%=basePath%>goods/add">
						<i class="icon-plus"></i> 添加货物
					</a>
				</form>

				<div class="well">
					<table class="table">
						<thead>
							<tr>
								<th>
									货物名称
								</th>
								<th>
									货物类型
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
										${item.goodsname}
									</td>
									<td>
										${item.goodsType}
									</td>
									<td>
										<a href="<%=basePath%>goods/update?id=${item.id}">修改</a>
										<a href="<%=basePath%>goods/delete?id=${item.id}">删除</a>
										
									</td>
									
									
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="page-info">
						<span>当前第${pager.current }页/共${pager.count }条/${pager.total }页</span>
						
						<c:if test="${pager.current gt 1 }">
							<a href="<%=basePath%>TCar/list?current=1"">首页</a>
							<a href="<%=basePath%>TCar/list?current=${pager.current - 1 }">上一页</a>
						</c:if>
						
						<c:if test="${pager.current lt pager.total }">
							<a href="<%=basePath%>TCar/list?current=${pager.current + 1 }">下一页</a>
							<a href="<%=basePath%>TCar/list?current=${pager.total }">尾页</a>
						</c:if>
					</div>
					
				</div>
			</div>
		</div>
	</body>
</html>
