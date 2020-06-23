<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="letter.Letter"%>
<%@ page import="letter.LetterDAO"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>쪽지</title>
<style type="text/css">
@import url('../../../Css/board_list.css');
@import url('../../../Css/comment.css');
@import url('../Css/text.css');

@import	url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:400,700&subset=korean');
@import	url('https://fonts.googleapis.com/css?family=Gaegu:400,700&subset=korean');

.line {
	border-bottom: 2px solid #EAEAEA;
}

a {
	text-decoration:none;
	color: black;
}
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
			script.println("history.back()");
			script.println("</script>");
		}

		int letterId = 0;
		if (request.getParameter("letterId") != null) {
			letterId = Integer.parseInt(request.getParameter("letterId"));
		}
		if (letterId == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 쪽지입니다.')");
			script.println("location.href='letter_send_list.jsp'");
			script.println("</script>");
		}
		Letter letter = new LetterDAO().getLetter(letterId);
		LetterDAO letterDAO = new LetterDAO();

		letterDAO.updateRead(letterId);
	%>

	<div class="GG">쪽지함 > 보낸 쪽지함</div>
	<hr color="gray" size="2">
	<br>
	<%
		//제대로 utf-8환경이 아니라 한글 깨짐 그래서 임의로 추가                                                   
		request.setCharacterEncoding("utf-8");
	%>
	<!-- 제목 출력 테이블 -->
	<table id="info" name="info" width="100%" border="0">
		<tr>
			<td style="width: 70%"><b><%=letter.getRecvId()%>님에게 보낸 쪽지입니다.</b></td>
			<td style="text-align: right"><%=letter.getDateSent()%> </td>
		</tr>
	</table>
	<hr color="gray">
	<!-- 여기에 작성자 이름이랑 아이콘 띄우기 -->
	작성자 :<%=letter.getSenderId()%>
	<br>

	<br>
	<!-- 안에 내용 -->
	<%=letter.getContent()%>
	<br>
	<br>
	<hr color="#BDBDBD">
	<br>
	<!-- 목록 수정하기 삭제하기 버튼 -->
	<table>
		<tr>
			<td width="8%">
				<div class="golist">
					<input type="button" value="목록" class="btn btn-primary"
						onclick="location.href='letter_send_list.jsp'">
				</div>
			</td>
			<td width="84%">
			<td width="8%">
				<div class="delete">
					<input type="button" value="삭제하기" class="btn btn-secondary"
						onclick="location.href='db_delete_send_letter.jsp?letterId=<%=letterId%>'">
				</div>
			</td>
		</tr>
	</table>
	<br>
	<br>
	<br>