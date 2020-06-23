<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.Board"%>
<%@ page import="board.MomBoardDAO"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<title>엄마 게시판 수정 페이지</title>
<style type="text/css">
@import url('../../Css/text.css');
@import	url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:400,700&subset=korean');
@import	url('https://fonts.googleapis.com/css?family=Gaegu:400,700&subset=korean');
</style>
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
			script.println("alert('로그인을 하세요!')");
			script.println("location.href('input_login.html')");
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
			script.println("location.href='mom_list_recent.jsp'");
			script.println("</script>");
		}

	
		Board board = new MomBoardDAO().getBoard(postId);
		
		//작성자와 사용자가 일치하지않는 경우
		if(!userId.equals(board.getUserId())){
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('권한이 없습니다.')");
				script.println("location.href='mom_list_recent.jsp'");
				script.println("</script>");
			}
	%>
	<div class="GG">예비 엄마 게시판 > 수정하기</div>
	<hr color="gray" size="2">
	<br>
	
	<!-- 수정하기  -->
	<div style="margin-left: auto; margin-right: auto; padding: 20px; width: 90%; height: auto;">

		<form name="myform" method="POST"
			action="db_edit_mom.jsp?postId=<%=postId%>">
			<input type="text" name="title" id="title_"
				value="<%=board.getTitle()%>"
				style="border: 0.5px solid grey; width: 97%; align-self: center">
			<br> <br>
			<textarea name="content" id="content_"
				style="border: 0.5px solid grey; width: 97%; height: 400px; resize: none; top: 0px;"><%=board.getContent()%></textarea>
			<br> <br>
			<!-- 버튼 2개 -->
			<center>
				<input type="submit" class="btn btn-success" value="수정"> 
				<input type="button" class="btn btn-info" style="background:grey;" onclick="history.back()" value="취소">
			</center>
		</form>
</body>
</html>
