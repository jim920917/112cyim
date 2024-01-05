<%@ page pageEncoding="UTF-8" import="java.util.*, java.sql.*" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost/?serverTimezone=UTC";
	Connection con = DriverManager.getConnection(url,"root","1234");
	String sql = "USE `demo`";
	con.createStatement().execute(sql);
	try{
		int cancel = Integer.parseInt(request.getParameter("cancel"));		
		sql = "DELETE FROM `cart` WHERE `mem_id`='"+session.getAttribute("username")+"'AND `procer_id`='"+cancel+"'";
		con.createStatement().execute(sql);
		out.print("<script> window.location='cart.jsp'</script>");
	}			
	catch(Exception e){
		out.println(e);
		out.println(sql);
	}

%>