<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%request.setCharacterEncoding("utf-8");%>
<%
if(session.getAttribute("username") != null ){
    if(request.getParameter("username")!=null){

	sql = "UPDATE `member` SET `sex` = '"+request.getParameter("gender")+"',`email` = '"+request.getParameter("location")+"',`phone` = '"+request.getParameter("phone")+"',`member_name` = '"+request.getParameter("name")+"',`member_password`= '"+request.getParameter("password")+"' WHERE member_account = '"+request.getParameter("username")+"' ";
	con.createStatement().executeUpdate(sql);	
	con.close();//結束資料庫連結
	out.print("<script>alert('更新成功 ! ');location.href='index.jsp'</script>");
	}
	else{
	  con.close();//結束資料庫連結	
	  out.print("<script>alert('更新失敗! ');location.href='setup.jsp'</script>");
	}
}
else{
	con.close();//結束資料庫連結
	out.print("<meta http-equiv='refresh' content='3; url=log in.jsp'>");
}

%>

