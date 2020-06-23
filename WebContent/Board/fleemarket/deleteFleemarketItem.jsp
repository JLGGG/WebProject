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
	String productId = request.getParameter("id");
	
	if (session.getAttribute("userId") != null) {
		userId = (String) session.getAttribute("userId");
	}
	
	ProductDAO instance=new ProductDAO();
	if(instance.deleteItem(userId, productId)==-1){
		out.println("<script>alert('삭제오류');</script>");
	}else{
		out.println("<script>alert('삭제되었습니다.');</script>");
		out.println("<script>location.href='./fleemarket_list.jsp'</script>");
	}
%>

</body>
</html>