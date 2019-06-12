<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="model.UserDTO" %>
<%@ page import="model.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="util.SHA256" %>

<%
	request.setCharacterEncoding("UTF-8");

	boolean isMulti = ServletFileUpload.isMultipartContent(request);
	String directory = application.getRealPath("/profile/");
	
	int maxSize = 1024 * 1024 * 100;
	
	String encoding = "UTF-8";
	
	if(isMulti) {
		MultipartRequest multi = new MultipartRequest(request, directory, maxSize, encoding);
		
		String userID = multi.getParameter("userID");
		String userPassword = multi.getParameter("userPassword");
		String userFirstName = multi.getParameter("userFirstName");
		String userSecondName = multi.getParameter("userSecondName");
		String userProfile = multi.getFilesystemName("userProfile");
		
		UserDAO userDAO = new UserDAO();
		
		int result = userDAO.update(userID, userPassword, userFirstName, 
				userSecondName, userProfile);
		
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
	}
%>