<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ page import="board.DadBoardDAO"%>
<%@ page import="board.Board"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아빠 게시판 디비연동 수정 페이지</title>
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
			
			int postId=0;
			if(request.getParameter("postId") != null){
				postId=Integer.parseInt(request.getParameter("postId"));
			}
			if(postId==0){
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 글입니다.')");
				script.println("location.href='dad_list_recent.jsp'");
				script.println("</script>");
			}
			
			//작성자와 사용자가 일치하지않는 경우
			Board board = new DadBoardDAO().getBoard(postId);
			
			if(!userId.equals(board.getUserId())){
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('권한이 없습니다.')");
				script.println("location.href='dad_list_recent.jsp'");
				script.println("</script>");
			}else{
				//필수 입력 항목 확인 글제목, 글내용
				if(request.getParameter("title")==null||request.getParameter("title").equals(""))
				{
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('제목을 입력해주세요')");
					script.println("history.back()");
					script.println("</script>");
				}
				else if(request.getParameter("content")==null||request.getParameter("content").equals("")){
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('내용을 입력해주세요')");
					script.println("history.back()");
					script.println("</script>");
				}
				else{
					DadBoardDAO boardDAO= new DadBoardDAO();
					int result=boardDAO.update(postId,request.getParameter("title"),request.getParameter("content"));				

					if(result==-1){			//데이터베이스 오류
						PrintWriter script=response.getWriter();
						script.println("<script>");
						script.println("alert('글 수정에 실패하였습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
					else{				//글쓰기 성공
					//	session.setAttribute("userId",user.getId());
						PrintWriter script=response.getWriter();
						script.println("<script>");
						script.println("alert('글수정이 성공적으로 완료되었습니다.')");
						script.println("location.href='dad_list_recent.jsp'");
						script.println("</script>");
					}
				}	
			}
		}
	%>
</body>
</html>