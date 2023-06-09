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
				公司管理
			</h1>
		</div>
		<ul class="breadcrumb">
			<li>
				<a href="<%=basePath%>/user/welcome">Home</a>
				<span class="divider">/</span>
			</li>
			<li class="active">
				公司列表
			</li>
		</ul>
		<div class="container-fluid">
			<div class="row-fluid">
				<form class="form-inline" method="post"
					action="<%=basePath%>company/list">
					<input class="input-xlarge" placeholder="公司名称..." name="companyName"
						type="text" value="${param.companyName}">
					<input class="btn icon-search" type="submit" value="查询" />
					<a class="btn btn-primary" href="<%=basePath%>company/add">
						<i class="icon-plus"></i> 添加公司
					</a>
				</form>

				<div class="well">
					<table class="table">
						<thead>
							<tr>
								<th>
									公司名称
								</th>
								
								<th>
									公司电话
								</th>
								<th>
									法人代表
								</th>
								<th>
									公司介绍
								</th>
								<th>
									公司属性
								</th>
								<td>
									公司地址
								</td>
								<th>
									创建时间
								</th>
								<th>
									资质等级
								</th>
								<th style="width: 90px;">
									操作
								</th>
								<th style="width: 90px;">
									公司相关信息
								</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pager.list}" var="item" varStatus="i">
								<tr>
									<td>
										${item.companyName}
									</td>
								
									<td>
										${item.phoneNumber}
									</td>
									<td>
										${item.corporation}
									</td>
									<td>
										${item.introduction}
									</td>
									<td>
										${item.property}
									</td>
									<c:forEach items="${listarea}" var="area">
									
										<c:if test="${area.id==item.aid }">
										<td>
											${area.areaName}${area.level}
										</td>
										</c:if>
									</c:forEach>
									<td>
										<fmt:formatDate value="${item.createdate}" pattern="yyyy-MM-dd"/>
										
									</td>
									<c:choose>
										<c:when test="${item.level==0}">
											<td>
												黑名单
											</td>
										</c:when>
										<c:when test="${item.level==1}">
											<td>
												等级一
											</td>
										</c:when>
										<c:when test="${item.level==2}">
											<td>
												等级二
											</td>
										</c:when>
										<c:when test="${item.level==3}">
											<td>
												等级三
											</td>
										</c:when>
										<c:when test="${item.level==4}">
											<td>
												等级四
											</td>
										</c:when>
									
									</c:choose>
									<td>
										<a href="<%=basePath%>company/update?id=${item.id}">修改</a>
										<a href="<%=basePath%>company/delete?id=${item.id}">删除</a>
										
									</td>
									<td>
										<a href='<%=basePath%>comdocument/listbycid?cid=${item.id}'>证书</a><br>
										<a href='<%=basePath%>business/listbycid?cid=${item.id}'>业务</a><br>
										<a href='<%=basePath%>bank/listbycid?cid=${item.id}'>开户银行</a>
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
					
				</div>
			</div>
		</div>
	</body>
</html>
