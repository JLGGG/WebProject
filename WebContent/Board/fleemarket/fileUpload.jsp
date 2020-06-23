<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사진 업로드</title>
</head>

<%
	request.setCharacterEncoding("UTF-8");

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// request.getRealPath("상대경로") 를 통해 파일을 저장할 절대 경로를 구해온다.
	// 운영체제 및 프로젝트가 위치할 환경에 따라 경로가 다르기 때문에 아래처럼 구해오는게 좋음
	//String uploadPath = request.getRealPath("/upload_img");
	String uploadPath = "C:\\Users\\USER\\git\\HiBeBe\\HiBeBe\\WebContent\\upload_img";
	out.println("절대경로 : " + uploadPath + "<br/>");

	int maxSize = 1024 * 1024 * 10; // 한번에 올릴 수 있는 파일 용량 : 10M로 제한

	String fileName1 = ""; // 중복처리된 이름
	String originalName1 = ""; // 중복 처리전 실제 원본 이름
	long fileSize = 0; // 파일 사이즈
	String fileType = ""; // 파일 타입

	MultipartRequest multi = null;

	try {
		// request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
		multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());

		// 전송한 전체 파일이름들을 가져옴
		Enumeration files = multi.getFileNames();

		while (files.hasMoreElements()) {
			// form 태그에서 <input type="file" name="여기에 지정한 이름" />을 가져온다.
			String file1 = (String) files.nextElement(); // 파일 input에 지정한 이름을 가져옴
			// 그에 해당하는 실재 파일 이름을 가져옴
			originalName1 = multi.getOriginalFileName(file1);
			// 파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unique하게 파일명을 생성하는데
			// 이때 생성된 이름을 filesystemName이라 하여 그 이름 정보를 가져온다.(중복에 대한 처리)
			fileName1 = multi.getFilesystemName(file1);
			// 파일 타입 정보를 가져옴
			fileType = multi.getContentType(file1);
			// input file name에 해당하는 실재 파일을 가져옴
			File file = multi.getFile(file1);
			// 그 파일 객체의 크기를 알아냄
			fileSize = file.length();
		}
	} catch (Exception e) {
		e.printStackTrace();
	}

	//DB작업

	String up = fileName1; //넘어오는 파일 이름
	String date = "";
	
	//데이터 베이스 접속
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://myymdb.cbs4aawfycnj.ap-northeast-2.rds.amazonaws.com:3306/hibebe", "bbang5368", "qlalfqjsgh");
	//작성날짜 저장
	String dateQuery = "SELECT NOW()";
	PreparedStatement dpstmt = conn.prepareStatement(dateQuery);
	ResultSet drs = dpstmt.executeQuery();
	if (drs.next()) {
		date = drs.getString(1);
	}
	//작성자 저장
	String userId = null;

	if (session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
		}
	
	String query = "INSERT INTO marketboard VALUES(null,?,null,?,?,0,null)";
	PreparedStatement pstmt = conn.prepareStatement(query);
	pstmt.setString(1, up);
	pstmt.setString(2, date);
	pstmt.setString(3, userId);
	
	//try-catch하면 오류는 안나지만 글 저장이 안된다
	pstmt.executeUpdate();

	dpstmt.close();
	pstmt.close();
	conn.close();

/* 	if (pstmt.executeUpdate() < 1) {
		out.print("데이터 베이스 입력에 실패하였습니다");
		// 입력에 실패하였다면 서버측에 업로드 된 파일을 삭제한다.
 		Enumeration em = multi.getFileNames();
		while (em.hasMoreElements()) {
			new File(uploadPath + "/" + multi.getFilesystemName((String) em.nextElement())).delete();
		} 
	} else {
		response.sendRedirect("fileCheck.jsp?filename=" + fileName1 + "&fileSize=" + fileSize);
	} 
*/
%>
<%
	response.sendRedirect("fileCheck.jsp?filename="+fileName1+"&fileSize="+fileSize+"&title="+title+"&content="+content);
%>