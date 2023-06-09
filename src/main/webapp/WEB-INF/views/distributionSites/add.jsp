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

    <title>Title</title>

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


</head>

<body class="content1">
<div class="header">
    <h1 class="page-title">
        添加配送点信息
    </h1>
</div>

<ul class="breadcrumb">
    <li>
        <a href="<%=basePath%>/distributionSites/list">配送点管理</a>
        <span class="divider">/</span>
    </li>
    <li class="active">
        添加配送点
    </li>
</ul>

<div class="container-fluid">
    <div class="row-fluid">
        <form method="post" action="<%=basePath%>distributionSites/add">
            <div class="btn-toolbar">
                <input type="submit" class="btn btn-primary" value="保存 ">
                <a href="<%=basePath%>distributionSites/list" class="btn">取消</a>
            </div>
            <div class="well">
                <div class="tab-pane active in">

                    <div class="box1" >
                        <label>
                            配送点编号
                        </label>
                        <span>
                            <input type="text" name="distributionSiteId" maxlength="100">
                        </span>


                    </div>

                    <div class="box1">
                        <label>
                            配送点名称
                        </label>
                        <span>
                            <input type="text" name="distributionSiteName" maxlength="100">
                        </span>
                    </div>

                    <div class="box1">
                        <label>
                            配送点所在地址
                        </label>
                        <span>
                            <input type="text" name="distributionSiteAddress" maxlength="100">
                        </span>
                    </div>

                    <span id="unit"></span>
                    <div class="box1">
                        <label>
                            配送点规模
                        </label>
                        <span>
                            <input type="text" name="distributionSiteScale" maxlength="100">
                        </span>
                    </div>
                    <div class="box1">
                        <label>
                            备注信息
                        </label>
                        <span>

                            <input type="text" name="remark" maxlength="100">
                        </span>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
