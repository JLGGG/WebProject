<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDB" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id=request.getParameter("userId");
	String pw=request.getParameter("userPw");
	String address=request.getParameter("userAddress");
	String email=request.getParameter("userEmail");
	String mobile=request.getParameter("userMobile");
	
	UserDB db=new UserDB();
	
	if((db.write(id, pw, address, email, mobile))==-1){
		out.println("<script>alert('DB Error');</script>");
	}else{
		out.println("<script>alert('회원가입 완료');</script>");
		out.println("<script>location.href='./loginForm.html';</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>