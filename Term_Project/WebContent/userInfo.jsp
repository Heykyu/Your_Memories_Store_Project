<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
function bs_input_file() {
	$(".input-file").before(
		function() {
			if ( ! $(this).prev().hasClass('input-ghost') ) {
				var element = $("<input type='file' class='input-ghost' style='visibility:hidden; height:0'>");
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
						<a href="./home.jsp">HOME</a>
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
	
	<div class="container" style="margin-top: 60px;">
<div class="col-md-8 col-md-offset-2">
    <h3>File Input</h3>
<form method="POST" action="#" enctype="multipart/form-data">
	<!-- COMPONENT START -->
	<div class="form-group">
		<div class="input-group input-file">
			<span class="input-group-btn">
        		<button class="btn btn-default btn-choose" type="button">Choose</button>
    		</span>
    		<input type="text" class="form-control" placeholder='Choose a file...' />
    		<span class="input-group-btn">
       			 <button class="btn btn-warning btn-reset" type="button">Reset</button>
    		</span>
		</div>
	</div>
	
	<div class="form-group">
		<label for="email" class="col-sm-2 control-label">Comment</label>
		<div class="col-sm-10">
			<textarea class="form-control" rows="5" name="comment"></textarea>
		</div>
	</div>
	<!-- COMPONENT END -->
	<div class="form-group">
		<button type="submit" class="btn btn-primary pull-right" disabled>Submit</button>
		<button type="reset" class="btn btn-danger">Reset</button>
	</div>
</form>
        
        
</div>
</div>

</body>
</html>