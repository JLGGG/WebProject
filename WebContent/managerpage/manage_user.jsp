<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>회원정보목록 페이지</title>
<style>
@import url('../Css/text.css');
@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:400,700&subset=korean');
@import url('https://fonts.googleapis.com/css?family=Gaegu:400,700&subset=korean');
/* 
#Icon {
	border-radius: 20px;
	border: 2px solid #2F9D27;
	background-color: #FFFFFF;
	color: dimgray;
	padding:5px;
	padding-left:10px;
	padding-right:10px;
}

 */
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

		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<div class="GG">관리자페이지 > 회원 정보 관리</div>
	<hr color="gray" size="2">
	<br>
	<h2>회원 등급 변경</h2><br>

	<center>
	<form name="manage" method="post" action="db_manage_user.jsp">
		<table id="board_list" width="100%" cellpadding="3" cellspacing="0"	border="0">
			<thead>
				<tr style="background-color: #2F9D27; color: black; text-align: center;">
					<th width="10%">번호</th>
					<th width="15%">아이디</th><!-- 
					<th width="15%">비밀번호</th> -->
					<th width="15%">이름</th>
					<th width="15%">성별</th>
					<th width="20%">생년월일</th>
					<th width="15%">등급</th>
				</tr>
			</thead>
			<tbody>
				<%
					UserDAO boardDAO = new UserDAO();
					ArrayList<User> list = boardDAO.getUserList();
					String pw=null;
					for (int i = 0; i < list.size(); i++) {
						pw =list.get(i).getPw();
				%>
	
				<tr style="text-align: center;border-bottom: 1px solid gray;">
					<td><%=i + 1%></td>
					<td><%=list.get(i).getId()%></td>
<%-- 					<td><% for (int j=0; i < pw.length(); j++ ){%><%=* %></td>
					<%} %> --%>
					<td><%=list.get(i).getName()%></td>
					<td><%=list.get(i).getGender()%></td>
					<td><%=list.get(i).getYear()+ "년" + list.get(i).getMonth()+ "월"
						+ list.get(i).getDate()+ "일"%></td>
					<td><input type="text" name="level_<%=i%>" value="<%=list.get(i).getLevel()%>"></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<br>
	<hr color="gray">	<br>
	<input type="submit" class="btn btn-primary" value="변경">
	<input type="button" class="btn btn-secondary" onclick="history.back()" value="취소">	
	</form>
	</center>
</body>
</html>