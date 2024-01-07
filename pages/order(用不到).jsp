<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>訂單記錄</title>
    <link rel="stylesheet" href="../assets/css/order.css">
	<link rel="stylesheet" href="../assets/css/index.css">
	<link rel="stylesheet" href="../assets/css/history.css">
	<link rel="stylesheet" href="../assets/css/history.css">
</head>
<body>
    <header class="navFixed" >
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
                <li><a href="../pages/index.jsp">Home</a></li>				
                <li><a href="../pages/hw01.jsp">Shop</a></li>
				<li><a href="../pages/team.jsp">aboutus</a></li>
				<li>
                    <a href="#">會員中心</a>
                    <ul class="dropdown">
                        <li><%@ include file="issignin.jsp" %></li>
                        <li><a href="history.jsp">訂單</a></li>
                        <li><a href="setup.jsp">修改資料</a></li>
                    </ul>
                </li>				
            </ul>
        </nav>
            <a href="../pages/cart.jsp">
                <img src="../assets/img/car.png" width="30px" height="30px">
            </a>
        </div>
        </div>    
       <nav class="navigationbar">
            <div class="dropdown">
                <p>YU weavws</p>
            </div>
        </nav>

        </div>
    </header>

    <main>
        <div class="blank">
        </div>
        <div class="flex">
            <div></div>
            <div class="ordertitlea" ><p>商品</p></div>
            <div></div> 
            <div class="ordertitleb"><p>商品名稱</p></div>
            <div></div> <div></div>
            <div></div>  <div></div> 
            <div class="ordertitled"><p>數量</p></div>
            <div></div> 
            <div class="ordertitlee"><p>功能</p></div>
            <div></div>
        </div><hr>
		  <div class="cart-page">
            <h3>最新訂單</h3>
            <table>
                <tr>
                    <th>product</th>
                    <th>Quantity</th>
                    <th>subtotal</th>
                </tr>
                <tr>
                    <td>
                        <div class="cart-info">
                            <img src="../assets/img/img13.jpg">
                        <div>
                            <p>XXXXX</p>
                            <small>$300</small>
                        </div>
                        </div>

                    </td> 
                    <td><input type="number" value="1"></td>
                    <td>$300</td>
                </tr>
                <td>
                    <br>
                    <br>
                    <div class="cart-info">
                        <img src="../assets/img/img05.jpg">
                    <div>
                        <p>XXXXX</p>
                        <small>$300</small>
                    </div>
                    </div>
                </td> 
                <td><input type="number" value="1"></td>
                <td>$300</td>
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
                            <img src="../assets/img/img26.jpg">
                        <div>
                            <p>XXXXX</p>
                            <small>$300</small>
                        </div>
                        </div>

                    </td> 
                    <td><input type="number" value="1"></td>
                    <td>$300</td>
                </tr>
               
                <td>
                    <br>
                    <br>
                    <div class="cart-info">
                        <img src="../assets/img/img25.jpg">
                    <div>
                        <p>XXXXX</p>
                        <small>$300</small>
                    </div>
                    </div>
                </td> 
                <td><input type="number" value="1"></td>
                <td>$300</td>
            </table>
        </div>
        <article>
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
                        out.print("<section class='carda'>");
                        out.print("<div class='flexb'>");
                        out.print("<div class='orderproducta'><img src='"+rs.getString(2)+"'  class='product'></div>");
                        out.print("<div class='orderproductb'><p>"+rs.getString(3)+"</p></div>");
                        out.print("<div></div>");
                        out.print("<div class='orderproductc'><p>"+rs.getString(4)+"</p></div>");
                        out.print("<div></div>");
                        out.print("<div class='orderproductd'><p>"+first.getInt(4)+"</p></div>");
                        out.print("<div class='orderproducte'>");
                        out.print("<form action='return.jsp' method='POST'><button type='submit' name='orders' value='"+first.getInt(1)+"' class='loginbutton'>退貨</button></form>");
                        out.print("<a href=aboutus.jsp'><button type='button' class='loginbutton'>聯絡我們</button></a>");
                        out.print("</div></div></section>");
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
        </article>
    </main>
	<a href="hw01.jsp">
		<input class="loginbutton" type="submit" value="註冊完成，去購物"/>													
	</a>
</body>
 <div class="footer">
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
</html>