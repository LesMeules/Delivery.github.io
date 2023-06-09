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

    <title>编辑员工功能</title>
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

                        $("<option></option>").val(item.roleid).html(item.rolename).attr("selected", "selected").appendTo(role);

                    });
                }
            });


            var usernameflag = false;
            var usertruenameflag = false;
            var userpwdflag = false;
            var userphoneflag = false;

            $("#username").blur(function (e) {
                if ($("#username").val() == null || $("#username").val() == "") {
                    $("#msg").text("员工名不能为空");
                    $("#msg").css("color", "red");
                    usernameflag = true;
                } else {
                    $.ajax({
                        url: "<%=basePath%>user/checkusername",
                        data: "username=" + $("#username").val(),
                        type: 'post',
                        success: function (msg) {
                            if (msg.code == 500) {

                                $("#msg").text(msg.msg);
                                $("#msg").css("color", "red");
                                usernameflag = false;
                            } else if (msg.code == 200) {

                                $("#msg").text(msg.msg);
                                $("#msg").css("color", "green");
                                usernameflag = true;
                            }
                        }
                    });
                }
            });
            $("#usertruename").blur(function (e) {
                if ($("#usertruename").val() == null || $("#usertruename").val() == "") {
                    $("#usertruenamemsg").text("员工姓名不能为空");
                    $("#usertruenamemsg").css("color", "red");
                    usertruenameflag = false;
                } else {
                    $("#usertruenamemsg").text("");
                    usertruenameflag = true;
                }
            });
            $("#userpwd").blur(function (e) {
                if ($("#userpwd").val() == null || $("#userpwd").val() == "") {
                    $("#userpwdmsg").text("密码不能为空");
                    $("#userpwdmsg").css("color", "red");
                    userpwdflag = false;
                } else {
                    $("#userpwdmsg").text("");
                    userpwdflag = true;
                }
            });
            $("#userphone").blur(function (e) {
                if ($("#userphone").val() == null || $("#userphone").val() == "") {
                    $("#userphonemsg").text("电话号码不能为空");
                    $("#userphonemsg").css("color", "red");
                    userphoneflag = false;
                } else {
                    $("#userphonemsg").text("");
                    userphoneflag = true;
                }
            });


            $("#button").click(function (e) {

                if (usernameflag && usertruenameflag && userpwdflag) {

                    $("form").submit();
                }

            });


        });
    </script>


</head>
<body class="content1">
<div class="header">
    <h1 class="page-title">
        个人设置
    </h1>
</div>

<div class="container-fluid">
    <div class="row-fluid">
        <form method="post" action="<%=basePath%>user/saveSetting">
            <div style="padding: 5px 5px 5px 5px">
                <span class="btn-toolbar">
                    <input type="submit" id="button" class="btn btn-primary" value="保存 ">
                </span>
                <span style="color: limegreen;padding-left: 5px">
                    ${settingMsg}
                </span>
            </div>
            <div class="well">
                <div class="tab-pane active in">
                    <input type="hidden" name="userid" value="${item.userid}"/>
                    <div class="box1">
                        <label>
                            用户名：
                        </label>
                        <input readonly type="text" name="username" value="${item.username}" id="username1"/>
                        <span id="msg"></span>
                    </div>
                    <div class="box1">
                        <label>
                            用户密码：
                        </label>
                        <input type="password" name="userpwd" value="${item.userpwd}" id="userpwd"/>
                        <span id="userpwdmsg"></span>
                    </div>
                    <div class="box1">
                        <label>
                            员工姓名：
                        </label>
                        <input type="text" id="usertruename" name="usertruename" value="${item.usertruename}"/>
                        <span id="usertruenamemsg"></span>
                    </div>
                    <div class="box1">
                        <label>
                            性别：
                        </label>
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
                        <label>
                            员工电话：
                        </label>
                        <input type="text" id="userphone" name="userphone" value="${item.userphone}"/>
                        <span id="userphonemsg"></span>
                    </div>
                    <%--<div class="box1">
                    <label>
                        员工状态：
                    </label>
                    <select name="userstate">
                        <option value="1" selected="selected">在职</option>
                        <option value="0">离职</option>
                    </select>
                    </div>--%>
                    <div class="box1">
                        <label>
                            职位：
                        </label>
                        ${item.rolename}
                    </div>

                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
