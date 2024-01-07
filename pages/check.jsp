<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>

<%
if(request.getParameter("username") !=null && !request.getParameter("username").equals("") 
	&& request.getParameter("password") != null && !request.getParameter("password").equals("")){
    
    //sql= "SELECT * FROM `member` WHERE `member_account`='" +request.getParameter("username") + 
	      //"'  AND `member_password`='" + request.getParameter("password") + "'"  ;

	sql= "SELECT * FROM `member` WHERE `member_account`=? AND `member_password`=?";
	//' OR 1=1; #
	// out.println(sql);
	// out.close();
	PreparedStatement pstmt = null;
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1,request.getParameter("username"));
	pstmt.setString(2,request.getParameter("password"));

	//ResultSet rs =con.createStatement().executeQuery(sql);
	ResultSet rs =pstmt.executeQuery();
    if(rs.next())
	{
		int id = rs.getInt(1);
		// 這邊已經把管理者帳號密碼連結進入會員資料庫，只要輸入的帳號密碼在資料庫的id為1，就會以管理者身份登入
		if(id==1)
		{
			// 如果要登入到管理者頁面記得改連結
			out.print("<script>alert('管理者登入成功');location.href='back_manage.jsp'</script>");
			con.close();			
		}
		else {
			session.setAttribute("username",request.getParameter("username"));
			session.setAttribute("access","y");
			con.close();//結束資料庫連結
			out.print("<script>alert('登入成功 ! ');location.href='index.jsp'</script>");
		}
    }
    else{
		con.close();//結束資料庫連結
        out.print("<script>alert('登入失敗 ! 帳號或密碼不符 ! ');location.href='login.jsp'</script>");
	}
}
else{
	out.print("<script>alert('帳號或密碼不能為空 ! ');location.href='login.jsp'</script>");
}
%>


		   

			