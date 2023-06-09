<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">

    <title>编辑员工</title>
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>assets/jslib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css"
          href="<%=basePath%>assets/css/theme.css">
    <link rel="stylesheet"
          href="<%=basePath%>assets/jslib/font-awesome/css/font-awesome.css">
    <script src="<%=basePath%>assets/jslib/jquery-1.7.2.min.js"
            type="text/javascript"></script>
    <script type="text/javascript">

        $(function () {
            $.ajax({
                type: "post",
                url: "<%=basePath%>user/listrolejson",
                success: function (list) {
                    $.each(list, function (i, item) {
                        var role = $("#role");
                        var roleid =${item.roleid};
                        if (roleid == item.roleid) {
                            $("<option></option>").val(item.roleid).html(item.rolename).attr("selected", "selected").appendTo(role);
                        } else {
                            $("<option></option>").val(item.roleid).html(item.rolename).appendTo(role);
                        }
                    });
                }
            });


        });
    </script>


</head>
<body class="content1">
<div class="header">
    <h1 class="page-title">
        编辑员工功能
    </h1>
</div>

<ul class="breadcrumb">
    <li>
        <a href="<%=basePath%>/user/listuser">员工管理</a>
        <span class="divider">/</span>
    </li>
    <li class="active">
        编辑员工
    </li>
</ul>

<div class="container-fluid">
    <div class="row-fluid">
        <form method="post" action="<%=basePath%>user/update">
            <div class="btn-toolbar">
                <input type="submit" class="btn btn-primary" value="保存 ">
                <a href="<%=basePath%>user/listuser" class="btn">取消</a>

            </div>

            <div class="well">
                <div class="tab-pane active in">
                    <input type="hidden" name="userid" value="${item.userid}"/>
                    <div class="box1">
                    <label>职位：</label>
                    <select name="roleid" id="role"></select>
                    </div>
                    <div class="box1">
                    <label>用户名：</label>
                    <input type="text" name="username" value="${item.username}" readonly/>
                    </div>
                    <div class="box1">
                    <label>员工姓名：</label>
                    <input type="text" name="usertruename" value="${item.usertruename}"/>
                    </div>
                    <div class="box1">
                    <label>性别：</label>
                    <select name="sex">
                        <c:choose>
                            <c:when test="${item.sex==1}">
                                <option value="1" selected="selected">男</option>
                                <option value="0">女</option>
                            </c:when>
                            <c:otherwise>
                                <option value="1">男</option>
                                <option value="0" selected="selected">女</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                    </div>
                    <div class="box1">
                    <label>电话：</label>
                    <input type="text" name="userphone" value="${item.userphone}"/>
                    </div>
                    <div class="box1">
                    <label>员工状态：</label>

                    <select name="userstate">
                        <c:choose>
                            <c:when test="${item.userstate==1}">
                                <option value="1" selected="selected">在职</option>
                                <option value="0">离职</option>
                            </c:when>
                            <c:otherwise>
                                <option value="1">在职</option>
                                <option value="0" selected="selected">离职</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                    </div>
                    <div style="color: red">
                        ${msg}
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
