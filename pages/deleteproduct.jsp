<%@page import = "java.sql.*"%>
<%@page language="java" contentType="text/html"  pageEncoding="UTF-8"%>	

<html>
<head>
<title>刪除產品</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8");%>
<%
            Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost/?serverTimezone=UTC";
            Connection con=DriverManager.getConnection(url,"root","1234");
			String sql="USE demo";
			con.createStatement().execute(sql);
			String i = request.getParameter("goods");
			sql = "DELETE FROM `product` WHERE `name`='"+i+"'";
		    con.createStatement().executeUpdate(sql);
            con.close();
			out.print("<script>alert('刪除成功！');location.href='back_delete.jsp'</script>");
		   
%>
</body>
</html>