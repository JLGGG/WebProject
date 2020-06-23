<!-- 
이 페이지는 미리보기 페이지이니까 서버랑 연결할 필요가 없음
미리보기 버튼 누르면 새창에서 바로 뜨게!
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>동아리 소식 미리보기 페이지</title>
<style type="text/css">
	@import url('../../../Css/title.css');
	@import url('../../../Css/board_list.css');
	body{font-family: 맑은 고딕;}
	.right{position:relative; left:95%;}
	.line{border-bottom: 2px solid #EAEAEA;}
	a{color:black;}
</style>
</head>
<body>
<div id="title">동아리 소식</div>
<table id="title_line" width="100%" height="20px" border="0px">
<tr><td style="background-color: #5D5D5D" width="30%"></td><td width="70%" style="background-color: #BDBDBD"></td></tr>
</table><br><br>
<%    
    //제대로 utf-8환경이 아니라 한글 깨짐 그래서 임의로 추가                                                   
    request.setCharacterEncoding("utf-8");
    
    String title = request.getParameter("title");
    String content = request.getParameter("content");
 
%>
<!-- 제목 출력 테이블 -->
<table id="info" name="info" width="100%" border="0">
<tr>
<td style="width:70%"><b><%=title %></b></td>
<td style="text-align:right">작성날짜</td>
</tr>
</table>
<hr color="gray">
<!-- 여기에 작성자 이름이랑 아이콘 띄우기 -->
밤 아이콘 밤<br><br>
<!-- 안에 내용 -->
<%=content %>
<br><br>
<hr color="#BDBDBD"><br>
<!-- 이전 글 다음 글 출력 테이블 -->
<table id="bf_af" name="bf_af" width="100%" border="0" style="border-collapse: collapse;">
<tr>
<td class="line" width="15%"><a href="#이전글" style="text-decoration:none">이전글</a></td>
<td class="line" width="40%">제목</td>
<td class="line" width="15%">작성자</td>
<td class="line" width="10%">조회수</td>
<td class="line" width="20%">작성날짜</td>
</tr>
<tr>
<td width="15%"><a href="#다음글" style="text-decoration:none">다음글</a></td>
<td width="40%">제목</td>
<td width="15%">작성자</td>
<td width="10%">조회수</td>
<td width="20%">작성날짜</td>
</tr>
</table>