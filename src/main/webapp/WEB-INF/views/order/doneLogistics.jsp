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

    <title>已完成订单列表</title>
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
        已完成订单列表
    </h1>
</div>
<ul class="breadcrumb">
    <li>
        <a href="<%=basePath%>/user/welcome">Home</a>
        <span class="divider">/</span>
    </li>
    <li class="active">
        已完成订单列表
    </li>
</ul>
<div class="container-fluid">
    <div class="row-fluid">
        <form class="form-inline" method="post"
              action="<%=basePath%>order/doneLogistics">
            <input class="input-xlarge" placeholder="订单号..." name="lNumber"
                   type="text" value="">
            <input class="btn icon-search" type="submit" value="查询"/>
        </form>

        <div class="well">
            <table class="table">
                <thead>
                <tr>
                    <th>
                        收件人
                    </th>
                    <th>
                        收件人电话
                    </th>
                    <th>
                        收件地址
                    </th>
                    <th>
                        寄件人
                    </th>
                    <th>
                        寄件人电话
                    </th>
                    <%--<th>
                        寄件方式
                    </th>--%>
                    <th>
                        配送单号
                    </th>
                    <th>
                        到达地点
                    </th>
                    <th>
                        备注
                    </th>
                    <th>
                        配送员
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
                                ${item.toName}
                        </td>
                        <td>
                                ${item.toPhone}
                        </td>
                        <td>
                                ${item.toAddress}
                        </td>
                        <td>
                                ${item.name}
                        </td>
                        <td>
                                ${item.phone}
                        </td>
                        <%--<td>
                                ${item.way}
                        </td>--%>
                        <td>
                                ${item.lNumber}
                        </td>
                        <td>
                                ${item.logisticsAddress}
                        </td>

                        <td>
                                ${item.mark}
                        </td>
                        <td>
                            <c:if test="${item.kinds==1}">
                                <a href="<%=basePath%>order/update2?lNumber=${item.lNumber}">收件</a>
                            </c:if>
                            <c:if test="${item.kinds!=1}">
                                ${item.deliver}
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${usergetTrueName==item.deliver && item.kinds!=4}">
                                <a href="<%=basePath%>order/updateLogistics?lNumber=${item.lNumber}">更新物流</a>
                                <br/>
                            </c:if>
                            <c:if test="${usergetTrueName==item.deliver && item.kinds!=3 && item.kinds!=4 }">
                                <a href="<%=basePath%>order/arriveAddress?lNumber=${item.lNumber}">到达服务站</a>
                                <br/>
                            </c:if>
                            <c:if test="${usergetTrueName==item.deliver && item.kinds!=4}">
                                <a href="<%=basePath%>order/received?lNumber=${item.lNumber}">收件人已收货</a>
                                <br/>
                            </c:if>
                            <c:if test="${item.kinds==4}">
                                已完成
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="page-info">
                <span>当前第${pager.current}页/共${pager.count }条/${pager.total}页</span>

                <c:if test="${pager.current gt 1 }">
                    <a href="<%=basePath%>order/list?current=1">首页</a>
                    <a href="<%=basePath%>order/list?current=${pager.current - 1 }">上一页</a>
                </c:if>

                <c:if test="${pager.current lt pager.total }">
                    <a href="<%=basePath%>order/list?current=${pager.current + 1 }">下一页</a>
                    <a href="<%=basePath%>order/list?current=${pager.total }">尾页</a>
                </c:if>
            </div>

        </div>
    </div>
</div>
<script>

</script>
</body>
</html>
