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
    <link rel="stylesheet" href="../assets/css/register.css">
	<style>
        body {
            background-image: url('../assets/css/123.jpg');
            background-size: 100% ;
			background-position: center 50%;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>

	<div class="container">
	 
		<div class="row">
			<div class="block">
			<form class="register" method="get" action="addmenber.jsp">
			<h1>會員註冊</h1>			
					<div class="error" style="display: none;">
						<p></p>
					</div>
					<div class="username">
						<p>帳號</p>
						<input id="username" type="text"  placeholder="username" name="username"/>
					</div>
					<div class="password">
						<p>密碼</p>
						<input id="password" type="password"  placeholder="password" name="password"/>
					</div>
					<div class="name">
						<p>姓名</p>
						<input id="name" type="name"  placeholder="name" name="name"/>
					</div>
					<div class="phone">
						<p>電話</p>
						<input id="phone" type="phone"  placeholder="phone" name="phone"/>
					</div>
					<div class="email">
						<p>電子郵件</p>
					<div><input type="email" id="location" name="location" required="required" placeholder="電子郵件" ></div>
					</div>
					<div class="sex">
						<p>性別</p>
						<input id="sex" type="sex"  placeholder="sex" name="sex"/>
					</div>
					<div class="button">
						<input class="loginbutton" type="submit" value="註冊完成，去購物"/>							
						
					</div>
			</form>	
			<a href="login.jsp">
				<input class="loginbutton" type="submit" value="已有會員，去登入"/>
			</a>
			<a href="index.jsp">
				<input class="loginbutton" type="submit" value="取消"/>
			</a>
			</div>
		</div>	
	</div>
</body>
</html>