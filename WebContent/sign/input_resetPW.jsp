<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 재설정</title>
<style type="text/css">
#resetPW {
	border: none;
	width: 150px;
	height: 30px;
	vertical-align: middle;
	align-self: center;
	background: url(../img/reset_password.png) round;
}

iframe {
	border: none;
}
</style>
</head>
<body>
	<div
		style="margin-left: 100px; margin-right: 100px; position: relative">
		<center>
			<div id="header">
				<iframe src="../page/header_noIcon.jsp" width="100%" scrolling="no"></iframe>
			</div>
			<br> <br>
			<div
				style="border: 1px solid #2F742A; width: 500px; height: auto; box-shadow: 0px 5px 5px grey">
				<!--ID 찾기-->
				<p>
					<b style="color: dimgrey; text-align: justify">PW 재설정</b>
				<hr
					style="border-bottom-color: darkgreen; width: 250px; vertical-align: top">
				<form action="output_resetPW.jsp" method="POST">
					<b>PW&nbsp;</b><input type="text" id="pw" name="pw"> <br><br>
					<input id="resetPW" type="submit" value=""><br>
				</form>
			</div>
			<br>
			<br>
		</center>
	</div>
</body>
</html>