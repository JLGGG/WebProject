<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="user.UserDAO" %>	
<%@ page import="java.io.PrintWriter" %>	
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="id"/>
<jsp:setProperty name="user" property="pw"/>		


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="utf-8">
<title>로그인페이지</title>
</head>

<body>
<%
	String userId=null;
	
	if(session.getAttribute("userId")!=null){
		userId= (String)session.getAttribute("userId");
	}
	
	if(userId!=null){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인 되어있습니다.')");
		script.println("location.href('../page/home.jsp')");
		script.println("</script>");
	}
	
	
	UserDAO userDAO= new UserDAO();
	int result=userDAO.login(user.getId(),user.getPw());
	
	if(result==1){			//로그인 성공
		session.setAttribute("userId",user.getId());
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('로그인성공')");
		script.println("location.href='../page/home.jsp'");
		script.println("</script>");
	}
	else if(result==0){				//비밀번호가 틀림
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else if(result==-1){				//아이디가 틀림
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else if(result==-2){				//데이터베이스오류
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
%>
</body>
</html>
