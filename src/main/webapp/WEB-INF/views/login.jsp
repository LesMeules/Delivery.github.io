<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">
    <title>登录</title>
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>assets/jslib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>assets/css/theme.css">
    <link rel="stylesheet"
          href="<%=basePath%>assets/jslib/font-awesome/css/font-awesome.css">
    <script src="<%=basePath%>assets/jslib/jquery-1.7.2.min.js"
            type="text/javascript"></script>

    <script type="text/javascript">
        if (window != top) {
            top.location.href = location.href;
        }
    </script>

    <style>
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
<!--<![endif]-->
<div class="navbar">
    <div class="navbar-inner">
        <ul class="nav pull-right">
        </ul>
        <a class="brand" href="index.jsp"><span class="first">欢迎</span> <span
                class="second">登录</span> </a>
    </div>
</div>

<div class="row-fluid">
    <div class="dialog">
        <div class="block">
            <p class="block-heading">登录</p>
            <div class="block-body">
                <form method="post" action="<%=basePath%>user/login">
                    <label> 用户名： </label> <input type="text" name="username"
                                                 class="span12" maxlength="20"> <label> 密码： </label> <input
                        type="password" name="userpwd" class="span12" maxlength="20">
                    <input type="submit" class="btn btn-primary pull-right" value="登陆"/>
                    <div class="clearfix"></div>
                    <div style="color: red">${msg}</div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
