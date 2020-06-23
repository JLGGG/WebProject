<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="comment.CommentReviewDAO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="comment" class="comment.Comment" scope="page" />
<jsp:setProperty name="comment" property="content" />

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="id" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խù� ��� ��񿬵�</title>
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
			if(comment.getContent()==null)
			{
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('������ �Է����ּ���')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				CommentReviewDAO commentDAO = new CommentReviewDAO();
				UserDAO userDAO = new UserDAO();
				String comment_board_str = request.getParameter("comment_board");
				int comment_board = Integer.parseInt(comment_board_str);
				int result=commentDAO.add_comment(comment_board, userId, comment.getContent());//�۹�ȣ,�ۼ���,����				

				if(result==-1){			//�����ͺ��̽� ����
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('����ۼ��� �����Ͽ����ϴ�.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else{
					PrintWriter script=response.getWriter();
					script.println("<script>");
					script.println("alert('����ۼ��� ���������� �Ϸ�Ǿ����ϴ�.')");
					script.println("location.href='output_review_Write.jsp?postId="+ comment_board + "'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>