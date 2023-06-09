<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>编辑员工</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
<script
	src="<%=basePath%>assets/jslib/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script
	src="<%=basePath%>assets/jslib/bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>

<script type="text/javascript">
$(function(){
	$.ajax({
		type:"post",
		url:"<%=basePath%>emp/listarea",
		success:function(list){
			$.each(list,function(i,item){
				var addr=$("#addr");
				var aid=${emp.aid};
				if(aid==item.id){
					$("<option></option>").val(item.id).html(item.areaName+item.level).attr("selected","selected").appendTo(addr);
				} else {
					$("<option></option>").val(item.id).html(item.areaName+item.level).appendTo(addr);
				}
		    });
		}
	});

	$.ajax({
		type:"post", url:'<%=basePath%>emp/listjson',
		success : function(list) {
			$.each(list, function(i, item) {
				var addr = $("#addr1");
				var cid = $
				{
					emp.cid
				}
				;
				if (cid == item.id) {
					$("<option></option>").val(item.id).html(
							item.companyName).attr("selected", "selected")
							.appendTo(addr);
				} else {
					$("<option></option>").val(item.id).html(
							item.companyName).appendTo(addr);
				}
			});
		}
	});

});
</script>

</head>

<body class="content1">
	<div class="header">
		<h1 class="page-title">编辑员工</h1>
	</div>

	<ul class="breadcrumb">
		<li><a href="<%=basePath%>/emp/list">员工管理</a> <span class="divider">/</span>
		</li>
		<li class="active">编辑员工</li>
	</ul>

	<div class="container-fluid">
		<div class="row-fluid">
			<form method="post" action="<%=basePath%>emp/update"
				enctype="multipart/form-data">
				<div class="btn-toolbar">

					<input type="submit" class="btn btn-primary" value="保存 "> <a
						href="<%=basePath%>emp/list" class="btn">取消</a>

				</div>

				<div class="well">
					<div class="tab-pane active in">
						<input type="hidden" name="id" maxlength="100" value="${emp.id}">
						<label> 员工姓名： </label> <input type="text" name="truename"
							maxlength="100" value="${emp.truename}"> <label>
							员工电话： </label> <input type="text" name="phonenumber" maxlength="100"
							value="${emp.phonenumber}"> <label> 员工性别： <input
							type="radio" name="sex" value="1"
							${emp.sex eq '1'?'checked="checked"':''}>男&nbsp;&nbsp; <input
							type="radio" name="sex" value="0"
							${emp.sex eq '0'?'checked="checked"':''}>女
						</label> <label> 身份证号： </label> <input type="text" name="idcart"
							maxlength="100" value="${emp.idcart}"> <label>
							职工性质： </label> <input type="text" name="property" maxlength="100"
							value="${emp.property}"> <label class="mylabel">职工头像：</label>
						<span id="imgContent" class="mylabel"> <c:if
								test="${emp.photo!='' && emp.photo!=null}">
								<img style="width: 150px; height: 150px; margin-left: 10px;"
									src="<%=basePath%>assets/upload/${emp.photo}">
							</c:if>
						</span> <a class="btn" href="javascript:void(0)"
							onclick="$('#img').click()">选择图片</a>
						<div style="opacity: 0;">
							<input type="file" id="img" name="file" data-content="imgContent" />
						</div>
						<label> 职工年龄： </label> <input type="text" name="age"
							maxlength="100" value="${emp.age}"> <label> 住址： </label>
						<select name="aid" id="addr">
						</select> <label> 归属公司： </label> <select name="cid" id="addr1">
						</select>
						<script type="text/javascript">
							$('.form_date').datetimepicker({
								language : 'zh-CN',
								weekStart : 1,
								todayBtn : 1,
								autoclose : 1,
								todayHighlight : 1,
								startView : 2,
								minView : 2,
								forceParse : 0,

								format : "yyyy-mm-dd",
								autoclose : true,

								pickerPosition : "bottom-left"
							})
						</script>
						<script>
							window.onload = function() {
								//绑定图片事件
								$("#img")
										.change(
												function(e) {
													$(
															"#"
																	+ $(this)
																			.attr(
																					"data-content"))
															.html('');
													for (var i = 0; i < this.files.length; i++) {
														$(
																"#"
																		+ $(
																				this)
																				.attr(
																						"data-content"))
																.append(
																		'<img style="width:150px;height:150px;margin-left: 10px;" src="'
																				+ getObjectURL(this.files[i])
																				+ '">');
													}
												});
							}
							function getObjectURL(file) {
								var url = null;
								if (window.createObjectURL != undefined) { // basic
									url = window.createObjectURL(file);
								} else if (window.URL != undefined) { // mozilla(firefox)
									url = window.URL.createObjectURL(file);
								} else if (window.webkitURL != undefined) { // webkit or chrome
									url = window.webkitURL
											.createObjectURL(file);
								}
								return url;
							}
						</script>
						<div style="color: red">${msg}</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
