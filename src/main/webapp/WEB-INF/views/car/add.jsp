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

    <title>添加车辆信息</title>

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
        添加车辆信息
    </h1>
</div>

<ul class="breadcrumb">
    <li>
        <a href="<%=basePath%>/car/list">车辆管理</a>
        <span class="divider">/</span>
    </li>
    <li class="active">
        添加车辆
    </li>
</ul>

<div class="container-fluid">
    <div class="row-fluid">
        <form method="post" action="<%=basePath%>car/add">
            <div class="btn-toolbar">
                <input type="submit" class="btn btn-primary" value="保存 ">
                <a href="<%=basePath%>car/list" class="btn">取消</a>
            </div>
            <div class="well">
                <div class="tab-pane active in">

                    <div class="box1">
                        <label>
                            车牌号
                        </label>
                        <span>
                            <input type="text" value="${carIdTemp}" name="carId" maxlength="100">
                        </span>
                        <div style="color: red">
                            ${carMsg}
                        </div>


                    </div>

                    <div class="box1">
                        <label>
                            生产时间
                        </label>
                        <span>
                            <input type="text" name="buytime" maxlength="100">
                        </span>
                    </div>

                    <div class="box1">
                        <label>
                            生产厂家
                        </label>
                        <span>
                            <input type="text" name="manufacturer" maxlength="100">
                        </span>
                    </div>

                    <span id="unit"></span>
                    <div class="box1">
                        <label>
                            尺寸(长*宽*高)
                        </label>
                        <span>
                            <input type="text" name="carType" maxlength="100">
                        </span>
                    </div>
                    <div class="box1">
                        <label>
                            车主姓名
                        </label>
                        <span>

                            <input type="text" name="carOwner" maxlength="100">
                        </span>
                    </div>
                    <div class="box1">
                        <label>
                            当前状态
                        </label>
                        <span>
                            <input type="radio" name="nowStatus" value="0" checked="checked">
                            <span>空闲</span>
                            <input type="radio" name="nowStatus" value="1">
                            <span>配送</span>
                        </span>
                    </div>


                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
