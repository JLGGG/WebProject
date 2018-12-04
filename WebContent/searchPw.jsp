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
	String userPw=null;
	UserDB instance = new UserDB();
	String id = request.getParameter("userId");
	String address = request.getParameter("userAddress");
	String email = request.getParameter("userEmail");
	String mobile = request.getParameter("userMobile");
	
	userPw=instance.searchPw(id, address, email, mobile);
	
	if(userPw.equals("")){
		out.println("<script>alert('비밀번호가 존재하지 않습니다.');</script>");
		out.println("<script>location.href='./loginForm.html';</script>");
	}
	else{
		out.println("<script>alert('회원님의 비밀번호는 \""+userPw+"\" 입니다');</script>");
		out.println("<script>location.href='./loginForm.html';</script>");
	}
	
%>
</body>
</html>