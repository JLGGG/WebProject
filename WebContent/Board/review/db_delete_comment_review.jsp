<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@ page import="comment.CommentReviewDAO" %>
<%@ page import="comment.Comment"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>리뷰 게시판 댓글 삭제 </title>
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
			
			int commentId=0;
			if(request.getParameter("commentId") != null){
				commentId=Integer.parseInt(request.getParameter("commentId"));
			}
			if(commentId==0){
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 댓글입니다.')");
				script.println("location.href='review_list_recent.jsp'");
				script.println("</script>");
			}
			int postId = 0;
			if (request.getParameter("postId") != null) {
				postId = Integer.parseInt(request.getParameter("postId"));
			}
			
			if (postId == 0) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 글입니다.')");
				script.println("location.href='output_review_Write.jsp?postId="+postId+"'");
				script.println("</script>");
			}
			//작성자와 사용자가 일치하지않는 경우
			Comment comment = new CommentReviewDAO().getComment(commentId);
			if(!userId.equals(comment.getUserId())){
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('권한이 없습니다.')");
				script.println("location.href='output_review_Write.jsp?postId="+postId+"'");
				script.println("</script>");
			}else{
	
				CommentReviewDAO commentDAO= new CommentReviewDAO();
					int result=commentDAO.delete_comment(commentId);

					if(result==-1){			//데이터베이스 오류
						PrintWriter script=response.getWriter();
						script.println("<script>");
						script.println("alert('댓글 삭제에 실패하였습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
					else{				//글쓰기 성공
					//	session.setAttribute("userId",user.getId());
						PrintWriter script=response.getWriter();
						script.println("<script>");
						script.println("alert('댓글삭제가 성공적으로 완료되었습니다.')");
						script.println("location.href='output_review_Write.jsp?postId="+postId+"'");
						script.println("</script>");
					}
				}
	
			
		}
	%>
</body>
</html>