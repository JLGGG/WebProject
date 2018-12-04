<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Date day = new java.util.Date();
		String amOrPm;
		int second = day.getSeconds(); int minute = day.getMinutes(); int hour = day.getHours();
		amOrPm = (hour / 12 == 0) ? "AM" : "PM";
		if(amOrPm.equals("PM"))
			hour = hour - 12;
		String currentTime = hour + ":" + minute + ":" + second + " " + amOrPm;
		out.println("현재 접속 시간 : " + currentTime + "\n");
		
	%>
</body>
</html>