<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YU weavws</title>
    <link rel="stylesheet" href="../assets/css/hw01.css">
</head>
<body>
	
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


        
    <div class="product01">
        <div class="link01">
			<!--傳值範例-->
			<form action="hw02.jsp" method="POST">
                <img src="../assets/img/img25.jpg" class="img01" >
                <p>🌸小黃花配色花花手機掛繩🌸</p>
				<button type="submit" name="pro" value="1">前往選購
			</form>
			<!--傳值範例-->
        </div>
        <div class="link02">
				<form action="hw02.jsp" method="POST">
					<img src="../assets/img/img13.jpg" class="img02" >
					<p>🧉珍珠奶茶造型飲料提袋🧉</p>
					<button type="submit" name="pro" value="2">前往選購
				</form>
        </div>
        <div class="link03">
		    <form action="hw02.jsp" method="POST">
                <img src="../assets/img/img16.jpg" class="img03" >
                <p>🥤純色網格飲料提袋🥤</p>
				<button type="submit" name="pro" value="3">前往選購
			</form>

        </div>
        <div class="link04">
             <form action="hw02.jsp" method="POST">
                <img src="../assets/img/img26.jpg" class="img04" >
                <p>👛祖母方格文青少女小廢包👛</p>
				<button type="submit" name="pro" value="4">前往選購
			</form> 
         </div>
    </div>
    <div class="product02">
        <div class="link01">
            <form action="hw02.jsp" method="POST">
                <img src="../assets/img/img05.jpg" class="img05" >
                <p>🌺桔梗鏤空花花證件掛繩🌺</p>
				<button type="submit" name="pro" value="5">前往選購
			</form> 
            
        </div>
        <div class="link02">
            <form action="hw02.jsp" method="POST">
                <img src="../assets/img/img29.jpg" class="img06" >
                <p>⚽️男女通吃四股辮手機掛繩⚽️</p>
               <button type="submit" name="pro" value="6">前往選購
			</form> 
        </div>
        <div class="link03">
            <form action="hw02.jsp" method="POST">
                <img src="../assets/img/img31.jpg" class="img07" >
                <p>🥤雙色網格飲料提袋🥤</p>
				<button type="submit" name="pro" value="7">前往選購
			</form>
        </div>
        <div class="link04">
            <form action="hw02.jsp" method="POST">
                <img src="../assets/img/img30.jpg" class="img08" >
                <p>👜純色鏤空俏皮小包👜</p>
				<button type="submit" name="pro" value="8">前往選購
			</form> 
         </div>
    </div>

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