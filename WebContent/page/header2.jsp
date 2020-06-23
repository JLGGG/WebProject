<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 후 헤더 2</title>
<style>
.temp{
	padding-bottom:0px;
}
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
		User user = null;
		if (session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
			UserDAO ud = new UserDAO();
			
			user = ud.getUser(userId);
		}
	%>
	<div style="text-align: center">
		<table class="topButton">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="2"
					style="margin-right: 0px; padding-right: 0px; align: right">
					<b><font size="3" color="#2F9D27">
					<% 
					try{
					if(user.getManager()==1) {%> 관리자 
					<%} 
					}catch(Exception e){
						e.printStackTrace();
					}
					%></font>
					<%=userId%>님 반갑습니다!</b></td>
				<td style="text-align: right"><a id="Icon"
					href="../sign/logout.jsp" target="_top">&nbsp;&nbsp;&nbsp;&nbsp;LOGOUT&nbsp;&nbsp;&nbsp;&nbsp;</a>
				</td>
				<td style="text-align: left">
					<%
					try{
				if (user.getManager()==1) {
					%> <a id="Icon" href="MainPage.jsp?url=managerpage/managerpage.jsp"
					target="_top">&nbsp;&nbsp;&nbsp;MYPAGE &nbsp;&nbsp;&nbsp;</a> <% 
				}else{
					%> <a id="Icon" href="MainPage.jsp?url=mypage/mypage.jsp"
					target="_top">&nbsp;&nbsp;&nbsp;MYPAGE &nbsp;&nbsp;&nbsp;</a> <% 
				}
				}catch(Exception e){
					e.printStackTrace();
				}
				%>
				</td>
			</tr>
			<tr>
				<td style="text-align: right"><a
					href="MainPage.jsp?url=/Board/fleemarket/cart.jsp" target="_top"><img
						src="../img/cart.png" style="border: none; width: 40px"></a></td>
				<td style="text-align: left; padding: 10px"><a
					href="MainPage.jsp?url=/Letter/letter_recieve_list.jsp" target="_top"><img
						src="../img/message.png" style="border: none; width: 40px"></a></td>
				<td colspan="4" align="center"><a href="home.jsp" target="_top"><img
						src="../img/hibebe.JPG"
						style="border: none; width: 350px; height: 100px"></a></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
</body>
</html>