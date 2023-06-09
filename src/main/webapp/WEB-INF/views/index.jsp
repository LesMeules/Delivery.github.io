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
<base target="main"/>
<title>物流后台</title>
<link rel="icon" type="image/jpg" href="image/title-logo.jpg">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/jslib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/css/theme.css">
<link rel="stylesheet"
	href="<%=basePath%>assets/jslib/font-awesome/css/font-awesome.css">
<script src="<%=basePath%>assets/jslib/jquery-1.7.2.min.js"
	type="text/javascript"></script>


<style type="text/css">
#line-chart {
	height: 300px;
	width: 800px;
	margin: 0px auto;
	margin-top: 1em;
}

.brand {
	font-family: georgia, serif;
}

.brand .first {
	color: #ccc;
	font-style: italic;
}

.brand .second {
	color: #fff;
	font-weight: bold;
}
</style>
</head>
<body class="">
	<div class="navbar">
		<div class="navbar-inner">
			<ul class="nav pull-right">
				<li style="padding-right: 25px" id="fat-menu" class="dropdown"><a href="#" role="button"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="icon-user"></i>
						${user.usertruename}(${user.sysrole.rolename}) <i
						class="icon-caret-down"></i>
				</a>
					<ul class="dropdown-menu">


						<li><a tabindex="-1" class="visible-phone" href="#">Settings</a>
						</li>
						<li class="divider visible-phone"></li>
						<li><a tabindex="-1" href="<%=basePath%>user/logout"
							target="_top">Logout</a></li>
					</ul></li>

			</ul>
			<a class="brand" href="user/welcome"><span class="first">欢迎使用</span>
				<span class="second">物流配送管理平台</span> </a>
		</div>
	</div>
	<div class="sidebar-nav">
		<c:forEach items="${initfun}" var="top">
			<c:if test="${top.funpid==-1}">
				<a href="#error-menu${top.funid}" class="nav-header collapsed"
					data-toggle="collapse"><i class="icon-briefcase"></i>${top.funname}<i
					class="icon-chevron-up"></i> </a>
				<ul id="error-menu${top.funid}" class="nav nav-list collapse">
					<c:forEach items="${initfun}" var="child">
						<c:if test="${child.funpid==top.funid}">
							<li><a href="<%=basePath%>${child.funurl}">${child.funname}</a>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</c:if>
		</c:forEach>
	</div>
	<div class="content">
		<iframe name="main" height="700px" width="100%" scrolling="auto"
			frameborder="0" src="<%=basePath%>user/welcome"> </iframe>
	</div>
	<script src="<%=basePath%>assets/jslib/bootstrap/js/bootstrap.js"></script>
</body>
</html>