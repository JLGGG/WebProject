<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cart.ProductDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String userId = null;

	if (session.getAttribute("userId") != null) {
		userId = (String) session.getAttribute("userId");
	}
	
	ProductDAO instance = new ProductDAO();
	if(instance.radioCheckDbUpdate(request.getParameter("productId"), Integer.valueOf(request.getParameter("sellCondition")))==-1){
		out.println("<script>alert('판매 상태가 업데이트 에러');</script>");
		out.println("<script>history.back()</script>");
	}else{
		out.println("<script>alert('판매 상태가 업데이트 되었습니다.');</script>");
		out.println("<script>history.back()</script>");
	}
%>

</body>
</html>