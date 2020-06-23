<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="cart.Product"%>
<%@ page import="cart.ProductDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>판매완료된 물건 목록</title>
<style>
@import url('../Css/text.css');
@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:400,700&subset=korean');
@import url('https://fonts.googleapis.com/css?family=Gaegu:400,700&subset=korean');


#board_list td{
	border-bottom : 1px solid grey;
}
</style>

</head>
<body>

	<%
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	
	<div class="GG">관리자페이지 > 판매완료된 거래목록</div>
	<hr color="gray" size="2">
	
	<h2>판매완료 거래목록</h2><br>
	<center>
		<table id="soldout_list" width="100%" cellpadding="3" cellspacing="0"	border="0">
			<thead>
				<tr style="background-color: #2F9D27; color: black; text-align: center;">
					<th width="10%">번호</th>
					<th width="15%">판매자</th>
					<th width="15%">상품번호</th>
					<th width="15%">상품이름</th>
					<th width="15%">가격</th>
					<th width="15%">상태</th>
					<th width="20%">설명</th>
				</tr>
			</thead>
			<tbody>
				<%
					ProductDAO boardDAO = new ProductDAO();
					ArrayList<Product> list = boardDAO.getSoldoutList();

					for (int i = 0; i < list.size(); i++) {
				%>

				<tr style="text-align: center; border-bottom: 1px solid gray;">
					<td><%=i + 1%></td>
					<td><%=list.get(i).getUserId()%></td>
					<td><%=list.get(i).getProductID()%></td>
					<td><%=list.get(i).getProductName()%></td>
					<td><%=list.get(i).getUnitPrice()%></td>
					<td>판매완료</td>
					<td><%=list.get(i).getDescription()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<br>

	<div align="right" >
		<input type="button" class="btn btn-secondary" onclick="history.back()" value="취소">
	</div>
	</center>
	

	<br>
</body>
</html>