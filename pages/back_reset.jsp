<%@page import = "java.sql.*"%>
<%@page language="java" contentType="text/html"  pageEncoding="UTF-8"%>	

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

                <li><a href="response.jsp" class="meau_choice">回饋表單意見</a></li>

            </div>

            <div class="meau_right">
                <form action="logout.jsp" method="POST">
                <li><button type="submit" class="btnlog">登出</button></li>
                </form>
            </div>
        
        </ul>

    </div>

    <form action="resetproduct.jsp">
    <h1 class="title2" style="text-align:center">產品修改</h1>
    <div style="width:100%">

        <div class="list" style="width:100%;text-align:center">
            選擇產品：
            <select name="goods">
				
				<%
				Class.forName("com.mysql.jdbc.Driver");
                String url="jdbc:mysql://localhost/?serverTimezone=UTC";
                Connection con=DriverManager.getConnection(url,"root","1234");
                String sql="use demo";
                con.createStatement().execute(sql);
                String sql1 = "SELECT `name` FROM `product`";
                ResultSet rs1 =con.createStatement().executeQuery(sql1);
				int i=1;
				%>	
				<%
                while(rs1.next()){%>
                    out.print("<option value='<%=rs1.getString(i)%>'><%=rs1.getString(i)%></option>");
			    <%}%>   
				<%con.close();
                %>
			  
                </select><br>
        
        </div>

    </div>

    <div class="btn-group">

        <input type="submit" value="修改" class="btn" />
        <input type="reset" value="重設" class="btn" />
    
    </div>
    </form>
</body>
</html>