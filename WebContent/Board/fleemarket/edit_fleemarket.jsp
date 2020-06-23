<!-- 
해야할 것:
제목이랑 내용 서버에 보내기 
미리보기
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동아리 소식 글쓰기 수정 페이지</title>
<style type="text/css">
	@import url('../../../Css/title.css');
	body{font-family: 맑은 고딕;}
	#preview{
	border: 0px;
	width:80px;
	height:30px;
	background-color:white;
	}
	#save{
	border: 0px;
	width:80px;
	height:30px;
	background-color: #712E08;
	color: white;
	}
	#cancel{
	border: 0px;
	width:80px;
	height:30px;
	background-color:white;
	}
</style>
</head>
<body>
<!-- form action 보내는 경우 -->

<!-- 타이틀 -->
<div id="title">동아리 소식</div>
<table id="title_line" width="100%" height="20px" border="0">
<tr><td style="background-color: #5D5D5D" width="30%"></td><td width="70%" style="background-color: #BDBDBD"></td></tr>
</table><br><br>

<!-- 글쓰기  -->
<div style="background-color:rgb(231,230,230); padding:20px; width:94%; height:500px;"><!-- 배경상자 -->
<!-- 폼 -->
<form name="myform" method="POST" action="db_fleemarket.jsp">
<input type="text" name="title" id="title_" style="border: 0.5px solid grey; width: 97%; align-self: center" placeholder="제목을 입력하세요..">
<br><br>
<textarea name="content" id="content_" style="border: 0.5px solid grey; width: 97%; height:400px; resize:none; top:0px;" placeholder="내용을 입력하세요.."></textarea>
<br><br>
<!-- 버튼 3개 -->
<center>
<input type="button" name="preview" id="preview" value="미리보기" onclick="window.open('./preview_fleemarket.jsp?ver=0.1','mypreview','width=800, height=700')">
<input type="submit" name="save" id="save" value="수정하기">
<input type="button" name="cancel" id="cancel" value="취소">
</center>
</form>
</body>
</html>                                                                                