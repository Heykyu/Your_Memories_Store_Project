<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.UserDTO" %>
<%@ page import="model.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPassword = null;
	if(request.getParameter("userID") != null)
		userID = request.getParameter("userID");
	if(request.getParameter("userPassword") != null)
		userID = request.getParameter("userPassword");
	
	UserDAO userDAO = UserDAO.getInstance();
	
	int result = userDAO.login(userID, userPassword);
	
	if(result == 1) {
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('회원가입 성공');");
		writer.println("location.href = 'index.jsp';");
		writer.println("</script>");
		writer.close();
		return;
	}
%>