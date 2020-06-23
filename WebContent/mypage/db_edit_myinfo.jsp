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
<title>내정보수정 디비연동 페이지 </title>
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
			//작성자와 사용자가 일치하지않는 경우
			User user=new UserDAO().getUser(userId);

				//필수 입력 항목 확인 글제목, 글내용
				if(request.getParameter("pw")==null||request.getParameter("pw").equals(""))
				{
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('수정할 비밀번호를 입력해주세요')");
					script.println("history.back()");
					script.println("</script>");
				}
				else if(request.getParameter("name")==null||request.getParameter("name").equals("")){
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('수정할 이름을 입력해주세요')");
					script.println("history.back()");
					script.println("</script>");
				}
				else{
					UserDAO userDAO = new UserDAO();
					
					int result=userDAO.update(request.getParameter("pw"),request.getParameter("name"), userId);				

					if(result==-1){			//데이터베이스 오류
						PrintWriter script=response.getWriter();
						script.println("<script>");
						script.println("alert('글 수정에 실패하였습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
					else{				//정보수정 성공
						session.setAttribute("userId",user.getId());
						PrintWriter script=response.getWriter();
						script.println("<script>");
						script.println("alert('글수정이 성공적으로 완료되었습니다.')");
						script.println("location.href='input_myinfo_edit.jsp'");
						script.println("</script>");
					}
				}
				
				
			}
	%>
</body>
</html>