<%
// 用來啟動、與資料庫做連線
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost/?serverTimezone=UTC";
Connection con = DriverManager.getConnection(url,"root","1234");
String sql = "USE demo";
con.createStatement().execute(sql);
%>
