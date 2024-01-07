<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../assets/css/login.css">
    <title>會員中心</title>
	<style>
        body {
            background-image: url('../assets/css/123.jpg');
            background-size: 100%;
            background-repeat: no-repeat;
			filter: blur(0px);
        }
    </style>
</head>
<body>
	<form class="login" action="check.jsp" method="POST">
	<div class="error" style="display: none;">
		<h3></h3>
	</div>
        <h1>Log in 登入</h1>
        <div class="username">
			<input id="username" type="text" placeholder="username" name="username"/>
		</div>
		<div class="password">
			<input id="password" type="password" size="35" placeholder="password" name="password"/>
		</div>
        <input type="submit" class="loginbutton" value="登入"/>
		<div class="button">
		<a href="../pages/register.jsp">註冊會員^_^</a>
		<a href="../pages/index.jsp">取消</a>
		</div>
    </form>
    </nav>
</body>
</html>