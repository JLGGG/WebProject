<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@ page import="letter.LetterDAO"%>
<%@ page import="letter.Letter"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아빠 게시판 게시글 삭제 </title>
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
			
			int letterId=0;
			if(request.getParameter("letterId") != null){
				letterId=Integer.parseInt(request.getParameter("letterId"));
			}
			if(letterId==0){
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 글입니다.')");
				script.println("location.href='letter_recieve_list.jsp'");
				script.println("</script>");
			}
			
			//작성자와 사용자가 일치하지않는 경우
			Letter letter = new LetterDAO().getLetter(letterId);
			
			if(!userId.equals(letter.getRecvId())){
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('권한이 없습니다.')");
				script.println("location.href='letter_recieve_list.jsp'");
				script.println("</script>");
			}else{
	
					LetterDAO letterDAO= new LetterDAO();
					int result=letterDAO.recieverDelete(letterId);				

					if(result==-1){			//데이터베이스 오류
						PrintWriter script=response.getWriter();
						script.println("<script>");
						script.println("alert('쪽지 삭제에 실패하였습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
					else{				//글쓰기 성공
					//	session.setAttribute("userId",user.getId());
						PrintWriter script=response.getWriter();
						script.println("<script>");
						script.println("alert('쪽지 삭제가 성공적으로 완료되었습니다.')");
						script.println("location.href='letter_recieve_list.jsp'");
						script.println("</script>");
					}
				}
	
			
		}
	%>
</body>
</html>