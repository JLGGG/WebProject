<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내가 쓴 댓글</title>
<style>
@import url('../Css/preparation.css');
a {
	text-decoration: none;
	color: black;
}

#board_list td {
	border-bottom: 2px solid #EAEAEA;
}
</style>
</head>
<body>
	<center>
		<br>
		<h2>내가 쓴 댓글&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;총: 개</h2>
		<hr style="border: solid 2px #498228; opacity: 0.8; width: 70%;">
		<br>
		<p align="right">
			<font align="right" color="orange">최신순</font> 
			<a href="#" style="text-decoration: none">좋아요순</a>
		</p>
		<hr color="gray" size="2">
		<br>
		<table id="board_list" width="100%" cellpadding="3" cellspacing="0" border="0">
			<tr height="7"><th width="5"></th></tr>
			<!-- 테이블 첫 줄 -->
			<thead>
				<tr
					style="background-color: #498228; opacity: 0.8; color: white; text-align: center;">
					<th width="10%">번호</th>
					<th width="35%">제목</th>
					<th width="15%">작성자</th>
					<th width="20%">작성일</th>
					<th width="10%">조회수</th>
					<th width="10%">좋아요</th>
				</tr>
			</thead>
			<!-- 지금은 예시로 한줄, 나중에 db랑 연동 -->
			<tbody>
				<tr style="text-align: center;">
					<td>1</td>
					<td>출사</td>
					<td>예인</td>
					<td>2017-10-29</td>
					<td>3</td>
					<td><img src="../img/like.png" width="20px"></td>
			</tbody>
		</table>
	</center>
	<br>
	<hr color="gray">
<!-- 페이지 목록 만들기 if list size>15 page size++ -->
<center><font size="2">1</font></center><br>
<div id="preparation"><font id="pre">준비중입니다</font></div>
</body>
</html>