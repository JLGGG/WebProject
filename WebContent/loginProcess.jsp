<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="user.UserDB" %>
<%@ page import="user.User" %>		
<% request.setCharacterEncoding("utf-8"); %>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="utf-8">
<title>로그인 페이지</title>
</head>

<body>
<%

	User user=new User(request.getParameter("id"), request.getParameter("pw"));
	UserDB instance= new UserDB();
	
	int result=instance.login(user.getId(),user.getPw());
	
	if(result==1){			
		session.setAttribute("userId", user.getId());
	    out.println("<script>alert('로그인 되셨습니다.')</script>");
	    out.println("<script>location.href='./main.jsp'</script>");
	}
	else if(result==0){				
		out.println("<script>alert('비밀번호를 다시 입력해주세요.')</script>");
	    out.println("<script>history.back();</script>");
	}
	else if(result==-1){				
		out.println("<script>alert('존재하지 않는 ID입니다.')</script>");
	    out.println("<script>history.back();</script>");
	}
	else if(result==-2){				
		out.println("<script>alert('DB 오류가 발생했습니다. 잠시 후에 다시 로그인해주세요.')</script>");
	    out.println("<script>history.back();</script>");
	}
%>
</body>
</html>
