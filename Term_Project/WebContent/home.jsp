<%@page import="file.FileDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="model.UserDAO" %>
<%@ page import="model.UserDTO" %>
<%@ page import="file.FileDAO" %>
<%@ page import="file.FileDTO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Photo`s site</title>
<!-- 제이쿼리 넣기 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<!-- 이미지 hover -->
<link rel="stylesheet" href="./css/homeImageHover.css">



<!-- 좋아요 모양 -->

<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- 부트스트랩 넣기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="./css/bootstrap-theme.min.css">



<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="./js/bootstrap.min.js"></script>
</head>
<%
	ArrayList<FileDTO> fileList = new ArrayList<FileDTO>();


	if(session.getAttribute("userID") == null){
		PrintWriter wripter = response.getWriter();
		
		wripter.println("<script>");
		wripter.println("alert('로그인을 먼저 해주세요!');");
		wripter.println("location.href='userLogin.jsp';");
		wripter.println("</script>");
		wripter.close();
	}

	UserDTO userDAO = new UserDAO().getUser((String)session.getAttribute("userID"));
	UserDAO userProfile = new UserDAO();
%>
<body>
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="./home.jsp">
					<span class="glyphicon glyphicon glyphicon-camera" aria-hidden="ture"></span>
				</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
				<ul class="nav navbar-nav">
					<li>
						<a href="home.jsp">HOME</a>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
							USER
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu" role="menu">
							<li>
								<a href="./userInfo.jsp">사진 올리기</a>
							</li>
							<li>
								<a href="./userUpdate.jsp">Edit profile</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="./userLogout.jsp">Log-out</a>
							</li>
						</ul>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
							SETTING
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu" role="menu">
							<li>
								<a href="userSignup.jsp">Sign-Up</a>
							</li>
							<li>
								<a href="#">Web Info</a>
							</li>
							<li>
								<a href="#">Something else here</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="#">Separated link</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<section class="jumbotron text-center">
		<div class="container">
		<img src=<%= userProfile.getProfile((String) session.getAttribute("userID"))%> alt="Avatar" style="max-width: 100%; height: 400px;">
			<h2 class="jumbotron-heading"><%= userDAO.getUserSecondName() %> <%= userDAO.getUserFirstName() %></h2>
			<p class="lead text-muted"><%=session.getAttribute("userID") %></p>
		</div>
	</section>
	
	
	<div class="containerImg" id="containerImgBox">
		<%
			fileList = new FileDAO().getPhotoListById();
				
				if(fileList != null) 
					for(int i = 0; i < fileList.size(); i++) {
						FileDTO fileDTO = fileList.get(i);
					
		%>
		
		
			<div class="box">
				<div class="imgBox">
					<img src=<%= fileDTO.getFileName() %>>
				</div>
				<div class="details">
					<div class="content">
						<h2><%= fileDTO.getUserID() %></h2>
						<p><%= fileDTO.getComment() %></p>
					</div>
				</div>
			</div>
		
		
		<%
					}
				
		%>
	</div>
	
</body>
</html>