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
	
	int result = userDAO.login(userID, userPassword);
	
	UserDTO userInfo = userDAO.getUser(userID);
	
	if(result == 1) {
		session.setAttribute("userID", userID);
		session.setAttribute("userFirstName", userInfo.getUserFirstName());
		session.setAttribute("userSecondName", userInfo.getUserSecondName());
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("location.href = 'home.jsp';");
		writer.println("</script>");
		writer.close();
		return;
	} else if(result == 0) {
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('비밀번호가 일치 하지 않습니다.');");
		writer.println("history.back()");
		writer.println("</script>");
		writer.close();
	}  else if(result == -1) {
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('존재하지 않는 아이디 입니다. 계정을 만들어 주세요');");
		writer.println("history.back()");
		writer.println("</script>");
		writer.close();
	}  else if(result == -2) {
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('데이테베이스 오류가 발생 하였습니다.');");
		writer.println("history.back()");
		writer.println("</script>");
		writer.close();
	}
%>