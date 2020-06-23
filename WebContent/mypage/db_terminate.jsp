<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>탈퇴하기</title>
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
			script.println("alert('로그인 한 후 이용해 주세요!')");
			script.println("location.href('input_login.html')");
			script.println("</script>");
		} else {
			
			
			UserDAO userDAO = new UserDAO();
			int result = userDAO.terminate(userId);

			if (result == -1) { //데이터베이스 오류
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원탈퇴에 실패하였습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else { //탈퇴 성공
				session.setAttribute("userId",null);
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('탈퇴하기가 성공적으로 완료되었습니다.')");
				//script.println("location.href='../page/president.jsp'");
				//script.println("<a href='../page/MainPage.jsp' onclick='location.href='this.href';' target='_top'></a>");		
				script.println("window.open('../page/home.jsp','_top');");
				script.println("</script>");
			}

		}
	%>
</body>
</html>