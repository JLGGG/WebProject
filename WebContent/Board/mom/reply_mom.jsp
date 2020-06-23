<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>엄마게시판 답글쓰기 페이지</title>
<style type="text/css">
@import url('../../Css/title.css');
@import url('../../Css/save.css');
body {
	font-family: 맑은 고딕;
}
</style>
</head>
<body>
	<!-- form action 보내는 경우 -->

	<!-- 타이틀 -->
	<div id="title">엄마 게시판</div>
	<table id="title_line" width="100%" height="20px" border="0">
		<tr>
			<td style="background-color: #5D5D5D" width="30%"></td>
			<td width="70%" style="background-color: #BDBDBD"></td>
		</tr>
	</table>
	<br>
	<br>

	<!-- 글쓰기  -->
	<div style="background-color: rgb(231, 230, 230); padding: 20px; width: 94%; height: 500px;">
		<!-- 배경상자 -->
		<!-- 폼 -->
		<form name="myform" method="POST" action="db_mom.jsp">
			<input type="text" name="title" id="title_"
				style="border: 0.5px solid grey; width: 97%; align-self: center"
				placeholder="제목을 입력하세요.."> <br> <br>
			<textarea name="content" id="content_"
				style="border: 0.5px solid grey; width: 97%; height: 400px; resize: none; top: 0px;"
				placeholder="내용을 입력하세요.."></textarea>
			<br> <br>
			<center>
				<input type="submit" name="save" id="save" value="저장"> 
				<input type="button" name="cancel" id="cancel" onclick="history.back()" value="취소">
			</center>
			<%
			//답변 작성 페이지이면 ref에 글번호값 저장, reply에 y 저장
				String flag = request.getParameter("flag");
				if ("r".equals(flag)) {
			%>
			
			<input type="hidden" name="ref"
				value="<%=request.getParameter("postId")%>"> <input
				type="hidden" name="reply" value="y">

			<%
			//그렇지않으면 n 저장
				} else
			%>
			<input type="hidden" name="reply" value="n">
		</form>
</body>
</html>
