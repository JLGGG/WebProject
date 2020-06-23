<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="letter.LetterDAO"%>
<%@ page import="letter.Letter"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<title>보낸 쪽지함</title>
<style type="text/css">
@import url('../Css/text.css');
@import	url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:400,700&subset=korean');
@import	url('https://fonts.googleapis.com/css?family=Gaegu:400,700&subset=korean');

#button1 {
	background-color: #fffff;
	text-align: center;
}

#button1 a {
	color: white;
	display: inline-block;
	padding: 5px 10px;
	text-decoration: none;
	font-weight: bold;
	margin: 3px;
	background: grey;
}

td{
	border-bottom : 1px solid grey;
	border-collapse: collapse;
}
</style>
</head>
<body>
	<%
		String userId = null;

		if (session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
		}

		if (userId == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요!')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
		<div class="GG">쪽지함</div>
		
		<hr color="gray" size="2">
	
	<div id= "button1">
	<p align="left">
		<a href="letter_recieve_list.jsp">받은쪽지</a>
		<a href="letter_send_list.jsp"  style="background:green">보낸쪽지</a>
		<a onclick="window.open('http://localhost:8080/HiBeBe/Letter/send_letter.jsp', 'w', 'width=650,height=500')"
		style="cursor:pointer; background:white; border: 1px solid black; color:black;">쪽지보내기</a>
	</p>
	</div>

	<table id="board_list" width="100%" cellpadding="3" cellspacing="0"
		border="0">

		<thead>
			<tr
				style="background-color: #EAEAEA; color: black; text-align: center;">
				<th width="10%">번호</th>
				<th width="35%">제목</th>
				<th width="15%">받은사람</th>
				<th width="20%">보낸날짜</th>
			</tr>
		</thead>

		<tbody>
			<%
				LetterDAO letterDAO = new LetterDAO();
				ArrayList<Letter> list = letterDAO.getSendLetterList(userId);

				for (int i = 0; i < list.size(); i++) {
			%>

			<tr style="text-align: center; border-bottom: 1px solid #FFE400;">
				<td><%=i + 1%></td>
				<td><a
					href="output_send_letter.jsp?letterId=<%=list.get(i).getLetterId()%>">
						<%=list.get(i).getRecvId()%>님에게 보낸 쪽지입니다.
				</a></td>
				<td><%=list.get(i).getRecvId()%></td>
				<td><%=list.get(i).getDateSent()%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<br>
	<div align="right" >
		<input type="button" class="btn btn-secondary" onclick="history.back()" value="취소">
	</div>
</body>
</html>