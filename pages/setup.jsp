<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>會員中心</title>
    <link rel="stylesheet" href="../assets/css/car.css">
	<link rel="stylesheet" href="../assets/css/hw01.css">
	<link rel="stylesheet" href="../assets/css/MemberCentre.css">
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
    
<%
if(session.getAttribute("username") != null ){
    sql = "SELECT * FROM `member` WHERE `member_account`='" + session.getAttribute("username")+"';"; 
	ResultSet rs = con.createStatement().executeQuery(sql);
	String username="", password="", name="", email="", phone="", gender="";
	while(rs.next()){
	    username = rs.getString("member_account");
		password = rs.getString("member_password");
        name = rs.getString("member_name");
        email = rs.getString("email");
        phone = rs.getString("phone");
        gender = rs.getString("sex");
	}
    con.close();//結束資料庫連結
%>
    
        <div id="container2" >
            <form class="register" action="updatemember.jsp" method="POST">
                <div class="logintitle"><h1><a href="index.jsp">WEAVES</a></h1></div>
                <div class="logina"><h1>會員資料修改</h1></div>
                <div><input type="text" id="username" name="username" readonly="readonly" placeholder="帳號" value="<%=username%>"></div>
                <div><input type="text" id="password" name="password" placeholder="密碼" value="<%=password%>"></div>
                <div><input type="text" id="name" name="name" placeholder="姓名" value="<%=name%>"></div>
                <div><input type="text" id="phone" name="phone" placeholder="電話" value="<%=phone%>"></div>
                <div><input type="email" id="location" name="location" placeholder="電子郵件" required="required" value="<%=email%>"></div>
                <div><input type="text" id="gender" name="gender" placeholder="性別" value="<%=gender%>"></div>
                <button type="submit" class="loginbutton">確定修改</button>
                <a href="index.jsp">
                    <button type="button" class="loginbutton">取消</button>
                </a>
            </form>
        </div>
<%
}
else{
	con.close();//結束資料庫連結
    out.print("<script>alert('請先登入！'); window.location='login.jsp'</script>");
}
%>

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
   <script type="text/javascript" src="../assets/js/star.js"></script>
</html>