<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="board.ReviewBoardDAO"%>
<%@ page import="board.Board"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�����ı� ���� ������ </title>
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
			
			int postId=0;
			if(request.getParameter("postId") != null){
				postId=Integer.parseInt(request.getParameter("postId"));
			}
			if(postId==0){
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('��ȿ���� ���� ���Դϴ�.')");
				script.println("location.href='review_list_name.jsp'");
				script.println("</script>");
			}
			
			//�ۼ��ڿ� ����ڰ� ��ġ�����ʴ� ���
			Board board = new ReviewBoardDAO().getBoard(postId);
			
			if(!userId.equals(board.getUserId())){
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('������ �����ϴ�.')");
				script.println("location.href='review_list_name.jsp'");
				script.println("</script>");
			}else{
	
				ReviewBoardDAO boardDAO= new ReviewBoardDAO();
					int result=boardDAO.delete(postId);				

					if(result==-1){			//�����ͺ��̽� ����
						PrintWriter script=response.getWriter();
						script.println("<script>");
						script.println("alert('�� ������ �����Ͽ����ϴ�.')");
						script.println("history.back()");
						script.println("</script>");
					}
					else{				//�۾��� ����
					//	session.setAttribute("userId",user.getId());
						PrintWriter script=response.getWriter();
						script.println("<script>");
						script.println("alert('�ۻ����� ���������� �Ϸ�Ǿ����ϴ�.')");
						script.println("location.href='review_list_name.jsp'");
						script.println("</script>");
					}
				}
	
			
		}
	%>
</body>
</html>