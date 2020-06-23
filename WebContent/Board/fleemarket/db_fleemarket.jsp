<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String fileName = request.getParameter("fileName");
	String fileSize = request.getParameter("fileSize");
	String content = request.getParameter("content");
	//单捞磐 海捞胶 立加
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://myymdb.cbs4aawfycnj.ap-northeast-2.rds.amazonaws.com:3306/hibebe", "bbang5368", "qlalfqjsgh");

	//search
	String query = "select * from marketboard order by num desc";
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(query);

	int num = 0;

	if (rs.next()) {
		//save filename number
		num = rs.getInt("num");
	}
	rs.close();
	stmt.close();

	//insert
	String query_insert = "update marketboard set title=?, content=? where num=?";
	PreparedStatement pstmt = conn.prepareStatement(query_insert);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setInt(3, num);

	pstmt.executeUpdate();

	pstmt.close();
	conn.close();

	response.sendRedirect("fleemarket_list.jsp");
%>