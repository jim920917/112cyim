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
    <title>YU weavws</title>
    <link rel="stylesheet" href="../assets/css/hw02.css">
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
                    <a href="#">會員中心</a>
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
<%
String pro_id = request.getParameter("pro");
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        Connection con = DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else
        {
//Step 3: 選擇資料庫
            String sql = "USE `demo`";
            con.createStatement().execute(sql);
            sql = "SELECT * FROM `product` WHERE `id` = '"+pro_id+"'";
            ResultSet rs1 = con.createStatement().executeQuery(sql);
  
            rs1.next();
			out.print("<h1>"+rs1.getString("name")+"</h1>");
			out.print("<div class='title'>");
			out.print("<div class='slideshow-container'>");
			out.print("<div class='mySlides'>");
			out.print("<img class='img01' src='"+rs1.getString(2)+"'>");
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
			out.print("<form action='addtocar.jsp' method='POST'>");
			out.print("<div>購買數量:<input type='number' value='1' min='1' name='count' class='num'></div>");
			out.print("<div class='button'>");
			out.print("<div class='button1'>");
			out.print("<input type='submit' value='加入購物車' name='按鈕名稱' style='width:150px;height:50px;'>");
            out.print("<input type='hidden' name='pro_id' value='"+pro_id+"'>");
            out.print("</form></div>");
			out.print("</div></div></div> ");

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
<!--留言顯示-->
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
//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet
            String comm = request.getParameter("pro");
            sql="SELECT * FROM `message` WHERE `id` = '"+pro_id+"'"; //算出共幾筆留言
            ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
            rs.last();
            int total_content = rs.getRow();
//Step 5: 顯示結果

            sql = "SELECT * FROM `message` WHERE `id` = '"+pro_id+"' ORDER BY `message_id` DESC";
            rs = con.createStatement().executeQuery(sql);
            while(rs.next()){

                    out.print("<div class='buyer'>");
					out.print("<div class='consumer_name'>");
					out.print("<p>買家名稱:"+rs.getString(3)+"</p>");
					out.print("</div><br>");
					out.print("<div class='respond'>");
					out.print("<p>"+rs.getString(4)+"</p>");
					out.print("<p>★★★★★</p>");	
					out.print("<p>"+rs.getString(5)+"</p>");
					out.print("</div></div>");
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
 
 
 <main>
    <article>

        <hr>
        <section>
            <div class="content">
                <div class="contentblock">
                  <div class="con">
                      <span>
                          <h2>評論區</h2>
                      </span>
                      <hr>
                        <div class="condetail1">
                            <form action="add.jsp" method="POST">
                                <input class="namebar" name="namebar" type="text" placeholder="請輸入名稱">
                                <div id="stars" class="star1">
                                    <img class="default" src="../assets/img/star2.png" >
                                    <img class="default" src="../assets/img/star2.png" >
                                    <img class="default" src="../assets/img/star2.png" >
                                    <img class="default" src="../assets/img/star2.png" >
                                    <img class="default" src="../assets/img/star2.png" >
                                </div>  
                                <div class="submit"><textarea name="content" class="area" cols="80" rows="5"></textarea></div>
                                <input type="hidden" name="com" value="<%=pro_id%>">
                                <button type="submit" class="btn " >送出</button>
                                <button type="reset" class="btn" >重填</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </article>
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
   <script type="text/javascript" src="../assets/js/star.js"></script>
</body>
</html>