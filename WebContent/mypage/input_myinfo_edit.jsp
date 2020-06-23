<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>회원정보변경</title>
<style type="text/css">
@import url('../Css/text.css');

@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:400,700&subset=korean');
@import url('https://fonts.googleapis.com/css?family=Gaegu:400,700&subset=korean');

#info {
   border: 0px;
   margin-top: 10px;
   margin-bottom: 10px;
   margin-left: 10px;
   width: 60%;
   height: 200px;
}

#info tr {
   border-collapse: collapse;
   border-spacing: 0px;
}

#info #vertical {
   opacity: 0.8;
   font-weight: bold;
   border-collapse: collapse;
   border-spacing: 0px;
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
         script.println("location.href('input_login.html')");
         script.println("</script>");
      }

      User user = new UserDAO().getUser(userId);
   %>

	<div class="GG">마이페이지 > 회원 정보 변경</div>
	<hr color="gray" size="2">
  
      <form name="info_edit" method="post" action="db_edit_myinfo.jsp">
         <table id="info">
            <tr>
               <td width="30%" id="vertical">ID</td>
               <td style="padding-left: 10px;"><%=user.getId()%></td>
            </tr>
            <tr>
               <td id="vertical">비밀번호</td>
               <td style="padding-left: 10px;"><input type="text" name="pw" value="<%=user.getPw()%>"></td>
            </tr>
            <tr>
               <td id="vertical">이름</td>
               <td style="padding-left: 10px;"><input type="text" name="name" value="<%=user.getName()%>"></td>
            </tr>
            <tr>
               <td id="vertical">성별</td>
               <td style="padding-left: 10px;"><%=user.getGender()%></td>
            </tr>
            <tr>
               <td id="vertical">생년월일</td>
               <td style="padding-left: 10px;">
			   <input type="text" value="<%=user.getYear()%>" readonly size="3">년
               <input type="text" value="<%=user.getMonth()%>" readonly size="1">월
               <input type="text" value="<%=user.getDate()%>" readonly size="1">일
				</td>
            </tr>
         </table>
         <hr color="gray"><br>
         <center>
		 	<input type="button" id="terminate"class="btn btn-primary" value="회원 탈퇴" onclick="location.href='db_terminate.jsp'">
         	<input type="button" name="cancel" id="cancel" class="btn btn-secondary" onclick="history.back()" value="취소">
         	<input type="submit" id="edit" class="btn btn-success" value="수정하기">
		 </center>
      </form>
      
	<br>
	
	<br>
</body>
</html>