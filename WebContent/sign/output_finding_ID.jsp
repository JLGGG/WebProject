<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="name" />
<jsp:setProperty name="user" property="year" />
<jsp:setProperty name="user" property="month" />
<jsp:setProperty name="user" property="date" />



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" ; charset="utf-8">
<title>아이디찾기</title>
</head>

<body>
	<%
		String userId = null;

		if (session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
		}

		if (userId != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 되어있습니다.')");
			script.println("location.href('../page/home.jsp')");
			script.println("</script>");
		}

		//필수 입력 항목 확인 이름, 생년월일
		if (user.getName() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이름이 입력되지않았습니디')");
			script.println("history.back()");
			script.println("</script>");
		} else if (user.getYear() == null || user.getMonth() == null || user.getDate() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('생년월일이 입력되지않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			UserDAO userDAO = new UserDAO();
			String result = userDAO.findID(user.getName(), user.getYear(),user.getMonth(), user.getDate());

			if (result.equals("")) { //아이디 중복
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('정확히 입력해주세요')");
				script.println("history.back()");
				script.println("</script>");
			} else { //아이디 찾기 성공
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('당신의 아이디는 "+result+" 입니다')");

				script.println("location.href='input_login.html'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>
