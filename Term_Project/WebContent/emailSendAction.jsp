<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Properties" %>
<%@ page import="model.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="util.SHA256" %>
<%@ page import="util.Gmail" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.Authenticator" %>

<%
	UserDAO userDAO = new UserDAO();

	String userID = null;
	
	if(session.getAttribute("userID") != null)
		userID = (String) session.getAttribute("userID");
	
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href = 'userLogin.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	
	boolean emailChecked = userDAO.getUserEmailChecked(userID);
	
	if(emailChecked == true) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 인증이 된 회원입니다.');");
		script.println("location.href = 'index.html'");
		script.println("</script>");
		script.close();
		return;
	}
	
	String host = "http://localhost:8080/Term_Project/";
	String from = "yts0646@gmail.com";
	String to = userDAO.getUserIDBasedUserEmail(userID);
	String subject = "포토 웹 사이트를 이용하기 위한 이메일 인증 입니다.";
	String content = "다음 링크에 접속하여서 이메일 인증을 진행 해주세요." +
						"<a href='" + host + "emailCheckAction.jsp?code="
							+ new SHA256().getSHA256(to) +"'>이메일 인증하기</a>";
							
	Properties p = new Properties();
	p.put("mail.smtp.user", from);
	p.put("mail.smtp.host", "smtp.googlemail.com");
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
	
	try {
		Authenticator auth = new Gmail();
		
		Session ses = Session.getInstance(p, auth);
		ses.setDebug(true);
		MimeMessage msg = new MimeMessage(ses);
		msg.setSubject(subject);
		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr);
		Address toAddr = new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO, toAddr);
		msg.setContent(content, "text/html;charset=UTF8");
		Transport.send(msg);
		
	} catch(Exception e) {
		e.printStackTrace();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<!-- 제이쿼리 넣기 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- 부트스트랩 넣기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="./css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="./js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./css/loginsignin.css">
<title>Insert title here</title>
</head>
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
				<a class="navbar-brand" href="#">
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
						<a href="index.html">HOME</a>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
							USER
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu" role="menu">
							<li>
								<a href="#">UserInfo</a>
							</li>
							<li>
								<a href="#">Another action</a>
							</li>
							<li>
								<a href="#">Something else here</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="#">Log-out</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="#">One more separated link</a>
							</li>
						</ul>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li>
						<a href="#">LOGIN</a>
					</li>
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
	<div class="container">
		<div class="jumbotron">
  			<h2><span class="label label-primary">Primary</span>이메일 전송 완료</h2>
  			<div class="alert alert-info" role="alert" style="margin-top: 20px;">해당 유저 이메일로 인증 메일이 전송되었습니다.
  			유저 이메일로 들어가셔서 인증 완료를 해주세요</div>
		</div>
	</div>
	<!-- /container -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>