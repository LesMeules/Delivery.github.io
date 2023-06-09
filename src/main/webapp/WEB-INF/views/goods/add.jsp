<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

		<title>添加货物信息</title>

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>assets/jslib/bootstrap/css/bootstrap.css">
		<link rel="stylesheet" type="text/css"
			href="<%=basePath%>assets/css/theme.css">
			<link rel="stylesheet" type="text/css" href="<%=basePath%>assets/jslib/bootstrap/css/bootstrap-datetimepicker.min.css">
		<link rel="stylesheet"
			href="<%=basePath%>assets/jslib/font-awesome/css/font-awesome.css">
		<script src="<%=basePath%>assets/jslib/jquery-1.7.2.min.js"
			type="text/javascript"></script>
		<script src="<%=basePath%>assets/jslib/bootstrap/js/bootstrap.min.js"></script>
		<script src="<%=basePath%>assets/jslib/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
			<script src="<%=basePath%>assets/jslib/bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
            <script type="text/javascript">
            	$(function(){
					
					var unit = $("#loadType label:first").text();
					$("#unit").text(unit);
					
					$("#sel").change(function(e) {
                        var id = $("#sel option:selected").attr("id");
						
						unit = $("#loadType").find("#"+id).text();
						
						$("#unit").text(unit);
						
                    });
					
					
				});
            
            </script>
            

	</head>

	<body class="content1">
		<div class="header">
			<h1 class="page-title">
				添加货物信息
			</h1>
		</div>

		<ul class="breadcrumb">
			<li>
				<a href="<%=basePath%>/goods/list">货物管理</a>
				<span class="divider">/</span>
			</li>
			<li class="active">
				添加货物
			</li>
		</ul>

		<div class="container-fluid">
				<div class="row-fluid">
				
				
    
				<form method="post" action="<%=basePath%>goods/add">
					<div class="btn-toolbar">
				
						<input type="submit" class="btn btn-primary" value="保存 ">
						<a href="<%=basePath%>goods/list" class="btn">取消</a>
						

					</div>

					<div class="well">
						<div class="tab-pane active in">
						
							<label>
								货物名称：
							</label>
							<input type="text" name="goodsName" maxlength="100"
								>
							<label>
								货物类型：
							</label>
							<input type="text" name="goodsType" maxlength="100"
								>(提示:烧焦类、石油、矿石、木材、钢铁、粮食、小百货)
							
							<label>
								货物类型：
							</label>
							<input type="text" name="goodsname" maxlength="5" style="width:35px;"
								>
							<span id="unit"></span>
							
							<label>
								车型：
							</label>
							<select name="cid" id="sel">
								<c:forEach items="${list}" var="item" varStatus="index">
									<option value="${item.id}" id="index${index.count}">${item.carType}</option>
								</c:forEach>
                            </select>
                            
                            <span id="loadType" style="display: none;">
	                            <c:forEach items="${list}" var="item" varStatus="index">
										<label id="index${index.count}">${item.loadType}</label>
								</c:forEach>
                            </span>
							

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
