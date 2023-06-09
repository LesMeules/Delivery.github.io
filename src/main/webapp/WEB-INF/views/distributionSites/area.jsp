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
        查看配送配送范围
    </li>
</ul>
<div class="container-fluid">
    <div class="row-fluid">
        <form class="form-inline" method="post"
              action="<%=basePath%>distributionSites/area">
            <input class="input-xlarge" placeholder="请输入配送点..." name="distributionSiteName"
                   type="text" value="">
            <input class="btn icon-search" type="submit" value="查询"/>
        </form>
        <div class="well">
            <table class="table">
                <thead>
                <tr>
                    <th>本地配送点</th>
                    <th>-------></th>
                    <th>可配送的范围</th>
                    <th>首公斤价格(元)</th>
                    <th>次公斤价格(元)</th>
                    <th style="width:90px">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${area.list}" var="item">
                    <tr>
                        <td>${item.distributionSiteName}</td>
                        <td></td>
                        <td>${item.distributionScopeName}</td>
                        <td>${item.firstWeight}</td>
                        <td>${item.secondWeight}</td>
                        <td><a href="<%=basePath%>#/update?id=${item.distributionScopeId}">修改</a>
                            <a href="<%=basePath%>#/delete?id=${item.distributionScopeId}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="page-info">
                <span>当前第${area.current }页/共${area.count }条/${area.total }页</span>

                <c:if test="${area.current gt 1 }">
                    <a href="<%=basePath%>distributionSites/list?current=1">首页</a>
                    <a href="<%=basePath%>distributionSites/list?current=${area.current - 1 }">上一页</a>
                </c:if>

                <c:if test="${area.current lt area.total }">
                    <a href="<%=basePath%>distributionSites/list?current=${area.current + 1 }">下一页</a>
                    <a href="<%=basePath%>distributionSites/list?current=${area.total }">尾页</a>
                </c:if>
            </div>
        </div>
    </div>
</div>

</body>
</html>
