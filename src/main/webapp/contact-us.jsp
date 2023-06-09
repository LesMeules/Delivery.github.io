<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>徐工物流服务有限公司</title>
<link rel="icon" type="image/jpg" href="image/title-logo1.jpg"/>
<link href="style/css.css" rel="stylesheet" type="text/css" />
<script language="javascript">
	function check(form) {
		if (form.name.value == "") {
			alert("请输入您的姓名！");
			form.name.focus();
			return false;
		}
		if (form.content.value == "") {
			alert("请输入留言内容！");
			form.content.focus();
			return false;
		}

		return true;
	}
</script>
</head>
<body>
	<jsp:include flush="true" page="top.jsp"></jsp:include>
	<table width="920" border="0" align="center" cellpadding="0"
		cellspacing="0" bgcolor="#FFFFFF">
		<tr>
			<td height="3"></td>
		</tr>
	</table>
	<table width="920" border="0" align="center" cellpadding="0"
		cellspacing="0" bgcolor="#FFFFFF">
		<tr height="35">
			<td width="10">&nbsp;</td>
			<td width="900"><img src="image/icon_1.gif" width="10"
				height="9">&nbsp;&nbsp;<a href="">首页</a> &gt; <a href="contact-us.jsp">联系我们</a>
			</td>
			<td width="10">&nbsp;</td>
		</tr>
	</table>
	<table width="920" border="0" align="center" cellpadding="0"
		cellspacing="0" bgcolor="#FFFFFF">
		<tr>
			<td width="10">&nbsp;</td>
			<td align="center" valign="top">
				<table width="90%" border="0" cellspacing="0" cellpadding="0">
					<tr height="35">
						<td align="center" class="title1">联系我们</td>
					</tr>
				</table>


				<table width="90%" border="0" cellspacing="0" cellpadding="0">
					<tr height="20">
						<td></td>
					</tr>
				</table>
				<table width="90%" border="0" cellspacing="0" cellpadding="0"
					class="messageBorder">
					<tr>
						<td align="center" valign="top">
							<table width="98%" border="0" cellspacing="0" cellpadding="0">
								<tr height="25">
									<td width="15"><img src="image/icon_2.gif" width="11"
										height="11"></td>
									<td align="left" class="messageContent1">olina：</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td align="left" class="messageContent1">我想了解一下,你们公司的最新行业价格!</td>
								</tr>
								<tr height="20">
									<td></td>
									<td></td>
								</tr>
								<tr height="25">
									<td><img src="image/icon_3.gif" width="11" height="11"></td>
									<td align="left" class="messageContent2">管理员：</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td align="left" class="messageContent2"><P>您好!感谢您对本网站的关注,我们会尽快与您取得电话联系!</P></td>
								</tr>
								<tr height="20">
									<td></td>
									<td></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<table width="90%" border="0" cellpadding="0" cellspacing="0">
					<tr height="30">
						<td align="right"></td>
					</tr>
				</table>
				<table width="90%" border="0" cellpadding="0" cellspacing="0">
					<tr height="40">
						<td></td>
					</tr>
				</table>

			</td>
			<td width="10">&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td align="center" valign="top">
				<table width="97%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="1" background="images/line_point2.gif"></td>
					</tr>
					<tr>
						<td height="30" align="right"><a href="#"><img
								src="image/bt_up.gif" width="27" height="11" border="0"></a></td>
					</tr>
					<tr>
						<td align="right">&nbsp;</td>
					</tr>
				</table>
			</td>
			<td>&nbsp;</td>
		</tr>
	</table>

	<jsp:include flush="true" page="bottom.jsp"></jsp:include>
</body>
</html>
