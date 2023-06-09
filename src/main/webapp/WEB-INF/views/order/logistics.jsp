<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

    <title>物流信息</title>
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
        物流信息
    </h1>
</div>
<ul class="breadcrumb">
    <li>
        <a href="<%=basePath%>/user/welcome">Home</a>
        <span class="divider">/</span>
    </li>
    <li class="active">
        列表
    </li>
</ul>
<div class="container-fluid">
    <div class="row-fluid">
        <form class="form-inline" method="post"
              action="<%=basePath%>order/logistics">
            <input class="input-xlarge" placeholder="订单号..." name="number"
                   type="text" value="${param.lNumber}">
            <input class="btn icon-search" type="submit" value="查询"/>
        </form>
        <div class="well">
            <table class="table">
                <thead>
                <tr>
                    <th>
                        快递单号
                    </th>
                    <th>
                        快递信息
                    </th>
                    <th>
                        时间状态
                    </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list.list}" var="item">
                    <tr>
                        <td>
                            ${item.lNumber}
                        </td>
                        <td>
                                ${item.info}
                        </td>
                        <td>
                            <fmt:formatDate value="${item.time}" pattern="yyyy-MM-dd HH:mm:ss"/>

                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="page-info">
                <span>当前第${list.current }页/共${list.count }条/${list.total }页</span>

                <c:if test="${list.current gt 1 }">
                    <a href="<%=basePath%>order/logistics?current=1">首页</a>
                    <a href="<%=basePath%>order/logistics?current=${list.current - 1 }">上一页</a>
                </c:if>

                <c:if test="${list.current lt list.total }">
                    <a href="<%=basePath%>order/logistics?current=${list.current + 1 }">下一页</a>
                    <a href="<%=basePath%>order/logistics?current=${list.total }">尾页</a>
                </c:if>
            </div>

        </div>
    </div>
</div>
<script>

</script>
</body>
</html>
