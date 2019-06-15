<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="model.UserDAO" %>
<%@ page import="file.FileDAO" %>
<%@ page import="likey.LikeyDAO" %>
<%@ page import="java.io.PrintWriter" %>

<%!
	public static String getClientIP(HttpServletRequest request) {
		String ip = request.getHeader("X-FORWARDED-FOR");
		if (ip == null || ip.length() == 0) {
			ip = request.getHeader("Procxy-Client-IP");
		}
		if (ip == null || ip.length() == 0) {
			ip = request.getHeader("XL-Procxy-Client-IP");
		}
		if (ip == null || ip.length() == 0) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
%>

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
	
	int pictureID = 0;
	
	if(request.getParameter("pictureID") != null) {
		pictureID = Integer.parseInt(request.getParameter("pictureID"));
	}
	
	System.out.println("Picture ID -> "+pictureID);
	
	FileDAO fileDAO = new FileDAO();
	LikeyDAO likeyDAO = new LikeyDAO();
	
	int result = likeyDAO.like(userID, pictureID, getClientIP(request));
	
	
		if(result == 1) {
			result = fileDAO.like(pictureID);
			if(result == 1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('��õ�� �Ϸ�Ǿ����ϴ�.');");
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
			script.println("alert('�ߺ� ��õ�� �� �� �����ϴ�!');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}
%>