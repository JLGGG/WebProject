<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javax.servlet.RequestDispatcher"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>관리자 페이지</title>
<style type="text/css">

@import url('../Css/text.css');
@import	url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:400,700&subset=korean');
@import	url('https://fonts.googleapis.com/css?family=Gaegu:400,700&subset=korean');

.circle {
	width: 150px;
	height: 150px;
	background: #FFFFFF;
	border: 5px solid #2F9D27;
	border-radius: 100px;
	text-align: center;
	margin: 50px;
}

</style>

<%
      String userId = null;

      if (session.getAttribute("userId") != null) {
         userId = (String) session.getAttribute("userId");
      }
%>

<body style="overflow-x: hidden">
	<div class="GG">관리자 페이지</div>
	<hr color="gray" size="2">
	
	<table id="managerpage" align="center">
		<tr style="text-align: center;">
			<td ><input type="button" class="circle" value="내가 쓴 글 보기" style="font-family: 'Noto Serif KR', sans-serif;"
				onclick="location.href='../mypage/mylist.jsp'"></td>
			<td class="NS"><input type="button" class="circle" value="회원 정보 관리" style="font-family: 'Noto Serif KR', sans-serif;"
				onclick="location.href='manage_user.jsp'"></td>
			<td class="NS"><input type="button" class="circle" value="중고마켓 거래내역" style="font-family: 'Noto Serif KR', sans-serif;"
				onclick="location.href='soldout_list.jsp'"></td>
			<td class="NS"><input type="button" class="circle" value="신고함" style="font-family: 'Noto Serif KR', sans-serif;"
				onclick="location.href='../Letter/letter_recieve_list.jsp'"></td>
		</tr>
	</table>

</body>
</html>