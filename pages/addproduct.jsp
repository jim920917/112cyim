<%@page import = "java.sql.*"%>
<%@page language="java" contentType="text/html"  pageEncoding="UTF-8"%>	

<html>
<head>

<title>產品新增</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8");%>
<%          
			String img = request.getParameter("img");
			String name = request.getParameter("name");
			String price = request.getParameter("price");
			String amount = request.getParameter("amount");
			String introduce = request.getParameter("introduction");
			String img01 = request.getParameter("img01");
			String img02 = request.getParameter("img02");
			String img03 = request.getParameter("img03");
			String img04 = request.getParameter("img04");
			String img05 = request.getParameter("img05");
	
			if(img=="")
			{
				out.print("<script>alert('新增失敗！圖片路徑不能為空!請重新輸入');location.href='back_new.jsp'</script>");
				return;
			}
			if(name=="")
			{
			 out.print("<script>alert('新增失敗！產品名稱不能為空!請重新輸入');location.href='back_new.jsp'</script>");
				return;
			}			
			if(price=="")
			{
			 out.print("<script>alert('修改失敗！產品價格不能為空!請重新輸入');location.href='back_new.jsp'</script>");
				return;
			}
			if(amount=="")
			{
				 out.print("<script>alert('修改失敗！產品庫存不能為空!請重新輸入');location.href='back_new.jsp'</script>");
				return;
			}
			if(introduce=="")
			{
				 out.print("<script>alert('修改失敗！產品介紹不能為空!請重新輸入');location.href='back_new.jsp'</script>");
				return;
			}
			if(img01=="")
			{
				out.print("<script>alert('新增失敗！圖片路徑不能為空!請重新輸入');location.href='back_new.jsp'</script>");
				return;
			}
			if(img02=="")
			{
				out.print("<script>alert('新增失敗！圖片路徑不能為空!請重新輸入');location.href='back_new.jsp'</script>");
				return;
			}
			if(img03=="")
			{
				out.print("<script>alert('新增失敗！圖片路徑不能為空!請重新輸入');location.href='back_new.jsp'</script>");
				return;
			}
			if(img04=="")
			{
				out.print("<script>alert('新增失敗！圖片路徑不能為空!請重新輸入');location.href='back_new.jsp'</script>");
				return;
			}
			if(img05=="")
			{
				out.print("<script>alert('新增失敗！圖片路徑不能為空!請重新輸入');location.href='back_new.jsp'</script>");
				return;
			}
           Class.forName("com.mysql.jdbc.Driver");
           String url="jdbc:mysql://localhost:3306/?serverTimezone=UTC";
           Connection con=DriverManager.getConnection(url,"root","1234");
           String sql="USE demo";
           con.createStatement().execute(sql);
			String sql1 = "INSERT INTO `product`(`img`,`name`,`price`,`amount`,`introduction`,`img01`,`img02`,`img03`,`img04`,`img05`) "+"values('"+img+"','"+name+"','"+price+"','"+amount+"','"+introduce+"','"+img01+"','"+img02+"','"+img03+"','"+img04+"','"+img05+"')";

           con.createStatement().executeUpdate(sql1);
           out.print("<script>alert('新增成功');location.href='back_new.jsp'</script>)");
       
		   con.close();
%>

</body>
</html>