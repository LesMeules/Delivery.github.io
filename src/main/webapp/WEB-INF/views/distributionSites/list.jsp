<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Title</title>
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
    <h1 class="=page-title">
        配送点信息
    </h1>
</div>
<ul class="breadcrumb">
    <li>
        <a href="<%=basePath%>/user/welcome">Home</a>
        <span class="divider">/</span>
    </li>
    <li class="active">
        配送点列表
    </li>
</ul>
<div class="container-fluid">
    <div class="row-fluid">
        <form class="form-inline" method="post"
              action="<%=basePath%>distributionSites/list">
            <input class="input-xlarge" placeholder="配送点名称..." name="distributionSiteName"
                   type="text" value="${param.distributionSiteName}">
            <input class="btn icon-search" type="submit" value="查询"/>
            <a class="btn btn-primary" href="<%=basePath%>distributionSites/add">
                <i class="icon-plus"></i> 添加配送点
            </a>
        </form>
        <div class="well">
            <table class="table">
                <thead>
                <tr>
                    <th>配送点编号</th>
                    <th>配送点名称</th>
                    <th>配送点所在地址</th>
                    <th>配送点规模</th>
                    <th>备注信息</th>
                    <th style="width:90px">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pager.list}" var="item">
                    <tr>
                        <td>${item.distributionSiteId}</td>
                        <td>${item.distributionSiteName}</td>
                        <td>${item.distributionSiteAddress}</td>
                        <td>${item.distributionSiteScale}</td>
                        <td>${item.remark}</td>
                        <td><a href="<%=basePath%>distributionSites/update?id=${item.distributionSiteId}">修改</a>
                            <a href="<%=basePath%>distributionSites/delete?id=${item.distributionSiteId}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="page-info">
                <span>当前第${pager.current }页/共${pager.count }条/${pager.total }页</span>

                <c:if test="${pager.current gt 1 }">
                    <a href="<%=basePath%>distributionSites/list?current=1">首页</a>
                    <a href="<%=basePath%>distributionSites/list?current=${pager.current - 1 }">上一页</a>
                </c:if>

                <c:if test="${pager.current lt pager.total }">
                    <a href="<%=basePath%>distributionSites/list?current=${pager.current + 1 }">下一页</a>
                    <a href="<%=basePath%>distributionSites/list?current=${pager.total }">尾页</a>
                </c:if>
            </div>
        </div>
    </div>
</div>

</body>
</html>
