<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ page import="model.UserDTO" %>
<%@ page import="model.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>


<html>
<%
	String userID = null;

	if(session.getAttribute("userID") != null) {
		System.out.println("세션값이 널이 아닙니다.");
		userID = (String) session.getAttribute("userID");
	} else if(session.getAttribute("userID") == null)
		System.out.println("세션값이 널입니다.");
	if(userID == null) {
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		writer.println("alert('로그인이 되어있지 않습니다 로그인을 해주세요.');");
		writer.println("location.href = 'userLogin.jsp';");
		writer.println("</script>");
		writer.close();
	}
	UserDTO user = new UserDAO().getUser(userID);	
%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
<title>Bootstrap Simple Registration Form</title>
<!-- 제이쿼리 넣기 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- 부트스트랩 넣기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="./css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="./js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>
<link rel="stylesheet" href="./css/userSignUp.css">

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
						<a href="home.jsp">HOME</a>
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
						<a href="userLogin.jsp">LOGIN</a>
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
<div class="signup-form">
    <form action="./userUpdateAction.jsp" method="post">
		<h2>Modify</h2>
		<p class="hint-text">Modify your account. It's free and only takes a minute.</p>
        
        <div class="form-group">
        	<%= user.getUserID() %>
        	
        	<input type="hidden" class="form-control" name="userID" value="<%= user.getUserID() %>">
        </div>
        <div class="form-group">
			<div class="input-group input-file">
				<span class="input-group-btn">
        			<button class="btn btn-default btn-choose" type="button">Profile Choose</button>
    			</span>
    			<input type="text" class="form-control" disabled placeholder='Choose a file...' />
			</div>
		</div>
		<div class="form-group">
            <input type="password" class="form-control" name="userPassword" placeholder="Password" required="required">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="userFirstName" placeholder="Your First Name" required="required">
        </div>      
        <div class="form-group">
            <input type="text" class="form-control" name="userSecondName" placeholder="Your Second Name" required="required">
        </div>              
        <div class="form-group">
			<label class="checkbox-inline"><input type="checkbox" required="required"> I accept the <a href="#">Terms of Use</a> &amp; <a href="#">Privacy Policy</a></label>
		</div>
		<div class="form-group">
            <button type="submit" class="btn btn-success btn-lg btn-block">Modify Now</button>
        </div>
    </form>
	<div class="text-center">Already have an account? <a href="userLogin.jsp">Sign in</a></div>
</div>
<script type="text/javascript">
function bs_input_file() {
	$(".input-file").before(
		function() {
			if ( ! $(this).prev().hasClass('input-ghost') ) {
				var element = $("<input type='file' class='input-ghost'id='imgInput' style='visibility:hidden; height:0'>");
				element.attr("name",$(this).attr("name"));
				element.change(function(){
					element.next(element).find('input').val((element.val()).split('\\').pop());
				});
				$(this).find("button.btn-choose").click(function(){
					element.click();
				});
				$(this).find("button.btn-reset").click(function(){
					element.val(null);
					$(this).parents(".input-file").find('input').val('');
				});
				$(this).find('input').css("cursor","pointer");
				$(this).find('input').mousedown(function() {
					$(this).parents('.input-file').prev().click();
					return false;
				});
				return element;
			}
		}
	);
}
$(function() {
	bs_input_file();
});
</script>
</body>
</html>                            