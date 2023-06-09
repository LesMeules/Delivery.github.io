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
				<form class="form-inline" method="post"
					action="<%=basePath%>area/list">
					<input class="input-xlarge" placeholder="地域名称..." name="areaName"
						type="text" value="${param.areaName}">
					<input class="btn icon-search" type="submit" value="查询" />
					<a class="btn btn-primary" href="<%=basePath%>area/add">
						<i class="icon-plus"></i> 添加省
					</a>
				</form>

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
								<th>
									编辑
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
										${item.areaName}
									</td>
									<td>
										${item.level}
									</td>
									<td>
										<a href="<%=basePath%>area/updatepro?id=${item.id}">修改</a>
										<a href="<%=basePath%>area/deletepro?id=${item.id}">删除</a>
										
									</td>
									<td>
										<a href="<%=basePath%>area/listsub?aid=${item.id}">查看子地域</a>
										
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="page-info">
						<span>当前第${pager.current }页/共${pager.count }条/${pager.total }页</span>
						
						<c:if test="${pager.current gt 1 }">
							<a href="<%=basePath%>area/list?current=1"">首页</a>
							<a href="<%=basePath%>area/list?current=${pager.current - 1 }">上一页</a>
						</c:if>
						
						<c:if test="${pager.current lt pager.total }">
							<a href="<%=basePath%>area/list?current=${pager.current + 1 }">下一页</a>
							<a href="<%=basePath%>area/list?current=${pager.total }">尾页</a>
						</c:if>
					</div>
					<%-- <div class="pagination pagination-right">
						<ul>
							<li>
								<a>共计：${pager.pagectrl.pagecount}页/${pager.pagectrl.rscount}条记录</a>
							</li>
							
							<li>
								<c:if test="${pager.pagectrl.currentindex==1}" var="fp">
									<a style="disabled:true">上一页</a>
								</c:if>
								<c:if test="${!fp}">
									<a href="<%=basePath%>sys/fun?cmd=list&index=${pager.pagectrl.currentindex-1}">上一页</a>
								</c:if>
							</li>						
							
							<c:forEach begin="${pager.pagectrl.minpage}" step="1" end="${pager.pagectrl.maxpage}" var="index">
							<li>
								<c:if test="${pager.pagectrl.currentindex==index}" var="t">
									<a style="color:red;background-color:#bbb">${index}</a>
								</c:if>
								<c:if test="${!t}">
								<a href="<%=basePath%>sys/fun?cmd=list&index=${index}">${index}</a>
								</c:if>
							</li>
							</c:forEach>
							
							<li>
								<c:if test="${pager.pagectrl.currentindex==pager.pagectrl.pagecount}" var="fp">
									<a style="disabled:true">下一页</a>
								</c:if>
								<c:if test="${!fp}">
									<a href="<%=basePath%>sys/fun?cmd=list&index=${pager.pagectrl.currentindex+1}">下一页</a>
								</c:if>
							</li>
						</ul>
					</div> --%>
				</div>
			</div>
		</div>
	</body>
</html>
