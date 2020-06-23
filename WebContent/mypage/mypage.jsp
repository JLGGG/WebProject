<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javax.servlet.RequestDispatcher"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mypage</title>
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>

<%
   request.setCharacterEncoding("UTF-8");
   String url = request.getParameter("url");
%>

<style type="text/css">
@import url('../Css/text.css');
@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:400,700&subset=korean');
@import url('https://fonts.googleapis.com/css?family=Gaegu:400,700&subset=korean');

.circle {                                
  width: 150px;                              
  height: 150px;                            
  background: #FFFFFF;        
  border: 5px solid #4374D9;                   
  border-radius: 100px;     
  text-align: center;    
  margin : 50px;            
} 

</style>


<%
      String userId = null;

      if (session.getAttribute("userId") != null) {
         userId = (String) session.getAttribute("userId");
      }
%>

<!-- <body style="overflow-x: hidden"> -->
<body>
	<div class="GG">마이 페이지</div>
	<hr color="gray" size="2">
	
	<table id="mypage" align="center">
	<tr style="text-align: center;">
		<td>
			<input type="button" class="circle" value="내가 쓴 글 보기" style="font-family: 'Noto Serif KR', sans-serif;"
				onclick="location.href='mylist.jsp'">
		</td>
		<td>
			<input type="button" class="circle" value="회원 정보 변경" style="font-family: 'Noto Serif KR', sans-serif;"
			 	onclick="location.href='input_myinfo_edit.jsp'">
		</td>
		<td>
			<input type="button" class="circle" value="장바구니" style="font-family: 'Noto Serif KR', sans-serif;"
				onclick="location.href='../Board/fleemarket/cart.jsp'">
		</td>
		<td>
			<input type="button" class="circle" value="쪽지함" style="font-family: 'Noto Serif KR', sans-serif;"
				onclick="location.href='../Letter/letter_recieve_list.jsp'">
		</td>
	</tr>
	</table>

</body>
</html>