<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WEAVES</title>
    <link rel="stylesheet" href="../assets/css/index.css">
	<script type="text/javascript" src="../assets/js/animation.js"></script>
	<style>
	h1, p {
            text-align: center; 
            margin: 0;
        }
    </style>
</head>
<body>		
<%
        // 檢查是否已經同意 Cookies
        Cookie[] cookies = request.getCookies();
        boolean hasAcceptedCookies = false;
    
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("acceptedCookies") && cookie.getValue().equals("true")) {
                    hasAcceptedCookies = true;
                    break;
                }
            }
        }
    %>
    
    <script>
        // 使用 window.onload 事件確保在整個文檔完全加載後再執行 JavaScript
        window.onload = function() {
            // 彈出 Cookie 通知
            var userAgrees = <%= !hasAcceptedCookies %>;
    
            if (userAgrees) {
                userAgrees = window.confirm("本網站使用 cookies 來保護消費者。 請問您接受 cookies 嗎？");
    
                // 如果用戶同意，設置 'acceptedCookies' Cookie，有效期365天
                if (userAgrees) {
                     document.cookie = 'acceptedCookies=true; path=/';
                } else {
                    // 如果用戶拒絕，關閉瀏覽器窗口
                    window.close();
                }
            }
        };
    </script>
    
    <%
        // 顯示網站內容
    %>
		
    <h1>歡迎來到網站</h1>
    <p>祝您購物愉快</p>
    <!-- 其他網頁內容 -->
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
        <div class="header">
            <a href="javascript:;" id="prev" class="arrow">&lt;</a>
            <a href="javascript:;" id="next" class="arrow">&gt;</a>
                <div class="row">
                    <div class="col1">
                        <h1>用心與線向您<br>郁織零用錢!</h1>
                        <a href="../pages/hw01.jsp" class="btn">探索一下 &#8594;</a>
                    </div>
                    <div class="col2">
                        <img src="../assets/img/img04.jpg" width="850px">
                    </div>
                </div>
                </div>
        
                <div class="categories">
                    <div class="lil-container">
                        <div class="row">
                            <div class="prod1">
                                <img src="../assets/img/img05.jpg">
                            </div>
                            <div class="prod1">
                                <img src="../assets/img/img13.jpg">
                            </div>
                            <div class="prod1">
                                <img src="../assets/img/img06.jpg">
                            </div>
                        </div>
                    </div>
                </div>
        
        
                <div class="title"><p>精選商品</p></div>
                    <div class="producutimg">
                    <div class="producutimg1">
                    
                    <form action="hw02.jsp" method="POST">
                        <a href="../pages/hw01.jsp"><img src="../assets/img/img18.jpg" class="p"></a>
                        <p>🧉珍珠奶茶造型飲料提袋🧉</p>
                        <p>$400</p>
                        <button type="submit" name="pro" value="2">前往選購
                    </form>	                                    
                    </div>
                    <div class="producutimg2">
                    <form action="hw02.jsp" method="POST">
                        <a href="../pages/hw01.jsp"><img src="../assets/img/img23.jpg" class="p"></a>
                        <p>🌺桔梗鏤空花花證件掛繩🌺</p>
                        <p>$350</p>
                        <button type="submit" name="pro" value="5">前往選購
                    </form>
                    </div>
                    <div class="producutimg3">
                    <form action="hw02.jsp" method="POST">
                       <a href="../pages/hw01.jsp"><img src="../assets/img/img27.jpg" class="p"></a>
                        <p>🥤純色網格飲料提袋🥤</p>
                        <p>$350</p>
                        <button type="submit" name="pro" value="3">前往選購
                    </form>
                    </div>
                    </div>
                    <div class="producutimg">
                    <div class="producutimg4">
                    <form action="hw02.jsp" method="POST">
                        <a href="../pages/hw01.jsp"><img src="../assets/img/img35.jpg" class="p"></a>
                        <p>⚽️男女通吃四股辮手機掛繩⚽️</p>
                        <p>$700</p>
                        <button type="submit" name="pro" value="6">前往選購
                    </form>
                    </div>
                    <div class="producutimg5">
                    <form action="hw02.jsp" method="POST">
                        <a href="../pages/hw01.jsp"><img src="../assets/img/img25.jpg" class="p"></a>
                        <p>🌸小黃花配色花花手機掛繩🌸</p>
                        <p>$700</p>
                        <button type="submit" name="pro" value="1">前往選購
                    </form>
                    </div>
                    <div class="producutimg6">
                    <form action="hw02.jsp" method="POST">
                        <a href="../pages/hw01.jsp"><img src="../assets/img/img30.jpg" class="p"></a>
                        <p>👜純色鏤空俏皮小包👜</p>
                        <p>$890</p>
                        <button type="submit" name="pro" value="8">前往選購
                    </form>
                    </div>
                    </div>
        <%
        //計數器
        try {
        //Step 1: 載入資料庫驅動程式 
            Class.forName("com.mysql.jdbc.Driver");
            try {
        //Step 2: 建立連線 
                String url="jdbc:mysql://localhost/?serverTimezone=UTC";
                Connection con=DriverManager.getConnection(url,"root","1234");
                if(con.isClosed())
                   out.println("連線建立失敗");
                else
                {
        //Step 3: 選擇資料庫	        
                    String sql="USE `demo`";
                    con.createStatement().execute(sql);
                    sql = "SELECT * FROM `counter`";
                    ResultSet rs = con.createStatement().executeQuery(sql);
                    if(rs.next())
                    {
                       String countString = rs.getString(1);
                       Integer count = Integer.parseInt(countString);
                       if(session.isNew())
                       {
                           count = count+1;
                           countString = String.valueOf(count);
                           sql = "UPDATE `counter` SET `count` = " + countString;
                           con.createStatement().execute(sql);
                       }
                      out.print("<h5>瀏覽人數："+ count +"</h5>"); 
                   }  
                }
        //Step 6: 關閉連線
                con.close();
            }
            catch (SQLException sExec) {
                out.println("SQL錯誤"+sExec.toString());
            }
        }
        catch (ClassNotFoundException err) {
           out.println("class錯誤"+err.toString());
        }
        %>
        
        
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
            
            
            
        
        </body>
        </html>