<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cart.Product" %>
<%@ page import="cart.ProductRepository" %>
<%
	String id = request.getParameter("id");
	if(id==null || id.trim().equals("")){
		response.sendRedirect("fleemarket_list.jsp");
		return;
	}
	
	ProductRepository temp = ProductRepository.getInstance();
	
	Product product = temp.getProductById(id);
	
	ArrayList<Product> cartlist = (ArrayList<Product>)session.getAttribute("cartlist");
	Product item = new Product();
	for(int i=0; i<cartlist.size(); i++){
		item=cartlist.get(i);
		if(item.getProductID().equals(id)){
			cartlist.remove(item);
		}
	}
	
	response.sendRedirect("cart.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>