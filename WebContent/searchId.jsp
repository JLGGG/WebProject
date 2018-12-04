<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "user.UserDB" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String userId=null;
	UserDB instance = new UserDB();
	String address = request.getParameter("userAddress");
	String email = request.getParameter("userEmail");
	String mobile = request.getParameter("userMobile");
	userId=instance.searchId(address, email, mobile);
	
	if(userId.equals("")){
		out.println("<script>alert('ID가 존재하지 않습니다.');</script>");
		out.println("<script>location.href='./loginForm.html';</script>");
	}
	else{
		out.println("<script>alert('회원님의 아이디는 \""+userId+"\" 입니다');</script>");
		out.println("<script>location.href='./loginForm.html';</script>");
	}
	
%>
</body>
</html>