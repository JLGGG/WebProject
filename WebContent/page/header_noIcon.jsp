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
   border: 2px solid #FFD966;
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
</style>
</head>
<body>
	<%
		String userId = null;

		if (session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
		}
	%>
	<div style="text-align: center; margin-top:3%">
		<a href="home.jsp" target="_top" ><img src="../img/hibebe.JPG"
					style="border: none; width: 350px; height: 100px"></a>
	</div>
</body>
</html>