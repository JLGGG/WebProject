<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="cart.Product" %>
<%@ page import="cart.ProductRepository" %>
<%@ page import="cart.ProductDAO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<style>
@import url('../../Css/title.css');
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품 정보</title>
<script type="text/javascript">
	function addToCart(){
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit(); 
		}else{
			document.addForm.reset();
		}
	}
</script>
<style type="text/css">
@import url('../../Css/list_title.css');
@import url('../../Css/text.css');
@import url('../../Css/table_css.css');
@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:400,700&subset=korean');
@import url('https://fonts.googleapis.com/css?family=Gaegu:400,700&subset=korean');
</style>
</head>
<body>
	<div class="GG">상품 정보</div>
	<hr color="gray" size="2"><br>
	
	<%
		String userId = null;
		
		if (session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
		}
	
		String id =request.getParameter("id");
		Product product=null;
		ProductDAO instance=new ProductDAO();
		ArrayList<Product> productList = instance.getList();
		for(int i=0; i<productList.size();i++){
			if(productList.get(i).getProductID().equals(id)){
				product=productList.get(i);
				break;
			}
		}
		
		if(product.getSellCondition()==1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('판매완료된 상품입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5"> 
				<%
					if(product.getFileName()!=null){	
				%>
				<img src="../../img/<%=product.getFileName() %>"  style="width: 100%"/>
				<%
					}
				%>
			</div>
			<div class="col-md-6">
				<h3><%=product.getProductName() %></h3>
				<p><%=product.getDescription() %>
				<p> <b>상품 번호:</b><span class="badge badge-danger"><%=product.getProductID() %></span>
				<h4><%=product.getUnitPrice() %>원</h4>
				<p> <b>판매자: </b><%=product.getUserId() %>
				<% if(userId!=null) {
						if(userId.equals(product.getUserId())){
				%>
				<form action="./radioCheckDbUpdate.jsp">
					<p> <b>판매중</b>
					<input type="hidden" name="productId" value=<%=product.getProductID()%>> 
					<input type="radio" name="sellCondition" value=0> <b>판매완료</b><input type="radio" name="sellCondition" value=1>
								   <input type="submit" value="판매상태 변경">
				</form>
				<%
						}
					}
				%>
				<p><form name="addForm" action="./addCart.jsp?id=<%=product.getProductID() %>" method="post">
				<a href="#" class="btn btn-info" onclick="addToCart()">장바구니</a>
				<a onclick="window.open('http://localhost:8080/HiBeBe/Letter/send_letter.jsp?recvId=<%=product.getUserId() %>', 'w', 'width=650,height=500')"
				class="btn btn-info" style="cursor:pointer; background:white; border: 1px solid black; color:black;">주문하기</a>
				<a href="./fleemarket_list.jsp" class="btn btn-success">상품목록</a>
				<% if(userId!=null) {
					if(userId.equals(product.getUserId())){
				%>
				<a href="./deleteFleemarketItem.jsp?id=<%=product.getProductID() %>" class="btn btn-info" style="background:red; color:white;">글 삭제</a>
				<%
					}else{
				%>
				<a href="#"></a>
				<%
					}
				}
		
				%>
				</form>
			</div>
		</div>
	</div>

</body>
</html>