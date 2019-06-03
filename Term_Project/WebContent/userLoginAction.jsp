<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.UserDTO" %>
<%@ page import="model.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="util.SHA256" %>

<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPassword = null;
	String userFirstName = null;
	String userSecondName = null;
	
	if(request.getParameter("userID") != null)
		userID = request.getParameter("userID");
	if(request.getParameter("userPassword") != null)
		userPassword = request.getParameter("userPassword");
	if(request.getParameter("first_name") != null)
		userFirstName = request.getParameter("first_name");
	if(request.getParameter("last_name") != null)
		userSecondName = request.getParameter("last_name");
	
	UserDAO userDAO = new UserDAO();
	
	int result = userDAO.insertMember(new UserDTO(userID, userPassword, userFirstName, userSecondName,
			false, SHA256.getSHA256(userID)));
	
	if(result == 1) {
		session.setAttribute("userID", userID);
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("location.href = 'emailSendAction.jsp';");
		writer.println("</script>");
		writer.close();
		return;
	} else if(result == -1) {
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('회원가입 실패');");
		writer.println("</script>");
		writer.close();
	}
%>