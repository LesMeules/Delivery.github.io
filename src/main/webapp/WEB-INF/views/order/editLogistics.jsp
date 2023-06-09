<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <title>更新物流信息</title>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>assets/jslib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>assets/css/theme.css">
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>assets/jslib/bootstrap/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet"
          href="<%=basePath%>assets/jslib/font-awesome/css/font-awesome.css">
    <script src="<%=basePath%>assets/jslib/jquery-1.7.2.min.js"
            type="text/javascript"></script>
    <script src="<%=basePath%>assets/jslib/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>assets/jslib/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
    <script src="<%=basePath%>assets/jslib/bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script type="text/javascript">
        $(function () {

            var unit = $("#loadType label:first").text();
            $("#unit").text(unit);

            $("#sel").change(function (e) {
                var id = $("#sel option:selected").attr("id");

                unit = $("#loadType").find("#" + id).text();

                $("#unit").text(unit);

            });


        });

    </script>


</head>

<body class="content1">
<div class="header">
    <h1 class="page-title">
        更新物流信息
    </h1>
</div>

<ul class="breadcrumb">
    <li>
        <a href="<%=basePath%>/order/list">物流信息</a>
        <span class="divider">/</span>
    </li>
    <li class="active">
        更新物流
    </li>
</ul>

<div class="container-fluid">
    <div class="row-fluid">
        <form method="post" action="<%=basePath%>order/updateLogistics">
            <div class="btn-toolbar">
                <input type="submit" class="btn btn-primary" value="保存 ">
                <a href="<%=basePath%>order/list" class="btn">取消</a>
            </div>
            <div class="well">
                <div class="tab-pane active in">
                    <div class="box1">
                        <label>
                            已到达address
                        </label>
                        <span>
                            <input type="text" name="logisticsAddress" value="${car.logisticsAddress}" maxlength="100">
                        </span>
                    </div>
                    <div class="box1">
                        <label>
                            快递单号
                        </label>
                        <span>
                            <input type="text" name="lNumber" value="${car.lNumber}" maxlength="100" readonly>
                        </span>
                    </div>


                    <div class="box1">
                        <label>
                            收件人
                        </label>
                        <span>
                            <input type="text" name="toName" value="${car.toName}" maxlength="100">
                        </span>
                    </div>

                    <span id="unit"></span>
                    <div class="box1">
                        <label>
                            收件人电话
                        </label>
                        <span>
                            <input type="text" name="toPhone" value="${car.toPhone}" maxlength="100">
                        </span>
                    </div>
                    <div class="box1">
                        <label>
                            收件地址
                        </label>
                        <span>

                            <input type="text" name="toAddress" value="${car.toAddress}" maxlength="100">
                        </span>
                    </div>
                    <%--<div class="box1">
                        <label>
                            寄件方式
                        </label>
                        <span>

                            <input type="text" name="way" value="${car.way}" maxlength="100">
                        </span>
                    </div>--%>

                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
