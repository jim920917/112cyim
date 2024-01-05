<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <link rel="stylesheet" href="../assets/css/index.css">
    <title>訂單管理</title>

    <style>
        @import url('assets/css/back.css');
        @import url(https://fonts.googleapis.com/earlyaccess/cwtexyen.css);
    </style>
    </style>
</head>
<body>
<%request.setCharacterEncoding("utf-8");%>	
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
    <h1 class="title2" style="text-align:center">訂單管理</h1>
<%
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
            sql="USE `demo`";
            con.createStatement().execute(sql);
            String order = "SELECT * FROM `orders`";
            ResultSet rs = con.createStatement().executeQuery(order);
            while(rs.next())
            {   
                int count = rs.getInt(4);
                out.print("<div class='big'><div class='mid'>");
                out.print("<div class='list1'>");
                out.print("<div>訂單號碼："+rs.getInt(1)+"</div><br>");
                String product = "SELECT * FROM `product` WHERE `id` ='"+rs.getString(3)+"'";
                out.print("<div>產品數量："+rs.getInt(4)+"</div><br>");
                ResultSet rs2 = con.createStatement().executeQuery(product);
                while (rs2.next())
                {   
                    int price = rs2.getInt(7);
                    out.print("<div>訂單金額："+(price*count)+"</div><br>");  
                }
                String member = "SELECT * FROM `member` WHERE `member_account` ='"+rs.getString(2)+"'";
                ResultSet rs3 = con.createStatement().executeQuery(member);
                while (rs3.next())
                {   
                    out.print("<div>會員姓名："+rs3.getString(2)+"</div><br>");
                }
                out.print("<div>付款方式："+rs.getString(5)+"</div><br>");
                out.print("<div>送貨地點："+rs.getString(6)+"</div><br>");
                out.print("<div>訂購時間："+rs.getString(7)+"</div><br>");
                out.print("</div></div></div>");
            }
//Step 6: 關閉連線
            con.close();
        }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
		   
    }
}
catch (ClassNotFoundException err) {
      out.println("class錯誤"+err.toString());
}
%>

    <h1 class="title2" style="text-align:center">退貨訂單管理</h1>
<%
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
            sql="USE `demo`";
            con.createStatement().execute(sql);
            String returns = "SELECT * FROM `returns`";
            ResultSet rs = con.createStatement().executeQuery(returns);
            while(rs.next())
            {   
                int count = rs.getInt(4);
                out.print("<div class='big'><div class='mid'>");
                out.print("<div class='list1'>");
                out.print("<div>訂單號碼："+rs.getInt(1)+"</div><br>");
                out.print("<div>產品數量："+rs.getInt(4)+"</div><br>");
                String product = "SELECT * FROM `product` WHERE `id` ='"+rs.getString(2)+"'";
                ResultSet rs2 = con.createStatement().executeQuery(product);
                while (rs2.next())
                {   
                    int price = rs2.getInt(7);
                    out.print("<div>訂單金額："+(price*count)+"</div><br>");
                    out.print("<div>產品："+rs2.getString(3)+"</div><br>");
                }
                String member = "SELECT * FROM `member` WHERE `member_account` ='"+rs.getString(3)+"'";
                ResultSet rs3 = con.createStatement().executeQuery(member);
                while (rs3.next())
                {   
                    out.print("<div>會員姓名："+rs3.getString(2)+"</div><br>");
                }
                out.print("</div></div></div>");
            }
//Step 6: 關閉連線
            con.close();
        }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
		   
    }
}
catch (ClassNotFoundException err) {
      out.println("class錯誤"+err.toString());
}
%>

    
</body>
</html>