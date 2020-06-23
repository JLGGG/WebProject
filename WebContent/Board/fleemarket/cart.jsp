<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cart.Product" %>
<%@ page import="cart.ProductRepository" %>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<%
	String cartId = session.getId();
%>
<meta charset="UTF-8">
<title>장바구니</title>
<style type="text/css">
@import url('../../Css/text.css');
@import url('../../Css/table_css.css');

@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:400,700&subset=korean');
@import url('https://fonts.googleapis.com/css?family=Gaegu:400,700&subset=korean');
</style>
</head>
<body>
	<div class="GG">장바구니</div>
	<hr color="gray" size="2"><br>
		
	<div>
			<!-- <table class="table table-hover" width="100%"> -->
			<table>
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>총합</th>
					<th>판매자</th>
					<th>주문하기</th>
					<th>비고</th>
				</tr>
				<%
					int sum=0;
					ArrayList<Product> cartlist = (ArrayList<Product>)session.getAttribute("cartlist");
					if(cartlist == null)
						cartlist = new ArrayList<Product>();
					
					for(int i=0; i<cartlist.size(); i++){
						Product product = cartlist.get(i);
						int total = product.getUnitPrice()*product.getQuantity();
						sum = sum + total;
					
				%>
				<tr>
					<td><a
					href="output_fleemarket_Write.jsp?id=<%=product.getProductID()%>">
					<%=product.getProductID() %> - <%=product.getProductName() %>
					</a></td>
					<td><%=product.getUnitPrice() %></td>
					<td><%=product.getQuantity() %></td>
					<td><%=total %></td>
					<td><%=product.getUserId() %></td>
					<td><a onclick="window.open('http://localhost:8080/HiBeBe/Letter/send_letter.jsp?recvId=<%=product.getUserId() %>', 'w', 'width=650,height=500')"
				 class="btn btn-info" style="cursor:pointer; color:black;">주문</a></td>
					<td><a href="./removeCart.jsp?id=<%=product.getProductID() %>" class="btn btn-secondary">삭제</a></td>
				</tr>
				<%
					}
				%>
				<tr>
					<th>총액</th>
					<th><%=sum %></th>
					<th></th>
				</tr>
			</table><br><br>
			<div align="right" class="NS">
			<a href="./fleemarket_list.jsp" class="btn btn-success" align="right">쇼핑 계속하러 가기</a>
			</div>
			</div>
</body>
</html>