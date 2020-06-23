<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="board.ReviewBoardDAO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="board" class="board.Board" scope="page" />
<jsp:setProperty name="board" property="title" />
<jsp:setProperty name="board" property="content" />


<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="id" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�����ı� ��񿬵� ������ </title>
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
			if(board.getTitle()==null)
			{
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('������ �Է����ּ���')");
				script.println("history.back()");
				script.println("</script>");
			}
			else if(board.getContent()==null){
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('������ �Է����ּ���')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				ReviewBoardDAO reviewboardDAO= new ReviewBoardDAO();
				UserDAO userDAO = new UserDAO();
				
				int result=reviewboardDAO.write(board.getTitle(),board.getContent(),userId);				

				if(result==-1){			//�����ͺ��̽� ����
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('�۾��⿡ �����Ͽ����ϴ�.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else{
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('�۾��Ⱑ ���������� �Ϸ�Ǿ����ϴ�.')");
					script.println("location.href='review_list_name.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>