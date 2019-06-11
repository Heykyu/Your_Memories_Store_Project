<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="file.FileDAO"%>
<%@ page import="file.FileDTO"%>
<%@ page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userComment = null;
	String userFileName = null;
	
	System.out.println(request.getParameter("user_comment"));
	System.out.println(request.getParameter("fileName"));
	
	
	if(session.getAttribute("userID") != null)
		userID = (String) session.getAttribute("userID");
	if(request.getParameter("user_comment") != null)
		userComment = request.getParameter("user_comment");
	if(request.getParameter("fileName") != null)
		userFileName = request.getParameter("fileName");
	
	FileDAO fileDAO = new FileDAO();
	
	int result = fileDAO.upload(userID, userFileName, userComment);
	
	if(result == 1) {
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('사진이 등록 되었습니다.')");
		writer.println("location.href = 'home.jsp';");
		writer.println("</script>");
		writer.close();
		return;
	} else if(result == 0) {
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('등록 중에 오류가 발생 하였습니다..');");
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