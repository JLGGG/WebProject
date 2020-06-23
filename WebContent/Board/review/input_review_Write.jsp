<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>병원후기 글쓰기 페이지</title>
<style type="text/css">
@import url('../../Css/writebutton.css');
@import url('../../Css/save.css');
@import url('../../Css/list_title.css');
@import url('../../Css/text.css');
@import url('../../Css/table_css.css');

@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:400,700&subset=korean');
@import url('https://fonts.googleapis.com/css?family=Gaegu:400,700&subset=korean');
</style>
</head>
<body>
<%
		String userId = null;
		String userGender = null;
		User user = new User();
		UserDAO ud = new UserDAO();

		//로그인 여부 확인
		if (session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
			user = ud.getUser(userId);
		}
		if (userId == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요!')");
			script.println("history.back()");
			script.println("</script>");
		}
%>

	<!-- 타이틀 -->
	<div class="GG">병원 후기 게시판</div>
	<hr color="gray" size="2">
	<div
		style="margin-left: auto; margin-right: auto; padding: 20px; width: 90%; height: auto;">

		<form name="myform" method="POST" action="db_review.jsp">
			<center>
				<input type="text" name="title" id="title_"
					style="border: 1px solid grey; width: 97%; align-self: center"
					placeholder="제목을 입력하세요.."> <br> <br>
				<textarea name="content" id="content_"
					style="border: 1px solid grey; width: 97%; height: 250px; resize: none; top: 0px;"
					placeholder="내용을 입력하세요.."></textarea>
				<br> <br>
					<input type="submit" class="btn btn-success" value="저장">
					<input type="button" class="btn btn-info" style="background:grey;" onclick="history.back()" value="취소">
			</center>
		</form>
	</div>
</body>
</html>
