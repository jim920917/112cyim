<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="IE=edge; charset=UTF-8">
<title>登入登出確認</title>
</head>
<body>
<%
if(session.getAttribute("access")==null)
	out.print("<a href='login.jsp'>登入/註冊</a>");
else
	out.print("<a href='logout.jsp'>登出</a>");
%>
</body>
</html>