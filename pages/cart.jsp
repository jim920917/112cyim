	<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../assets/css/car.css">
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
    <div id="cart">
        <div class="container">
            <div class="item_header">
                <div class="item_detail">商品</div>
                <div class="price">單價</div>
                <div class="count">數量</div> 
                <div class="amount">總計</div>
                <div class="operate">操作</div>
            </div>
<%request.setCharacterEncoding("utf-8");%>
<%
if(session.getAttribute("username")==null){
    out.print("<script>alert('請先登入！'); window.location='login.jsp'</script>");
}
else{
    try {
        int t = 0;
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
					String getuser = "";
					Object ob_get_user = session.getAttribute("username");                    
                    String car = "SELECT * FROM `cart` WHERE `mem_id` ='"+ob_get_user+"'";
                    ResultSet first = con.createStatement().executeQuery(car);
                    String product = "SELECT * FROM `product`"; 
                    ResultSet rs = con.createStatement().executeQuery(car);
                    while(first.next()){
                        try {
						    String pro_id = first.getString(1);
                            String count = first.getString(3);
                            product = "SELECT * FROM `product` WHERE `id` = '"+pro_id+"'";
                            rs = con.createStatement().executeQuery(product);
                            while(rs.next()){
							    int buy_count = Integer.parseInt(count);
								int price = rs.getInt("price");
								int total = price*buy_count;
                                t += total;
								out.print("<div class='item_container' v-for='(item, index) in itemList' :key='item.id' >");
								out.print("<div class='item_header item_body'>");
								out.print("<div class='item_detail'>");
								out.print("<img src='"+rs.getString("img")+"'>");
								out.print("<div class='name'>"+rs.getString("name")+"</div>");
								out.print("</div>");
								out.print("<div class='price'><span>$</span>"+rs.getInt("price")+"</div>");
								out.print("<div class='count'>");
								out.print("<input type='number' value='"+buy_count+"'>");
								out.print("</div>");
								out.print("<div class='amount'>"+(price*buy_count)+"</div>");
								out.print("<div class='operate'>");
								out.print("<form action='shopcar_drop.jsp' method='POST'>");
								out.print("<button type='submit' name='cancel' value='"+pro_id+"' @click='handledelete(index)'>刪除</button>");
								out.print("</form>");
								out.print("</div></div></div>");
                        }
                        }
                        catch(Exception e)
                        {
                            out.print("<script>alert('無消費紀錄');window.location='index.jsp'</script>");
                            out.println(e);
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
%>

	        <div class="container4" style="margin-top:10px">
			<h3>訂購資訊</h3>
			<form action="buy.jsp" method="POST">
            <p>縣市&emsp;&emsp;&emsp;&emsp;
            <select name="contray">
                <option></option>
                <option value="臺北市">臺北市</option>
                <option value="新北市">新北市</option>
                <option value="基隆市">基隆市</option>
                <option value="桃園市">桃園市</option>
                <option value="新竹市">新竹市</option>
                <option value="新竹縣">新竹縣</option>
                <option value="臺中市">臺中市</option>
                <option value="臺南市">臺南市</option>
                <option value="臺南市">高雄市</option>
                <option value="苗栗縣">苗栗縣</option>
                <option value="彰化縣">彰化縣</option>
                <option value="南投縣">南投縣</option>
                <option value="雲林縣">雲林縣</option>
                <option value="嘉義市">嘉義市</option>
                <option value="嘉義縣">嘉義縣</option>
                <option value="屏東縣">屏東縣</option>
                <option value="宜蘭縣">宜蘭縣</option>
                <option value="花蓮縣">花蓮縣</option>
                <option value="澎湖縣">澎湖縣</option>
                <option value="臺東縣">臺東縣</option>
                <option value="金門縣">金門縣</option>
                <option value="連江縣">連江縣</option>
            </select></p>
            <p>地址&nbsp;&emsp;&emsp;&emsp;&emsp;<input type="text" name="address" placeholder="請輸入送貨地址"></p>
            <hr>
            <p>付款方式</p>
            <input type="radio" name="pay" value="貨到付款" id="cash">
            <label for="cash">貨到付款</label>
            <hr>
            <p>寄送方式</p>
            <div class="container3">
                <br>
                <input type="radio" name="send" value="超商取貨(7-11)" id="cash"><a href="https://emap.pcsc.com.tw/emap.aspx" class="delivery-link" data-method="711">超商取貨(7-11)、</a>
                <input type="radio" name="send" value="超商取貨(全家)" id="cash"><a href="https://www.family.com.tw/Marketing/Map" class="delivery-link" data-method="familymart">超商取貨(全家)</a>
            </div>
            <hr>
            <p>運費：<span class="price" style="color:black"><b>NT$60</b></span></p>
            <hr>
            <p>總金額：<span class="price" style="color:black"><b>NT$<%= ""+t+" ×  0.9"+" + 60 = "+(t*0.9+60)+"元"+"(會員價9折)"%></b></span></p>
            <br>
			<div class="row">
				<div class="col1">
					<button type="submit" class="check" onclick="window.location.href='history.html'">送出訂單</button>
				</div>
			</div>
			</form>
        </div>

        </div>
<%
    }
    catch (ClassNotFoundException err) {
        out.println("class錯誤"+err.toString());
    }
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