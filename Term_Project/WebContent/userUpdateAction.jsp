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
	if(request.getParameter("userFirstName") != null)
		userFirstName = request.getParameter("userFirstName");
	if(request.getParameter("userSecondName") != null)
		userSecondName = request.getParameter("userSecondName");
	
	UserDAO userDAO = new UserDAO();
	
	int result = userDAO.update(userID, userPassword, userFirstName, userSecondName);
	
	if(result == 1) {
		PrintWriter writer = response.getWriter();
		session.setAttribute("userID", userID);
		writer.println("<script>");
		writer.println("alert('회원 정보가 수정 되었습니다.')");
		writer.println("location.href = 'home.jsp';");
		writer.println("</script>");
		writer.close();
		return;
	} else if(result == 0) {
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('수정 중에 오류가 발생 하였습니다..');");
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