<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cart.Product" %>
<%@ page import="cart.ProductRepository" %>
<%@ page import="cart.ProductDAO" %>
<%
	String id = request.getParameter("id");
	if(id==null || id.trim().equals("")){
		response.sendRedirect("fleemarket_list.jsp");
		return;
	}
	/*
	Product product=null;
	ProductDAO instance=new ProductDAO();
	ArrayList<Product> productList = instance.getList();
	for(int i=0; i<productList.size();i++){
		if(productList.get(i).getProductID().equals(id)){
			product=productList.get(i);
			break;
		}
	}
	
	//ProductRepository temp=ProductRepository.getInstance();
	
	//Product product=temp.getProductById(id);
	if(product == null){
		out.print("상품정보없음");
	}
	*/
	ProductDAO instance=new ProductDAO();
	ArrayList<Product> list=instance.getList();
	Product item=new Product();
	for(int i=0; i<list.size(); i++){
		item=list.get(i);
		if(item.getProductID().equals(id)){
			break;
		}
	}
	
	ArrayList<Product> sessionList = (ArrayList<Product>)session.getAttribute("cartlist");
	if(sessionList==null){
		sessionList=new ArrayList<Product>();
		session.setAttribute("cartlist", sessionList);
	}
	

	item.setQuantity(1);
	sessionList.add(item);
	
	response.sendRedirect("output_fleemarket_Write.jsp?id="+id);
	
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