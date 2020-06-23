<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="board.ReviewBoardDAO"%>
<%@ page import="board.Board"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>병원후기 목록 조회수순 페이지</title>
<style type="text/css">
@import url('../../Css/writebutton.css');
@import url('../../Css/list_title.css');
@import url('../../Css/text.css');
@import url('../../Css/table_css.css');
@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:400,700&subset=korean');
@import url('https://fonts.googleapis.com/css?family=Gaegu:400,700&subset=korean');
</style>
</head>

<body>
	<div class="GG">병원 후기 게시판</div>
	<hr color="gray" size="2"><br>
	
	<p align="right">
		<a href="review_list_name.jsp" style="text-decoration: none">이름순</a> 
		<a href="review_list_recent.jsp" style="text-decoration: none">최신순</a> 
		<font align="right" color="orange">조회수순</font>
	</p>
	
	<table class="NS" width="100%" cellpadding="3" cellspacing="0" border="0">
		<thead>
			<tr style="text-align: center; ">
				<th width="10%">번호</th>
				<th width="35%">제목</th>
				<th width="15%">작성자</th>
				<th width="20%">작성일</th>
				<th width="10%">조회수</th>
			</tr>
		</thead>
		<%
			int max_num = 5; //한 페이지 최대 게시물 개수
			int pageNumber = 1;
			int max_page=0;
			if (request.getParameter("pageNumber") != null) {
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			}
		%>
		<tbody>
			<%
				ReviewBoardDAO boardDAO = new ReviewBoardDAO();
				ArrayList<Board> list = boardDAO.getListBYviews();
				max_page = list.size() / max_num;
				for (int i = (pageNumber - 1) * max_num; i < pageNumber * max_num; i++) {
					if(i < list.size()) {
			%>
		<tr style="text-align: center;">
				<td><%=i + 1%></td>
				<td><a
					href="output_review_Write.jsp?postId=<%=list.get(i).getPostId()%>">
						<%=list.get(i).getTitle()%>
				</a></td>
				<td><%=list.get(i).getUserId()%></td>
				<td><%=list.get(i).getDate().substring(0, 11) + list.get(i).getDate().substring(11, 13) + "시"
						+ list.get(i).getDate().substring(14, 16) + "분"%></td>
				<td><%=list.get(i).getViews()%></td>
			</tr>
			<%
				}}
			%>
		</tbody>
	</table>

	<!-- 페이지 목록 만들기 -->
	<center><br>
		<font size="2"><%
		if (pageNumber != 1) {
	%>
	<a href="review_list_views.jsp?pageNumber=<%=pageNumber - 1%>">이전</a>
	<%
		}
		if (boardDAO.nextPage(pageNumber - max_page)) {
	%>

	<a href="review_list_views.jsp?pageNumber=<%=pageNumber + 1%>">다음</a>
	<%
		}
	%></font>
	</center>
	<br>
	<div class="right">
		<input class="myButton" type="button" value="글쓰기" onclick="location.href='input_review_Write.jsp'">
	</div>
</body>
</html>