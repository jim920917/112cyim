<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="config.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
   	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>會員中心</title>
    <link rel="stylesheet" href="../assets/css/MemberCentre.css">
</head>
<body>
<%request.setCharacterEncoding("utf-8");%>
	<h3 class="head_text">Log in/Sign UP</h1>
	</div>
	<div class="container">
	 
		<div class="row">
			<div class="block">
			<form class="login_block" method="get" action="addmenber.jsp">
			<div class="logintitle"><h1><a href="index.jsp">WEAVES</a></h1></div>
					<div class="header">
						<h3>Sign UP</h3>
					</div>
					<div class="error" style="display: none;">
						<h3></h3>
					</div>
					<div class="username">
						<h3>Username</h3>
						<input id="username" type="text" size="35" placeholder="username" name="username"/>
					</div>
					<div class="password">
						<h3>Password</h3>
						<input id="password" type="password" size="35" placeholder="password" name="password"/>
					</div>
					<div class="name">
						<h3>name</h3>
						<input id="name" type="name" size="35" placeholder="name" name="name"/>
						<h4>姓名</h4>
					</div>
					<div class="phone">
						<h3>phone</h3>
						<input id="phone" type="phone" size="35" placeholder="phone" name="phone"/>
						<h4>電話</h4>
					</div>
					<div class="email">
						<h3>email</h3>
						<input id="email" type="email" size="35" placeholder="email" name="email"/>
						<h4>電子郵件</h4>
					</div>
					<div class="sex">
						<h3>sex</h3>
						<input id="sex" type="sex" size="35" placeholder="sex" name="sex"/>
						<h4>性別</h4>
					</div>
					<div class="button">
						<button class="loginbutton" type="submit">Submit</button>							
						<a href="index.jsp">
						<button class="loginbutton" type="submit">取消</button>
						</a>
					</div>
					
					    

			</form>				
			</div>
		</div>	
	</div>
</body>
</html>