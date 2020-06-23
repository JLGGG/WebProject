<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ID 찾기</title>
<style type="text/css">
select {
	border-color: #E6E6E6;
}
iframe {
	border: none;
}
</style>
</head>
<body>
	<div style="position: center">
		<center>
			<div id="header">
				<iframe src="../page/header_noIcon.jsp" width="100%" scrolling="no"></iframe>
			</div>
			<br>
			<div>
			<b style="color: dimgrey; text-align: justify; font-size: 30px">아이디 찾기</b>
				<hr size="5" color="#FFD966" width="70%">
				<!--이름, 생년월일-->
				<form method="POST" action="output_finding_ID.jsp">
					<br> <br> 이름<br> <input type="text" name="name"
						style="border: 0.5px solid grey; border-radius: 5px; width: 19%; height: 30px"><br>
					<br> 생년월일<br> <select name="year" id="year">
						<option value="">--선택--</option>
						<%
										for (int i = 1980; i <= 2010; i++) {
									%>
						<option value="<%=i%>"><%=i%></option>
						<%
										}
									%>
					</select>년 <select name="month" id="month">
						<option value="">--선택--
						<option>
							<%
											for (int i = 0; i < 12; i++) {
										%>
						
						<option value="<%=i + 1%>"><%=i + 1%></option>
						<%
										}
									%>
					</select>월 <select name="date" id="date">
						<option value="">--선택--</option>
						<%
										for (int i = 1; i <= 31; i++) {
									%>
						<option value="<%=i%>"><%=i%></option>
						<%
										}
									%>
					</select>일 <br><br>
					<input type="submit" value="아이디 찾기" 
					style="background: darkgray; border-radius: 5px; width: 19%; height: 50px; font-size: 15px">
				</form>
				<br><br>
			</div>
		</center>
	</div>
</body>
</html>