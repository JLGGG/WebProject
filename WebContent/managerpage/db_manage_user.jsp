<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ���� ���� ��� ���� ������</title>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO();
	
		int result=0;
		String level="";
		
		UserDAO boardDAO = new UserDAO();
		ArrayList<User> list = boardDAO.getUserList();

		for (int i = 0; i < list.size(); i++) {
			level=request.getParameter("level_"+i);
			
			//���� �ٸ� level�� ������ ������Ʈ
			if(!list.get(i).getLevel().equals(level))
				result=userDAO.level_update(list.get(i).getId(),level);
			
			if((request.getParameter("level_"+i).equals(null))||(request.getParameter("level_"+i).equals(""))){
				result=3;
				break;
			}
		}
		
		if(result==-1){			//�����ͺ��̽� ����
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('�� ������ �����Ͽ����ϴ�.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result==3){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('����� �Է����ּ���.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else{				//�������� ����
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('��� ������ ���������� �Ϸ�Ǿ����ϴ�.')");
			script.println("location.href='manage_user.jsp'");
			script.println("</script>");
		}
	%>
</body>
</html>