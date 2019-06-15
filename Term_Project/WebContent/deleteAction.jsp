<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="model.UserDAO" %>
<%@ page import="file.FileDAO" %>
<%@ page import="likey.LikeyDTO" %>
<%@ page import="java.io.PrintWriter" %>

<%
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String)session.getAttribute("userID");
	}
		
	
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요');");
		script.println("location.href = 'userLogin.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	
	request.setCharacterEncoding("UTF-8");
	String pictureID = null;
	
	if(request.getParameter("pictureID") != null) {
		pictureID = request.getParameter("pictureID");
	}
	
	FileDAO fileDAO = new FileDAO();
	
	if(userID.equals(fileDAO.getUserID(pictureID))) {
		int result = new FileDAO().delete(pictureID);
		if(result == 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('삭제가 완료되었습니다.');");
			script.println("location.href = 'home.jsp'");
			script.println("</script>");
			script.close();
			return;	
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생 하였습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;	
		}
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('본인이 작성한 글만 삭제 가능합니다!');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;	
	}
%>