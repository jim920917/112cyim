<%@ page import = "java.sql.*, java.util.*"%>
<%@ page import = "java.util.Date, java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

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
		if(session.getAttribute("username") != null )
		{
			sql="use demo";
			con.createStatement().execute(sql);
			//從表格傳遞中文到資料庫, 必須使用getBytes("ISO-8859-1"),"UTF-8"編碼
			sql = "SELECT * FROM `cart` WHERE `mem_id`='"+session.getAttribute("username").toString()+"'";
			ResultSet rs = con.createStatement().executeQuery(sql);
			String local = request.getParameter("address");
			String contray = request.getParameter("contray");
			String newadd = contray+local;
			String pay = request.getParameter("pay");
			String wh = request.getParameter("send");
			String paid = wh+pay;
			Date d = new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String now = df.format(d);
			while(rs.next())
			{
				sql = "INSERT `orders`(`pro_id`,`member_id`,`pro_count`,`pay`,`local`,`time`) "+"VALUE('"+rs.getString(1)+"','"+rs.getString(2)+"','"+rs.getInt(3)+"','"+paid+"','"+newadd+"','"+now+"')";
				con.createStatement().executeUpdate(sql);
				sql = "SELECT `amount` FROM `product` WHERE `id`='"+rs.getInt(1)+"'";
				ResultSet re = con.createStatement().executeQuery(sql);
				int stock = 0;
				while(re.next())
				{
					stock = re.getInt(1);
				}
				stock = stock - rs.getInt(3);
				sql = "UPDATE `product` SET `amount`='"+stock+"' WHERE `id`='"+rs.getInt(1)+"'";
				con.createStatement().executeUpdate(sql);
			}
			sql = "DELETE FROM `cart` WHERE `mem_id`='"+session.getAttribute("username").toString()+"'";
		con.createStatement().executeUpdate(sql);
//Step 6: 關閉連線
		con.close();
		}
			out.println("下單成功，三秒後回到訂單");
		  out.print("<meta http-equiv='refresh' content='3; url=history.jsp'>");
//Step 5: 顯示結果 
          //直接顯示最新的資料
        
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
