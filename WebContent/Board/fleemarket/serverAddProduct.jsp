<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cart.Product" %>
<%@ page import="cart.ProductRepository" %>
<%@ page import="cart.ProductDAO" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%

	String userId = null;
	String fileName="";
	String rootPath = request.getSession().getServletContext().getRealPath("/") ;
	String path="img\\";
	String savePath = rootPath.concat(path);
	String folderPosition=savePath;
	int maxSize=5*1024*1024;
	String encType="utf-8";
	
	
	MultipartRequest multi = new MultipartRequest(request, folderPosition, maxSize, encType, new DefaultFileRenamePolicy());
		
	if (session.getAttribute("userId") != null) {
		userId = (String) session.getAttribute("userId");
	}

	Integer price;
	request.setCharacterEncoding("UTF-8");
	String productId=multi.getParameter("productId");
	String name=multi.getParameter("name");
	String unitPrice=multi.getParameter("price");
	String description=multi.getParameter("description");
	String condition=multi.getParameter("condition");
	
	if(unitPrice.isEmpty())
		price=0;
	else
		price=Integer.valueOf(unitPrice);
	
	Enumeration files = multi.getFileNames();
	String fName= (String)files.nextElement();
	String imgName=multi.getFilesystemName(fName);
	
	ProductRepository temp=ProductRepository.getInstance();
	ProductDAO db=new ProductDAO();
	
	Product addProduct=new Product();
	addProduct.setProductID(productId);
	addProduct.setProductName(name);
	addProduct.setUnitPrice(price);
	addProduct.setDescription(description);
	addProduct.setCondition(condition);
	addProduct.setUserId(userId);
	addProduct.setFileName(imgName);
	
	db.write(productId, name, price, description, condition, userId, imgName);
	temp.addProduct(addProduct);
	response.sendRedirect("fleemarket_list.jsp");
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