<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쪽지 보내기</title>
<style type="text/css">
@import url('../Css/save.css');

body {
	font-family: 맑은 고딕;
}

#box{
	width: 87%;
	height: 55px;
	margin-top:10px;
	border-radius: 0px;
	border: 2px solid darkgray;
	border-bottom: 1px;
	background-color: #FFD966;
	color: white;
}
</style>
</head>
<body>
	<%
		String userId = null;

		if (session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
		}

		if (userId == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요!')");
			script.println("history.back()");
			script.println("</script>");
		}
		//잘모르겟음
		
		String recvId = null;
		
		if (request.getParameter("recvId") != null) {
			recvId = request.getParameter("recvId");
		}
	%>
	<br>
	<center>
		<div id="box"><b style="font-size: 20px; margin-top: 3px">쪽지보내기</b>
		<br>상대방에게 쪽지를 보내보세요:)</div>
		<fieldset style="border: 2px solid darkgray; width: 62%; height: 40%;">
			
			<form name="sendLetter" method="POST" action="db_letter.jsp">
			<div style="text-align: left">
				<input type="hidden" name="senderId" value=<%=userId%>> 
				<p>받는사람
				<%if(recvId==null) {%>
				<input type="text" name="recvId" id="recvId" width="50px">
				<%} else {%>
				<input type="text" name="recvId" value=<%=recvId%>>
				<%} %>
				<br><br>
				<textarea id="t" cols="80" rows="15" name="content" style="text-align: left">
				</textarea></p></div>
				<input type="submit" name="save" id="save" value="전송">
				<input type="button" name="cancel" id="cancel" value="닫기"  onclick="self.close()" style="border: 1px solid darkgray"><br>
				<br>
			</form>
		</fieldset>
	</center>
</body>
</html>

