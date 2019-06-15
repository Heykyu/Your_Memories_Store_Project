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
		script.println("alert('�α����� ���ּ���');");
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
			script.println("alert('������ �Ϸ�Ǿ����ϴ�.');");
			script.println("location.href = 'home.jsp'");
			script.println("</script>");
			script.close();
			return;	
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�����ͺ��̽� ������ �߻� �Ͽ����ϴ�.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;	
		}
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('������ �ۼ��� �۸� ���� �����մϴ�!');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;	
	}
%>