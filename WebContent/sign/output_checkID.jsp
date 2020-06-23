<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="user" class="user.User" scope="page" />
<%
	String newid = request.getParameter("newid");
	UserDAO userDAO = new UserDAO();
	int result = userDAO.checkID(newid);
%>
<%=result%>