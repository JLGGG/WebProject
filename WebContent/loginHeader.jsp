<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 후 헤더 2</title>
<style>
.topButton {
	position: fixed;
	padding: 10px;
	width: 100%;
	text-align: center;
	margin: 0px;
}

.topButton td {
	width: 12.5%;
}

#Icon {
   border-radius: 10px;
   border: 2px solid #bc8f8f;
   background-color: #FFFFFF;
   color: dimgray;
}

a {
	color: gray;
	text-decoration: none;
	font-size: 12px;
	padding: 2px;
	width: 80px;
}
#siteName{
	font-size: 45px;
	font-weight: bold;
	padding: 0px;
	position: relative;
	top:30px;
}
</style>
</head>
<body>
	<%
		String userId = null;

		if (session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
		}
	%>
	<div style="text-align: center">
		<table class="topButton">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="2" style="margin-right:0px; padding-right:0px;align:right"><font size="3"><b><%=userId%></b></font>님 환영합니다!</td>
				<td style="text-align: right"><a id="Icon"
					href="./logoutProcess.jsp" target="_top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LOGOUT&nbsp;&nbsp;&nbsp;&nbsp;</a>
				</td>
				<td style="text-align: left"><a id="Icon"
					href="#" target="_top">&nbsp;&nbsp;&nbsp;&nbsp;MYPAGE
					&nbsp;&nbsp;&nbsp;</a></td>
			</tr>
			<tr>
			<td style="text-align: right"><a href="#" target="_top"><img src="./Image/cart.png"
					style="border: none; width: 40px"></a></td>
				<td></td>
				<td></td>
				<td colspan="3" align="center"><a href="main.jsp" target="_top" id="siteName">취업 정보 마당</a></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
</body>
</html>