<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>關於我們</title>
	<link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/index.css">

</head>
<body>
    <header class="navFixed" >
       <div class="header">
        <div class="container">
        <div class="navbar">  
            <div class="logo">
                <img src="../assets/img/img01.jpg" width="250px">
            </div>
			<div class="wrap">
            <form action="search.jsp" method="POST">
                <div class="search">
                    <input class="search-bar" type="search" name="search" id="search" placeholder="請輸入商品名稱">
                    <button class="search-btn" type="submit" name="search" value=""><img src="../assets/img/search.png"></button>
                </div>
            </form>
        </div>
        <nav class="meun">
            <ul class="drop-down-menu">
                <li><a href="../pages/index.jsp">Home</a></li>
                <li><a href="../pages/hw01.jsp">Shop</a></li>
                <li><a href="../pages/aboutus.jsp">Contact</a></li>  
			</ul>
        </nav>
        <a>
            <a href="../pages/cart.jsp">
                <img src="../assets/img/car.png" width="30px" height="30px">
            </a>
        </div>
        </div>

     <nav class="navigationbar">
        <div class="dropdown">
            <button class="dropbtn">會員中心</button>
            <div class="dropdown-content">
                <%@ include file="issignin.jsp"%>
                <a href="order.jsp">訂單</a>
                <a href="setup.jsp">修改資料</a>
            </div>
        </div>

        <div class="dropdown">
            <button class="dropbtn">其他</button>
            <div class="dropdown-content">
                <a href="#category1">Category 1</a>
                <a href="#category2">Category 2</a>
                <a href="#category3">Category 3</a>
             </div>
        </div>
    </nav>
        </div>
    </header>

    <main>
        <div class="blank"></div>
        <div class="aboutusa">
            <div class="aboutusa1"><p>設計理念</p></div><hr>
            <div class="aboutusa2"><p>gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg<br>gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg。</p></div>

            <div class="aboutusa1"><p>官網特色</p></div><hr>
            <div class="aboutusa2"><p>gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg<br>gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg。</p></div>
        </div>
<%
//組員介紹
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
            String our = "SELECT * FROM `our`";
            ResultSet rs = con.createStatement().executeQuery(our);

            out.print("<div class='aboutusb'>");
            out.print("<div class='aboutusb1'><p>關於我們</p></div>");
            out.print("<hr>");
            out.print("<div class='aboutusb2'>");
            out.print("<div class='peoplea'>");   
            while(rs.next())    
            {     
                out.print("<div class='people'>");
                out.print("<div class='peopletxt'>");
                out.print("<h1>"+rs.getString(2)+"</h1>");
                out.print("<hr>");
                out.print(rs.getString(4));
                out.print("<div class='callmeb'>");
                out.print("<div class='fb'>");
                out.print("<a href='"+rs.getString(5)+"'>");
                out.print("<img src='../assets/img/FB.png'></a>");
                out.print("</div>");
                out.print("<div class='ig'>");
                out.print("<a href='"+rs.getString(6)+"'>");
                out.print("<img src='../assets/img/IG.png'></a>");
                out.print("</div>");        
                out.print("</div>");
                out.print("</div>");
                out.print("<div>");
                out.print("<img src='"+rs.getString(3)+"' width='400'  class='peoplepic'>");
                out.print("</div>");
                out.print("</div>");
            }
            out.print("</div>");
            out.print("</div>");
            out.print("</div>");

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
        <div class="content">
            <div class="contentblock">
                <div class="con">
                <span>
                    <h2>聯絡我們</h2>
                </span>
                <hr>
                <div class="condetail">
                        <div class="condetail1">
                        <form action="add2.jsp" method="POST">
                            <input class="namebar" name="name" type="text" placeholder="請輸入名稱">
                            <input class="namebar" name="email" type="email" placeholder="請輸入電子信箱">
                            <div class="submit">
                                <textarea class="area" name="content" cols="80" rows="8" placeholder="請輸入您的反饋意見" ></textarea>
                            </div>
                                <button type="submit" class="btn">送出</button>
                                <button type="reset" class="btn">重填</button>
                            </div>
                        </form>
                       
                    </div>
                </div>
            </div>
        </div>
    </main>

</body>
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