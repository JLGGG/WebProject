<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="id" />
<jsp:setProperty name="user" property="pw" />
<jsp:setProperty name="user" property="name" />
<jsp:setProperty name="user" property="gender" />
<jsp:setProperty name="user" property="year" />
<jsp:setProperty name="user" property="month" />
<jsp:setProperty name="user" property="date" />
<jsp:setProperty name="user" property="joinPath" />
<jsp:setProperty name="user" property="recommend" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" ; charset="utf-8">
<title>회원가입페이지</title>
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

		//필수 입력 항목 확인 아이디, 비밀번호, 이름, 성별, 생년월일
		if (user.getId() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('아이디가 입력되지않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (user.getPw() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 입력되지않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else if (!user.getPw().equals(request.getParameter("pw_check"))) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 같지않습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (user.getName() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이름이 입력되지않았습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (user.getGender() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('성별이 입력되지않았습니다.')");
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
			int result = userDAO.join(user);

			if (result == -1) { //아이디 중복
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("location.href='input_signup.jsp'");
				script.println("</script>");
			} else { //회원가입 성공
				session.setAttribute("userId", user.getId());
			    
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입이 성공했습니다.')");
				script.println("location.href='../page/home.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>
