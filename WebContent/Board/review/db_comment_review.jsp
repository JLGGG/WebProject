<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="comment.CommentReviewDAO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="comment" class="comment.Comment" scope="page" />
<jsp:setProperty name="comment" property="content" />

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="id" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시물 댓글 디비연동</title>
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
			if(comment.getContent()==null)
			{
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('내용을 입력해주세요')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				CommentReviewDAO commentDAO = new CommentReviewDAO();
				UserDAO userDAO = new UserDAO();
				String comment_board_str = request.getParameter("comment_board");
				int comment_board = Integer.parseInt(comment_board_str);
				int result=commentDAO.add_comment(comment_board, userId, comment.getContent());//글번호,작성자,내용				

				if(result==-1){			//데이터베이스 오류
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('댓글작성에 실패하였습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else{
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('댓글작성이 성공적으로 완료되었습니다.')");
					script.println("location.href='output_review_Write.jsp?postId="+ comment_board + "'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>