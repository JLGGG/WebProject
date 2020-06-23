<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="letter.LetterDAO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="letter" class="letter.Letter" scope="page" />
<jsp:setProperty name="letter" property="content" />

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="id" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ��񿬵�</title>
</head>
<body>
<%
		//���� �̿����� ���̵� userId
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
		
		//�α����� ����
		else{
					
			//�ʼ� �Է� �׸� Ȯ�� ������, �۳���
			if(letter.getContent()==null)
			{
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('������ �Է����ּ���')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				LetterDAO letterDAO = new LetterDAO();
				UserDAO userDAO = new UserDAO();
				String recvId = request.getParameter("recvId");
				int result=letterDAO.add_letter(recvId, userId, letter.getContent());//recvId, sendId, content				

				if(result==-1){			//�����ͺ��̽� ����
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('�������ۿ� �����Ͽ����ϴ�.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else{
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('���������� ���������� �Ϸ�Ǿ����ϴ�.')");
					script.println("location.href='send_letter.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>