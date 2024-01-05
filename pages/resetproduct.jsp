<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../assets/css/index.css">
    <title>產品修改</title>

    <style>
        @import url('assets/css/back.css');
        @import url(https://fonts.googleapis.com/earlyaccess/cwtexyen.css);
    </style>
</head>
<body>
        
    <div id="meau">

        <ul class="meau_area">

            <div class="meau_left">

                <li class="logo">後台管理系統</li>

                <li><a href="back_new.jsp" class="meau_choice">新增產品</a></li>
        
                <li><a href="back_delete.jsp" class="meau_choice">產品刪除</a></li>
            
                <li><a href="back_reset.jsp" class="meau_choice">產品修改</a></li>

                <li><a href="back_manage.jsp" class="meau_choice">訂單管理</a></li>                

            </div>

            <div class="meau_right">

                <li><a href="team.jsp" class="meau_choice2">登出</a></li>
            
            </div>
        
        </ul>

    </div>

    <h1 class="title2" style="text-align:center">產品修改</h1>
    
    <div style="width:100%">

        <div class="list" style="width:100%;text-align:center">

            <form class="form" action="alterproduct.jsp" method="POST">       
        
              <%
			  Class.forName("com.mysql.jdbc.Driver");
              String url="jdbc:mysql://localhost/?serverTimezone=UTC";
              Connection con=DriverManager.getConnection(url,"root","1234");
              String sql="use demo";
              con.createStatement().execute(sql);
			  String name=request.getParameter("goods");
			  String sql1 = "SELECT * FROM `product` WHERE `name`='"+name+"'";
			  ResultSet rs1 =con.createStatement().executeQuery(sql1);
			  if(rs1.next())
			  {
			  %>
		    <div>你已選擇修改商品:<input type="text" name="name" value="<%=name%>" class="text_input" size="25" readonly></div><br>
			<div>圖片路徑：<input type="text" class="text_input" value = "<%=rs1.getString(2)%>" name="img"></div><br>
			<div>產品名稱：<input type="text" class="text_input" value = "<%=rs1.getString(3)%>" name="name"></div><br>
            <div>產品價格：<input type="text" class="text_input" value = "<%=rs1.getInt(4)%>" name="price"></div><br>
			<div>產品庫存：<input type="text" class="text_input" value = "<%=rs1.getInt(5)%>" name="amount"></div><br>
			<div>產品介紹：<input type="text" class="text_input" value = "<%=rs1.getString(6)%>" name="introduction"></div><br>                            
            <%con.close();}%>
    

            <div class="btn-group">
                <input type="submit" value="修改" class="btn" >
                <input type="reset" value="重設" class="btn" >
            </div>
            </form>

        </div>
	</div>
    
</body>
</html>