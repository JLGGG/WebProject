<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 바꾸기 페이지</title>
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
		}
		else{
			
				//필수 입력 항목 확인
				if(request.getParameter("pw")==null)
				{
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('변경할 비밀번호를 입력해주세요')");
					script.println("history.back()");
					script.println("</script>");
				}
				else{
					UserDAO userDAO= new UserDAO();
					int result=userDAO.resetPW(request.getParameter("pw"),userId);				

					if(result==-1){			//데이터베이스 오류
						PrintWriter script=response.getWriter();
						script.println("<script>");
						script.println("alert('비밀번호 수정에 실패하였습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
					else{				//비밀번호 변경 성공
						PrintWriter script=response.getWriter();
						script.println("<script>");
						script.println("alert('비밀번호 수정이 성공적으로 완료되었습니다.')");
						script.println("location.href='../page/home.jsp'");
						script.println("</script>");
					}
				}
			}
	%>
</body>
</html>