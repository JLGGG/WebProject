<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보변경</title>
<style>
#info {
   border: 0px;
   margin-top: 50px;
   margin-bottom: 50px;
   margin-left: 100px;
   width: 500px;
   height: 200px;
}

#info tr {
   border-collapse: collapse;
   border-spacing: 0px;
}

#info #vertical {
   border-right: 2px solid #498228;
   opacity: 0.8;
   font-weight: bold;
   border-collapse: collapse;
   border-spacing: 0px;
}


#goback{
   color: black;
   background-color: white;
      margin-top: 10px;
   width: 80px;
   height: 30px;
   border: none;
   box-shadow:1px 1px 1px dimgray;
   border-radius:5px;
}
#terminate{
   color: white;
   background-color: #498228;
      margin-top: 10px;
   width: 80px;
   height: 30px;
   border: none;
   box-shadow:1px 1px 1px dimgray;
   border-radius:5px;
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
   <center>
      <br>
      <h2>탈퇴</h2>
      <hr style="border: solid 2px #498228; opacity: 0.8; width: 70%;">
         <table id="info">
            <tr>
               <td width="30%" id="vertical">ID</td>
               <td style="padding-left: 10px;"><%=user.getId()%></td>
            </tr>
            <tr>
               <td id="vertical">비밀번호</td>
               <td style="padding-left: 10px;"><%=user.getPw()%></td>
            </tr>
            <tr>
               <td id="vertical">이름</td>
               <td style="padding-left: 10px;"><%=user.getName()%></td>
            </tr>
            <tr>
               <td id="vertical">성별</td>
               <td style="padding-left: 10px;"><%=user.getGender()%></td>
            </tr>
            <tr>
               <td id="vertical">생년월일</td>
               <td style="padding-left: 10px;"><%=user.getYear()%>년 <%=user.getMonth()%>월 <%=user.getDate()%>일</td>
            </tr>
         </table>
         <hr style="border: solid 2px #498228; opacity: 0.8; width: 70%;"><br><br>
         <h4> 정말로 탈퇴하시겠습니까? 탈퇴 시에는 ID 복구가 불가능합니다.</h4><br>
         <input type="button" id="goback" value="되돌아가기" onclick="history.back();">
         <input type="button" id="terminate" value="탈퇴하기" onclick="location.href='db_terminate.jsp'">
   </center>
</body>
</html>