<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��й�ȣ �ٲٱ� ������</title>
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
			script.println("alert('�α��� �� �� �̿��� �ּ���!')");
			script.println("location.href('input_login.html')");
			script.println("</script>");
		}
		else{
			
				//�ʼ� �Է� �׸� Ȯ��
				if(request.getParameter("pw")==null)
				{
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('������ ��й�ȣ�� �Է����ּ���')");
					script.println("history.back()");
					script.println("</script>");
				}
				else{
					UserDAO userDAO= new UserDAO();
					int result=userDAO.resetPW(request.getParameter("pw"),userId);				

					if(result==-1){			//�����ͺ��̽� ����
						PrintWriter script=response.getWriter();
						script.println("<script>");
						script.println("alert('��й�ȣ ������ �����Ͽ����ϴ�.')");
						script.println("history.back()");
						script.println("</script>");
					}
					else{				//��й�ȣ ���� ����
						PrintWriter script=response.getWriter();
						script.println("<script>");
						script.println("alert('��й�ȣ ������ ���������� �Ϸ�Ǿ����ϴ�.')");
						script.println("location.href='../page/home.jsp'");
						script.println("</script>");
					}
				}
			}
	%>
</body>
</html>