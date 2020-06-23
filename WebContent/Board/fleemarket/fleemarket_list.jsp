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
@import url('../../Css/table2_css.css');

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
		
		//ProductRepository temp=ProductRepository.getInstance();
		ProductDAO temp=new ProductDAO();
		ArrayList<Product> productList = temp.getList();
	%>
	

	<table>
		<tr>
			<th class="GG" width="70%" align="left">중고 마켓</th>
			
			<th class="NS" width="15%">	<a href="./searchProduct.jsp" class="btn btn-success" align="right">상품 검색</a></th>
			<% 	
				if(userId!=null){
			%>
				<th class="NS" width="15%">	<a href="input_fleemarket_Write.jsp" class="btn btn-primary" align="right">상품 등록</a></th>
			<%
				}
			%>
				
		</tr>
	</table>

	
	<hr color="gray" size="2"><br>

	<div class="container">
	<br><br>
		<div class="row" align="center">
			<%
				for(int i=0; i<productList.size();i++){
					Product product=productList.get(i);
				
			%>
			<div class="col-md-3">
			<%
				if(product.getFileName()!=null){	
			%>
			<img src="../../img/<%=product.getFileName() %>"  style="width: 120px; height: 120px"/>
			<%
				}
			%>
				<h3><%=product.getProductName() %></h3>
				<p><%=product.getDescription() %>
				<p><%=product.getUnitPrice() %>원
				<P><a href="./output_fleemarket_Write.jsp?id=<%=product.getProductID() %>" class="btn btn-secondary" style="background:grey;" role="button">상품정보</a>
			</div>
			<%
				}
			%>
		</div>
	</div>

</body>
</html>