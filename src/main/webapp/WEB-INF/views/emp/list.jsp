<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">

    <title>员工列表</title>
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
    <li><a href="<%=basePath%>/user/welcome">Home</a> <span
            class="divider">/</span></li>
    <li class="active">员工列表</li>
</ul>
<div class="container-fluid">
    <div class="row-fluid">
        <form class="form-inline" method="post"
              action="<%=basePath%>emp/list">
            <input class="input-xlarge" placeholder="雇员姓名..." name="truename"
                   type="text" value="${param.truename}"> <input
                class="btn icon-search" type="submit" value="查询"/> <a
                class="btn btn-primary" href="<%=basePath%>emp/add"> <i
                class="icon-plus"></i> 添加雇员
        </a>
        </form>

        <div class="well">
            <table class="table">
                <thead>
                <tr>
                    <th>员工姓名</th>
                    <th>员工电话</th>
                    <th>员工性别</th>
                    <th>身份证号</th>
                    <th>职工性质</th>
                    <th>职工头像</th>
                    <th>职工年龄</th>
                    <th>住址</th>
                    <th>所属公司</th>


                    <th style="width: 90px;">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pager.list}" var="item">
                    <tr>
                        <td>${item.truename}</td>
                        <td>${item.phonenumber}</td>
                        <td><c:if test="${item.sex == '1'}">男</c:if> <c:if
                                test="${item.sex == '0'}">女</c:if></td>
                        <td>${item.idcart}</td>
                        <td>${item.property}</td>

                        <td><img alt="头像"
                                 src="<%=basePath%>/assets/upload/${item.photo}" width="40px"
                                 height="40px"></td>

                        <td>${item.age}</td>
                        <c:forEach items="${listarea}" var="area">

                            <c:if test="${area.id==item.aid }">
                                <td>${area.areaName}${area.level}</td>
                            </c:if>
                        </c:forEach>
                        <c:forEach items="${listcompany}" var="company">

                            <c:if test="${company.id==item.cid}">
                                <td>${company.companyName}</td>
                            </c:if>
                        </c:forEach>
                        <td><a href="<%=basePath%>emp/update?id=${item.id}">修改</a>
                            <a href="<%=basePath%>emp/delete?id=${item.id}">删除</a></td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="page-info">
                <span>当前第${pager.current }页/共${pager.count }条/${pager.total }页</span>

                <c:if test="${pager.current gt 1 }">
                    <a href="<%=basePath%>area/list?current=1">首页</a>
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
