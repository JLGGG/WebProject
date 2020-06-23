<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>page</title>
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<script>
	$(document).ready(function() {
		$("#menu_bar").load("menu_bar.html?ver2.01");
	});	
</script>
<style type="text/css">
#header {
	margin-top: 0px;
	margin-bottom: 20px;
	height: auto;
}

#menu {
	width: 100%;
	position: absolute;
	z-index: 5;
}

#main {
	padding-left: 13%;
	width: 75%;
	margin-bottom: 20px;
}

.container {
	margin-top: 50px;
	overflow: hidden;
	height: auto;
	position:center;
}

iframe {
	border:0px;
	align:middle;
}

#l1{
	padding-top: 5%;
}

</style>
</head>
<body style="overflow-x: hidden; scrolling: no">

	<%
		String userId = null;

		if (session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
		}
		
		
	%>

	<div style="position: center">
		<center>
			<div id="header">
				<%
					if (userId == null) {			//로그인이 안되어있을때, 
				%>
				<iframe src="header.html" width="100%" height="auto" scrolling="no"
					style="z-index: 20"></iframe>
				<%
					} else {						//로그인이 되어있을때,
						%>
				<iframe src="header2.jsp" width="100%" height="auto" scrolling="no"
					style="z-index: 20"></iframe>
				<%
					}
				%>
			</div>
			<div id="menu_bar"></div>
		</center>
		<div class="container">
			<!-- main -->
			<div id="main" style="position: center">
				<%
					request.setCharacterEncoding("UTF-8");
					String url = request.getParameter("url");
				%>
				<%
					if (url == null) {
						//url = "Board/Intro/president.jsp?ver=1.01";
						url = "page/slideshow.jsp";
					}
				%>
				<script>
					//불러오는 html / jsp 마다 크기가 다르기 때문에 맞춰서 나오게 됨 
					function setIFrameHeight(obj) {
						if (obj.contentDocument) {
							obj.height = obj.contentDocument.body.offsetHeight + 40;
						} else {
							obj.height = obj.contentWindow.document.body.scrollHeight;
						}
					}
				</script>
				<iframe name="load" id="i1" src="../<%=url%>?wmode=transparent" width="100%"
					height="100%" scrolling="no" onLoad="setIFrameHeight(this)" style="z-index:0; align: middle"></iframe>
			</div>
		</div>
	</div>
</body>
</html>