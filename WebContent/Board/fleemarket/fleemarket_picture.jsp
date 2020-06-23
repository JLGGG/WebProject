<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>동아리소식 사진형 페이지</title>
<style type="text/css">
	@import url('../../../Css/title.css');
	@import url('../../../Css/writebutton.css');
	@import url('../../../Css/list_title.css');
	body{font-family: 맑은 고딕;}
	a:visited{color:black;}
	a:link{color:black;}
</style>
</head>
<body>
<div id="title">동아리 소식</div>
<table id="title_line" width="100%" height="20px" border="0">
<tr><td style="background-color: #5D5D5D" width="30%"></td><td width="70%" style="background-color: #BDBDBD"></td></tr>
</table>
<p align="right"><font align="right" color="orange">사진형</font>
<a href="fleemarket_list.jsp" style="text-decoration:none">목록형</a></p>
<hr color="gray" size="2">
<!-- 테이블 아래 내용 -->
<hr color="gray">
<!-- 페이지 목록 만들기 if list size>15 page size++ -->
<center><font size="2">1</font></center><br>
<div class="right"><input type="button" value="글쓰기" onclick="location.href='input_fleemarket_Write.jsp'"></div>
</body>
</html>