<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="util.SHA256" %>

<%
	request.setCharacterEncoding("UTF-8");
	String code = null;
	if(request.getParameter("code") != null)
		code = request.getParameter("code");
	UserDAO userDAO = new UserDAO();
	
	String userID = null;
	
	
	if(session.getAttribute("userID") != null)
		userID = (String) session.getAttribute("userID");
	
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href = 'userLogin.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	
	String userEmail = userDAO.getUserIDBasedUserEmail(userID);
	
	boolean isRight = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;
    if(isRight ==  true) {
    	userDAO.setUserEmailChecked(userID);
    	PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('인증에 성공하였습니다.');");
		writer.println("location.href = 'index.html'");
		writer.println("</script>");
		writer.close();
    } else {
    	PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('유효 하지 않은 코드 입니다.');");
		writer.println("location.href = 'index.html'");
		writer.println("</script>");
		writer.close();
    }
%>