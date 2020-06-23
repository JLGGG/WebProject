<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>중고거래 파일 없는 경우</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String num_nofile = request.getParameter("num_nofile");
	String title_nofile = request.getParameter("title_nofile");
	String content_nofile = request.getParameter("content_nofile");
	
	//데이터 베이스 접속
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://myymdb.cbs4aawfycnj.ap-northeast-2.rds.amazonaws.com:3306/hibebe", "bbang5368", "qlalfqjsgh");

	//작성자 저장
	String userId = null;
	
	if (session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
		}
	//작성날짜 저장
	String date="";
	String dateQuery = "SELECT NOW()";
	PreparedStatement dpstmt = conn.prepareStatement(dateQuery);
	ResultSet drs = dpstmt.executeQuery();
	if (drs.next()) {
		date = drs.getString(1);
	}
	
	//insert
	String query = "INSERT INTO marketboard VALUES(?,?,?,?,?,0,?)";
	PreparedStatement pstmt = conn.prepareStatement(query);
	pstmt.setInt(1, Integer.parseInt(num_nofile));
	pstmt.setString(2, null);
	pstmt.setString(3, title_nofile);
	pstmt.setString(4, date);
	pstmt.setString(5, userId);
	pstmt.setString(6, content_nofile);
	
	pstmt.executeUpdate();

	dpstmt.close();
	pstmt.close();
	conn.close();

		response.sendRedirect("fleemarket_list.jsp");
%>
</body>
</html>