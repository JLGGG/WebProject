<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cart.Product" %>
<%@ page import="cart.ProductRepository" %>
<%@ page import="cart.ProductDAO" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품 목록</title>
<style type="text/css">
@import url('../../Css/text.css');
@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:400,700&subset=korean');
@import url('https://fonts.googleapis.com/css?family=Gaegu:400,700&subset=korean');
</style>
</head>
<body>
<div class="GG">상품 검색</div>
	<hr color="gray" size="2"><br>

	<%
		ProductDAO temp=new ProductDAO();
		ArrayList<Product> productList = temp.getList();
	%>
	<div class="container">
		<div class="row" align="center">
			<%
				String searchInfo=new String(request.getParameter("searchName").getBytes("8859_1"), "UTF-8");
			
				for(int i=0; i<productList.size();i++){
					Product product=productList.get(i);
					if(searchInfo.equals(product.getProductName())){
				
			%>
			<div class="col-md-4">
				<h3><%=product.getProductName() %></h3>
				<p><%=product.getDescription() %>
				<p><%=product.getUnitPrice() %>원
				<P><a href="./output_fleemarket_Write.jsp?id=<%=product.getProductID() %>" class="btn btn-secondary" role="button">상품정보</a>
			</div>
			<%
					}
				}
			%>
		</div>
		<hr>
	</div>
	<div align="right">
	<input type="button" class="btn btn-secondary" onclick="history.back()" value="뒤로 가기">
	
	</div>
</body>
</html>