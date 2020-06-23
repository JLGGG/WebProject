<%@ page language="java" contentType="text/html; charset=EUC-KR"    pageEncoding="utf-8"%>
<%@ page import="board.DadBoardDAO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="board" class="board.Board" scope="page" />
<jsp:setProperty name="board" property="title" />
<jsp:setProperty name="board" property="content" />


<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="id" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아빠게시판 디비연동 페이지 </title>
</head>
<body>
<%
		//지금 이용중인 아이디 userId
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
		
		//로그인한 상태
		else{
					
			//필수 입력 항목 확인 글제목, 글내용
			if(board.getTitle()==null)
			{
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('제목을 입력해주세요')");
				script.println("history.back()");
				script.println("</script>");
			}
			else if(board.getContent()==null){
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('내용을 입력해주세요')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				DadBoardDAO boardDAO= new DadBoardDAO();
				UserDAO userDAO = new UserDAO();
				
				int result=boardDAO.write(board.getTitle(),board.getContent(),userId);				

				if(result==-1){			//데이터베이스 오류
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패하였습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else{
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기가 성공적으로 완료되었습니다.')");
					script.println("location.href='dad_list_recent.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>