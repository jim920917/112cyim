<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>搜尋結果</title>
	<link rel="stylesheet" href="../assets/css/hw02.css">
    <link rel="stylesheet" href="../assets/css/index.css">
    <script type="text/javascript" src="../assets/js/star.js"></script>
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
    </header>
<main>
<%
    String search = request.getParameter("search");
    Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:mysql://localhost/?serverTimezone=UTC";
    Connection con=DriverManager.getConnection(url,"root","1234");
    String sql="USE demo";
    con.createStatement().execute(sql);
    sql = "SELECT * FROM `product` WHERE `name` LIKE'%"+search+"%'";
    ResultSet rs1 = con.createStatement().executeQuery(sql);
    while(rs1.next())
    {
			out.print("<h1>"+rs1.getString("name")+"</h1>");
			out.print("<div class='title' style='padding:30px 30px 30px 30px;'>");
			out.print("<div class='slideshow-container'>");
			out.print("<div class='mySlides'>");
			out.print("<img class='img01' src='"+rs1.getString("img")+"'>");
			out.print("</div>");
			// 照片欄位要加進資料庫
			out.print("<div class='mySlides'><img class='img01' src='"+rs1.getString(7)+"'></div>");
			out.print("<div class='mySlides'><img class='img01' src='"+rs1.getString(8)+"'></div>");
			out.print("<div class='mySlides'><img class='img01' src='"+rs1.getString(9)+"'></div>");
			out.print("<div class='mySlides'><img class='img01' src='"+rs1.getString(10)+"'></div>");
			out.print("<div class='mySlides'><img class='img01' src='"+rs1.getString(11)+"'></div>");
			out.print("<a class='prev' onclick='plusSlides(-1)'>❮</a>");
			out.print("<a class='next' onclick='plusSlides(1)'>❯</a>");
			out.print("</div>");
			out.print("<div class='text01'>");
			out.print("<h4> 價格:"+rs1.getInt("price")+"<br></h4>");
			out.print("<h4> 庫存:"+rs1.getInt("amount")+"<br></h4>");
			out.print("<h2> 產品介紹<br></h2>");
			out.print(rs1.getString(6));
			out.print("<form action='hw02.jsp' method='POST'>");
			out.print("<div class='button'>");
			out.print("<div class='button1'>");
			out.print("<input type='submit' value='前往選購' name='按鈕名稱' style='width:150px;height:50px;'>");
            out.print("<input type='hidden' name='pro' value='"+rs1.getString(1)+"'>");
            out.print("</form></div>");
			out.print("</div></div></div>");
    }
        con.close();
%>
<script>
    var slideIndex = 1;
    showSlides(slideIndex);
  
    function plusSlides(n) {
      showSlides(slideIndex += n);
    }
  
    function currentSlide(n) {
      showSlides(slideIndex = n);
    }
  
    function showSlides(n) {
      var i;
      var slides = document.getElementsByClassName("mySlides");
      if (n > slides.length) { slideIndex = 1; }
      if (n < 1) { slideIndex = slides.length; }
      for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
      }
      slides[slideIndex - 1].style.display = "block";
    }
</script>
</main>
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
