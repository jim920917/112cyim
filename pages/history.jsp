<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../assets/css/history.css">
	<link rel="stylesheet" href="../assets/css/index.css">
</head>
<body>
<%request.setCharacterEncoding("utf-8");%>
    <div class="header">
        <div class="container">
        <div class="navbar">  
            <div class="logo">
                <img src="../assets/img/img01.jpg" width="150px">
            </div>
			<div class="wrap">
			<form action="search.jsp" method="POST">
                    <div class="search">
                        <input class="search-bar" type="search" name="search" id="search" placeholder="請輸入商品名稱">
                        <button class="search-btn" type="submit" name="search" width=50><img src="../assets/img/search.png"></button>
                    </div>
                </form>
			</div>	
        <nav class="meun">
            <ul class="drop-down-menu">
                <li>
                    <a href="#" >會員中心</a>
                    <ul class="dropdown">
                        <li><%@ include file="issignin.jsp" %></li>
                        <li><a href="history.jsp">訂單</a></li>
                        <li><a href="setup.jsp">修改資料</a></li>
                    </ul>
                </li>		
                <li><a href="../pages/index.jsp">Home</a></li>				
                <li><a href="../pages/hw01.jsp">Shop</a></li>
				<li><a href="../pages/team.jsp">aboutus</a></li>					
            </ul>
        </nav>
            <a href="../pages/cart.jsp">
                <img src="../assets/img/car.png" width="30px" height="30px">
            </a>
        </div>
        </div>
    
       <nav class="navigationbar">
            <div class="dropdown01">
                <p>YU weavws</p>
            </div>
        </nav>
		<div class="cart-page">
            <h3>最新訂單</h3>
            <table>
                <tr>
                    <th>product</th>
                    <th>Quantity</th>
                    <th>subtotal</th>
                </tr>
<%request.setCharacterEncoding("utf-8");%>
<%
if(session.getAttribute("username")==null){
    out.print("<script>alert('請先登入！'); window.location='login.jsp'</script>");
}
else{
    try {
        Class.forName("com.mysql.jdbc.Driver");
        try {
            String url="jdbc:mysql://localhost/?serverTimezone=UTC";
            String sql="";
            Connection con=DriverManager.getConnection(url,"root","1234");
            if(con.isClosed())
               out.println("連線建立失敗");
            else {
                sql= "USE `demo`";
                con.createStatement().execute(sql);
                if(session.getAttribute("username") != null ) {
                    String user="";
					Object ob_get_user = session.getAttribute("username");
					if(ob_get_user != null)
					    user = ob_get_user.toString();
                    String order = "SELECT * FROM `orders` WHERE `member_id` = '"+user+"'";
                    ResultSet first = con.createStatement().executeQuery(order);
                    while(first.next()) {
                        String id = first.getString(2);
                        String product = "SELECT * FROM `product` WHERE `id` = '"+id+"'";
                        ResultSet rs = con.createStatement().executeQuery(product);
                        while(rs.next()) {
							int total = (first.getInt("pro_count"))*(rs.getInt("price"));
							out.print("<tr><td>");
							out.print("<div class='cart-info'>");
							out.print("<img src='"+rs.getString("img")+"'>");
							out.print("<div>");
							out.print("<p>"+rs.getString("name")+"</p>");
							out.print("<small>$"+rs.getInt("price")+"</small>");
							out.print("</div></div>");
							out.print("</td>");
							out.print("<td><input type='number' readonly value='"+first.getInt("pro_count")+"'></td>");
							out.print("<td>$"+total+"</td>");
							out.print("</td>");
                        }
                    }

                con.close();
                }
                else {
                    con.close();//結束資料庫連結
                }
            }
        }
        catch (SQLException sExec) {
             out.println("SQL錯誤"+sExec.toString());
        }
    }
    catch (ClassNotFoundException err) {
        out.println("class錯誤"+err.toString());
    }
}
%>
            </table>

             <h3>歷史訂單</h3>

            <table>
                <tr>
                    <th>product</th>
                    <th>Quantity</th>
                    <th>subtotal</th>
                </tr>
                <tr>
                    <td>
                        <div class="cart-info">
                            <img src="../assets/img/img29.jpg">
                        <div>
                            <p>⚽️男女通吃四股辮手機掛繩⚽️</p>
                            <small>$700</small>
                        </div>
                        </div>

                    </td> 
                    <td><input type="number" readonly value="1"></td>
                    <td>$700</td>
                </tr>
               
                <td>
                    <br>
                    <br>
                    <div class="cart-info">
                        <img src="../assets/img/img25.jpg">
                    <div>
                        <p>🥤雙色網格飲料提袋🥤</p>
                        <small>$350</small>
                    </div>
                    </div>
                </td> 
                <td><input type="number" readonly value="1"></td>
                <td>$350</td>
            </table>
        </div>
        <div class="footer">
            <div class="row">
                <div class="container1">
                    <div class="footer-col2">
                        <img src="../assets/img/img01.jpg">                    
                    </div>
                    <div class="footer-col3">
                        <a href="https://www.instagram.com/yuweaves/">
                             <img class="ig" src="../assets/img/ig.png">
                        </a>
                    </div>
                    <div class="footer-col3">
                        <a href="mailto:jim20030917@gmail.com">
                             <img class="ig" src="../assets/img/emal.jpg">
                        </a>
                    </div>
                    <div class="footer-col4">
                        <h3>聯絡我們</h3>
                        <ul>
                            <li>電話: +886-3-265-9999</li>
                            <li>傳真：+886-3-265-8888</li>
                            <li>地址: 320314 桃園市中壢區中北路200號</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>