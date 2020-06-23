<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<%@ page import="board.MomBoardDAO"%>
<%@ page import="cart.ProductDAO"%>
<%@ page import="board.DadBoardDAO"%>
<%@ page import="board.ReviewBoardDAO"%>
<%@ page import="board.Board"%>
<%@ page import="cart.Product"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>내가 쓴 글</title>
<style type="text/css">
@import url('../Css/text.css');
@import url('../Css/list_title.css');
@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:400,700&subset=korean');
@import url('https://fonts.googleapis.com/css?family=Gaegu:400,700&subset=korean');


td{
	border-bottom : 1px solid grey;
	border-collapse: collapse;
}
</style>
</head>
<body>

	<%
		String userId = null;
		UserDAO ud = new UserDAO();
		User user = null;
		
		if (session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
			
			user = ud.getUser(userId);
			
		}
		if (userId == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요!')");
			script.println("history.back()");
			script.println("</script>");
		}

		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}


	
		if(user.getManager()==0){
	%>
	<div class="GG">마이페이지 > 내가 쓴 글 보기</div>
	<hr color="gray" size="2"><%
		}else {	
	%><div class="GG">관리자페이지 > 내가 쓴 글 보기</div>
	<hr color="gray" size="2"><br><%} %>
	
	<h2>중고 마켓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
	<center>
		<table id="market_list" width="100%" cellpadding="3" cellspacing="0" border="0">
			<thead>
				<tr
					style="background-color: #EAEAEA; color: black; text-align: center;">
					<th width="10%">번호</th>
					<th width="10%">상품이름</th>
					<th width="10%">상품번호</th>
					<th width="15%">작성자</th>
					<th width="10%">가격</th>
					<th width="30%">설명</th>
				</tr>
			</thead>

			<tbody>
				<%
					ProductDAO pboardDAO = new ProductDAO();
					ArrayList<Product> plist = pboardDAO.getMyList(userId);

					for (int i = 0; i < plist.size(); i++) {
				%>

				<tr style="text-align: center; border-bottom: 1px solid #FFE400;">
					<td><%=i + 1%></td>
					<td><%=plist.get(i).getProductName()%></td>
					<td><%=plist.get(i).getProductID()%></td>
					<td><%=plist.get(i).getUserId()%></td>
					<td><%=plist.get(i).getUnitPrice()%>원</td>
					<td><%=plist.get(i).getDescription()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<br>
	</center>
	<br>
	<h2>후기 게시판&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
	<center>
		<table id="board_list" width="100%" cellpadding="3" cellspacing="0"	border="0">
			<thead>
				<tr style="background-color: #EAEAEA; color: black; text-align: center;">
					<th width="10%">번호</th>
					<th width="35%">제목</th>
					<th width="15%">작성자</th>
					<th width="20%">작성일</th>
					<th width="10%">조회수</th>
				</tr>
			</thead>

			<tbody>
				<%
					ReviewBoardDAO boardDAO = new ReviewBoardDAO();
					ArrayList<Board> list = boardDAO.getMyList(userId);

					for (int i = 0; i < list.size(); i++) {
				%>

				<tr style="text-align: center; border-bottom: 1px solid #FFE400;">
					<td><%=i + 1%></td>
					<td><%=list.get(i).getTitle()%></td>
					<td><%=list.get(i).getUserId()%></td>
					<td><%=list.get(i).getDate().substring(0, 11) + list.get(i).getDate().substring(11, 13) + "시"
						+ list.get(i).getDate().substring(14, 16) + "분"%></td>
					<td><%=list.get(i).getViews()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<br>
	</center><br>
	<% 
	if (user.getGender().equals("female")) {%>
	<h2>예비 엄마 게시판&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
	<center>
		<table id="momboard_list" width="100%" cellpadding="3" cellspacing="0"
			border="0">
			<thead>
				<tr
					style="background-color: #EAEAEA; color: black; text-align: center;">
					<th width="10%">번호</th>
					<th width="35%">제목</th>
					<th width="15%">작성자</th>
					<th width="20%">작성일</th>
					<th width="10%">조회수</th>
				</tr>
			</thead>

			<tbody>
				<%
					MomBoardDAO mboardDAO = new MomBoardDAO();
					ArrayList<Board> mlist = mboardDAO.getMyList(userId);

					for (int i = 0; i < mlist.size(); i++) {
				%>

				<tr style="text-align: center; border-bottom: 1px solid #FFE400;">
					<td><%=i + 1%></td>
					<td><%=mlist.get(i).getTitle()%></td>
					<td><%=mlist.get(i).getUserId()%></td>
					<td><%=mlist.get(i).getDate().substring(0, 11) + mlist.get(i).getDate().substring(11, 13) + "시"
						+ mlist.get(i).getDate().substring(14, 16) + "분"%></td>
					<td><%=mlist.get(i).getViews()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<br><br><div align="left">		
		<h2>
			총: <%=list.size()+plist.size() + mlist.size()%>개
		</h2></div>

	</center>
	<%} else {%>
	<h2>예비 아빠 게시판&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
	<center>
		<table id="dadboard_list" width="100%" cellpadding="3" cellspacing="0"
			border="0">
			<thead>
				<tr
					style="background-color: #EAEAEA; color: black; text-align: center;">
					<th width="10%">번호</th>
					<th width="35%">제목</th>
					<th width="15%">작성자</th>
					<th width="20%">작성일</th>
					<th width="10%">조회수</th>
				</tr>
			</thead>

			<tbody>
				<%
					DadBoardDAO dboardDAO = new DadBoardDAO();
					ArrayList<Board> dlist = dboardDAO.getMyList(userId);

					for (int i = 0; i < dlist.size(); i++) {
				%>

				<tr style="text-align: center; border-bottom: 1px solid #FFE400;">
					<td><%=i + 1%></td>
					<td><%=dlist.get(i).getTitle()%></td>
					<td><%=dlist.get(i).getUserId()%></td>
					<td><%=dlist.get(i).getDate().substring(0, 11) + dlist.get(i).getDate().substring(11, 13) + "시"
						+ dlist.get(i).getDate().substring(14, 16) + "분"%></td>
					<td><%=dlist.get(i).getViews()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table><br><br><h2>
		총:
		<%=list.size() +plist.size()+ dlist.size()%>개
	</h2>
	</center>
	<%} %>
	<div align="right" >
		<input type="button" class="btn btn-secondary" onclick="history.back()" value="취소">
	</div>
	<br>
</body>
</html>