<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일체크 JSP 페이지</title>
</head>
<style>
.imgSrc {
	border: 1px solid dimgray;
	border-radius: 1px;
	opacity: 0.7;
}

.imgUpload {
	border-radius: 10px;
	border: 1px solid dimgray;
	padding-bottom: 2px;
	color: black;
	margin-top: 5px;
	height: 20px;
	font-size: 12px;
	fontfamily: 맑은고딕;
	vertical-align: middle;
	width: 80px;
}

.fileUploading {
	display: inline;
	border-bottom: 1px solid gray;
}

.imgPreview {
	position: relative;
	float: left;
	border: 1px solid darkgray;
	opacity: 0.7;
	width: 80px;
	height: 60px;
	vertical-align: middle;
	text-align: center;
}

.imgSetsrc {
	position: relative;
	float: left;
	width: auto;
	height: 60px;
	valign: middle;
	padding: 10px;
}
</style>
<%
	// post방식에 대한 한글 인코딩 방식 지정 get방식은 서버의 server.xml에서 Connector태그에 URIEncoding="UTF-8" 추가
	request.setCharacterEncoding("UTF-8");
	/*  // 중복방지용으로 만들어져 넘겨진 파일명을 가져옴
	 String fileName1 = request.getParameter("fileName1");
	 // 본래의 파일명을 가져옴
	 String originalName1 = request.getParameter("originalName1"); */
	String filename = "";
	filename = request.getParameter("filename");
	String fileSize = request.getParameter("fileSize");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
%>
<%
	//DB
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://myymdb.cbs4aawfycnj.ap-northeast-2.rds.amazonaws.com:3306/hibebe", "bbang5368", "qlalfqjsgh");

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
	conn.close();
%>
<div class="fileUploading">
	<table style="border-bottom: 1px solid gray;" width="500px"
		height="60px">
		<tr>
			<td style="font-size: 13px;">파일명 : <%=filename%></td>
			<td style="font-size: 13px">파일크기 : <%=fileSize%>KB</td>
			<td>
			<button onclick="refresh()">확인</button>
			</td>
		</tr>
	</table>
</div>
<script>
	function refresh() {
		opener.location.replace("input_fleemarket_Write.jsp?num=<%=num%>&fileSize=<%=fileSize%>&title=<%=title%>&content=<%=content%>");
		window.close();
	}
</script>
