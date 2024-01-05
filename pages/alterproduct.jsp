<%@page import = "java.sql.*"%>
<%@page language="java" contentType="text/html"  pageEncoding="UTF-8"%>	

<html>
<head>
<title>產品修改</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8");%>
<%          
            String img = request.getParameter("img");
			String name = request.getParameter("name");
			String price = request.getParameter("price");
			String amount = request.getParameter("amount");
			String introduce = request.getParameter("introduction");

			
		   if(img=="")
		   {
			   out.print("<script>alert('修改失敗！圖片路徑不能為空!請重新輸入');location.href='back_reset.jsp'</script>");
			   return;
		   }
		   if(name=="")
		   {
            out.print("<script>alert('修改失敗！產品名稱不能為空!請重新輸入');location.href='back_reset.jsp'</script>");
			   return;
		   }	 	   
		   if(price=="")
		   {
            out.print("<script>alert('修改失敗！產品價格不能為空!請重新輸入');location.href='back_reset.jsp'</script>");
			   return;
		   }
		   if(amount=="")
		   {
                out.print("<script>alert('修改失敗！產品庫存不能為空!請重新輸入');location.href='back_reset.jsp'</script>");
			   return;
		   }
		   if(introduce=="")
		   {
                out.print("<script>alert('修改失敗！產品介紹不能為空!請重新輸入');location.href='back_reset.jsp'</script>");
			   return;
		   }		   
           Class.forName("com.mysql.jdbc.Driver");
           String url="jdbc:mysql://localhost/?serverTimezone=UTC";
           Connection con=DriverManager.getConnection(url,"root","1234");
           String sql="use demo";
           con.createStatement().execute(sql);

           String sql1 = "UPDATE `product` SET `img`='"+img+"' WHERE`name`='"+name+"'"; 
           con.createStatement().execute(sql1); 
		   String sql2 = "UPDATE `product` SET `name`='"+name+"' WHERE`name`='"+name+"'"; 
           con.createStatement().execute(sql2);
		   String sql3 = "UPDATE `product` SET `price`='"+price+"' WHERE`name`='"+name+"'"; 
           con.createStatement().execute(sql3); 
		   String sql4 = "UPDATE `product` SET `amount`='"+amount+"' WHERE`name`='"+name+"'"; 
           con.createStatement().execute(sql4);
	       String sql5 = "UPDATE `product` SET `introduction`='"+introduce+"' WHERE`name`='"+name+"'";
	       con.createStatement().execute(sql5);

		   
	       
           out.print("<script>alert('修改成功');location.href='back_reset.jsp'</script>");
		   
		   con.close();
%>

</body>
</html>