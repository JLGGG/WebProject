<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<%@ page import="comment.Comment"%>
<%@ page import="comment.CommentDAO"%>
<%@ page import="board.Board"%>
<%@ page import="board.MomBoardDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>엄마 게시판 글 페이지</title>
<style type="text/css">
@import url('../../Css/board_list.css');
@import url('../../Css/list_title.css');
@import url('../../Css/text.css');
@import url('../../Css/format.css');

@import	url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:400,700&subset=korean');
@import	url('https://fonts.googleapis.com/css?family=Gaegu:400,700&subset=korean');

.line {
	border-bottom: 2px solid #EAEAEA;
}

a {
	text-decoration: none;
	color: black;
}

.writer-info-wrapper {
	display: none;
	position: absolute;
	width: auto;
	height: auto;
	background: #eaeaea;
	border: 1px solid darkgray;
	position: absolute;
	padding:0px;
}
.writer-info-wrapper:hover{
	   background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #dfdfdf), color-stop(1, #ededed));
   background:-moz-linear-gradient(top, #dfdfdf 5%, #ededed 100%);
   background:-webkit-linear-gradient(top, #dfdfdf 5%, #ededed 100%);
   background:-o-linear-gradient(top, #dfdfdf 5%, #ededed 100%);
   background:-ms-linear-gradient(top, #dfdfdf 5%, #ededed 100%);
   background:linear-gradient(to bottom, #dfdfdf 5%, #ededed 100%);
   filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#dfdfdf', endColorstr='#ededed',GradientType=0);
   background-color:#dfdfdf;
}
.writer-info-wrapper.on {
	display: block;
}
.save {
font-family: '맑은 고딕' display:inline-block; width: 100px; height: 35px; border: 1px solid #32c8a5; background: #32c8a5; color: white; font-weight: 600;
	cursor: pointer;
}
.save::hover {
	background: rgb(57, 168, 142) !important;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		$(document).click(function() {
			$(".writer-info-wrapper").removeClass("on");
		});

		$(".writer-info-wrapper").click(function(event) {
			event.stopPropagation();
		});

		$(".writer-btn").click(function(event) {
			event.stopPropagation();
			$(".writer-info-wrapper").addClass("on");
		});
	});
</script>
</head>
<body>
	<%
		String userId = null;
		String userGender = null;
		User user = new User();
		UserDAO ud = new UserDAO();

		//로그인 여부 확인
		if (session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
			user = ud.getUser(userId);
			//성별 확인
			if (!user.getGender().equals("female")) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('여성만 이용가능한 게시판입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
		}
		if (userId == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요!')");
			script.println("history.back()");
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
		MomBoardDAO boardDAO = new MomBoardDAO();

		boardDAO.updateViews(postId);
	%>

	<div class="GG">예비 엄마 게시판</div>
	<hr color="gray" size="2">
	<br>
	<%
		//제대로 utf-8환경이 아니라 한글 깨짐 그래서 임의로 추가                                                   
		request.setCharacterEncoding("utf-8");
	%>
	<!-- 제목 출력 테이블 -->
	<div id=article>
	<table class="NS" width="100%">
		<tr>
			<td style="width: 70%"><b><%=board.getTitle()%></b></td>
			<td style="text-align: right"><%=board.getDate().substring(0, 11) + board.getDate().substring(11, 13) + "시"
					+ board.getDate().substring(14, 16) + "분"%></td>
		</tr>
	</table><br>
	작성자 :
	<%if(board.getUserId().equals("aaa")){%>
		<%=board.getUserId()%>
		<%}else{ %>
	<span class="writer-btn" style="cursor: pointer;"><%=board.getUserId()%></span>
	<div class="writer-info-wrapper">
		<div id="wrapper">
			<a
				onclick="window.open('http://localhost:8080/HiBeBe/Letter/send_letter.jsp?recvId=<%=board.getUserId()%>', 'w', 'width=650,height=500')"
				style="cursor: pointer;">쪽지보내기</a><br>
				<hr color="darkgray"  width="100%">
				<a
				onclick="window.open('http://localhost:8080/HiBeBe/Letter/police.jsp', 'w', 'width=650,height=500')"
				style="cursor: pointer;">신고하기</a>
		</div>
	</div>
	<%} %>
	&nbsp;&nbsp;조회수:
	<%=board.getViews()%>
	<br><br>
	<!-- 내용 출력 테이블 -->
	<table class="NS" width="100%" style="border-bottom: 0.1px solid #5D5D5D">
		<tr style="border-bottom: 0.1px solid #5D5D5D">
			<td style="width: 50%"><b><%=board.getContent()%></b><br><br></td>
		</tr>
	</table>
<br>
	<!-- 목록 수정하기 삭제하기 버튼 -->
	<table>
		<tr>
			<td width="8%">
					<input type="button" value="목록" class="btn btn-primary"
						onclick="location.href='mom_list_name.jsp'">
			</td>
			<td width="76%">
			<%if(userId.equals(board.getUserId())) {%>
			<td width="8%">
			<input type="button" value="수정하기" class="btn btn-secondary"
						onclick="location.href='edit_mom.jsp?postId=<%=postId%>'">
</td>
			<td width="8%">
					<input type="button" value="삭제하기" class="btn btn-secondary"
						onclick="location.href='db_delete_mom.jsp?postId=<%=postId%>'">
			</td>
			<%} %>
		</tr>
	</table>
<br><br>

	<!--댓글 작성 부분  -->
<div id="comment">
		<%
			CommentDAO commentDAO = new CommentDAO();
			ArrayList<Comment> commentList = commentDAO.getCommentList(postId);%>
			댓글 <%=commentList.size() %>개<br><br>
			<center>
			<table style="table-layout:fixed; width: 90%">
			<tr style="text-align: center; border-bottom: 1px solid gray;">
			<th style="width: 10%">순번</th>
			<th style="width: 15%">작성자</th>
			<th style="width: 40%">내용</th>
			<th style="width: 25%">작성시간</th>
			<th style="width: 10%"></th>
			</tr>
			<%for (int i = 0; i < commentList.size(); i++) {
		%>

		<tr style="text-align: center; border-bottom: 1px solid gray;">
			<td><%=i + 1%></td>
			<td><%=commentList.get(i).getUserId()%></td>
			<td><%=commentList.get(i).getContent()%></td>
			<td><%=commentList.get(i).getDate().substring(0, 11) + commentList.get(i).getDate().substring(11, 13) + "시"
						+ commentList.get(i).getDate().substring(14, 16) + "분"%></td>
			<%if(userId.equals(commentList.get(i).getUserId())) {%>
			<td> <a href ="db_delete_comment_mom.jsp?commentId=<%=commentList.get(i).getCommentId()%>&postId=<%=postId%>">[삭제]</a></td>
			<%}else{ %>
			<td></td>
			<%} %>
		</tr>
		<%
			}
		%>
		</table><br><br></center>
		
		<form name="commentform" method="POST" action="db_comment_mom.jsp">
		<input type="hidden" name="comment_board" value=<%=postId%>>
		<input type="hidden" name="comment_id" value=<%=userId%>>
		<div style="width: 90%; margin: auto">
			<p style="margin: 0; font-size: 1.2rem; font-weight: 600;"><%=userId%></p>
			<textarea name="content" rows="2" style="display:block; width: 100%;"></textarea>
			<p style="text-align: right; margin-top: 10px;">
				<input type="submit" name="save" id="save" value="댓글작성" class="save">
			</p>
		</div>
		</form>
		</div>
	</div>

