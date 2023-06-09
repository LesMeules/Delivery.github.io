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

    <title>车型列表</title>
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
        车辆管理
    </h1>
</div>
<ul class="breadcrumb">
    <li>
        <a href="<%=basePath%>/user/welcome">Home</a>
        <span class="divider">/</span>
    </li>
    <li class="active">
        车辆列表
    </li>
</ul>
<div class="container-fluid">
    <div class="row-fluid">
        <form class="form-inline" method="post"
              action="<%=basePath%>car/list">
            <input class="input-xlarge" placeholder="车主姓名..." name="carOwner"
                   type="text" value="${param.carOwner}">
            <input class="btn icon-search" type="submit" value="查询"/>
            <a class="btn btn-primary" href="<%=basePath%>car/add">
                <i class="icon-plus"></i> 添加车辆
            </a>
        </form>

        <div class="well">
            <table class="table">
                <thead>
                <tr>
                    <th>
                        车牌号
                    </th>
                    <th>
                        生产时间
                    </th>
                    <th>
                        生产厂家
                    </th>
                    <th>
                        尺寸(长*宽*高)
                    </th>
                    <th>
                        车主姓名
                    </th>
                    <th>
                        当前状态
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
                                ${item.carId}
                        </td>
                        <td>
                                ${item.buytime}
                        </td>
                        <td>
                                ${item.manufacturer}
                        </td>
                        <td>
                                ${item.carType}
                        </td>
                        <td>
                                ${item.carOwner}
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${item.nowStatus==null}">
                                    <div style="color: #ff0019">null</div>
                                </c:when>
                                <c:when test="${item.nowStatus==0}">
                                    <div style="color: darkgrey">空闲</div>
                                </c:when>
                                <c:when test="${item.nowStatus==1}">
                                    <div style="color: #02e200">配送</div>
                                </c:when>
                            </c:choose>
                        </td>

                        <td>
                            <a href="<%=basePath%>car/update?id=${item.carId}">修改</a>
                            <c:if test="${item.nowStatus==0}">
<%--                                <input type="button" id="bt" value="删除"/>--%>
<%--                                <a href="" id="bt">删除</a>--%>
                                                                                            <a href="<%=basePath%>car/delete?id=${item.carId}" onclick="return confirm('您确定要删除车辆编号:${item.carId}?')">删除</a>
                            </c:if>

                        </td>


                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="page-info">
                <span>当前第${pager.current }页/共${pager.count }条/${pager.total }页</span>

                <c:if test="${pager.current gt 1 }">
                    <a href="<%=basePath%>car/list?current=1">首页</a>
                    <a href="<%=basePath%>car/list?current=${pager.current - 1 }">上一页</a>
                </c:if>

                <c:if test="${pager.current lt pager.total }">
                    <a href="<%=basePath%>car/list?current=${pager.current + 1 }">下一页</a>
                    <a href="<%=basePath%>car/list?current=${pager.total }">尾页</a>
                </c:if>
            </div>

        </div>
    </div>
</div>
<script>
    function foo() {
        if (this.confirm("确定删除吗？")){

        }else {
            return ;
        }
    }



</script>
</body>
</html>
