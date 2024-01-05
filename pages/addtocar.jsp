<%@ page import = "java.sql.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%
	
	if(session.getAttribute("access")==null)
	{
		out.print("<script>alert('請先登錄');window.location='login.jsp'</script>");
	}
    else
	{
    	String pro_id = request.getParameter("pro_id");
    	String count = request.getParameter("count");
        try 
        {
            //Step 1: 載入資料庫驅動程式
            Class.forName("com.mysql.jdbc.Driver");   
            try 
            {
                //Step 2: 建立連線 
                String url="jdbc:mysql://localhost/?serverTimezone=UTC";
                Connection con=DriverManager.getConnection(url,"root","1234");                  
                if(con.isClosed())
                    out.println("連線建立失敗");
                else
                {   
					String getuser = "";
					Object ob_get_user = session.getAttribute("username");
					if(ob_get_user != null)
					getuser = ob_get_user.toString();
					if(session.getAttribute("username") != null ){

                    con.createStatement().execute("USE demo");
                        
                    String sql = "";
				
					sql = "select `buy_count` FROM `cart` WHERE `mem_id`='"+getuser+"'AND `procer_id` ='"+pro_id+"' ";
					boolean ismuilt = false;
					ResultSet cc = con.createStatement().executeQuery(sql);
					while(cc.next())
					{
						ismuilt = true;
						String number = cc.getString(1);
						int number1 = Integer.parseInt(number);
						int number2 = Integer.parseInt(count);
						int number3 = (number1+number2);
						
						sql = "UPDATE `cart` SET `porcar`='"+ number3 +"' WHERE `mem_id`='"+getuser+"'AND `procer_id`='"+pro_id+"' ";
					}
					if(ismuilt){

					}
					else {
						sql = "INSERT `cart`(procer_id, mem_id, buy_count) "+"VALUES('"+pro_id+"','"+getuser+"','"+count+"')";
                    	int no = con.createStatement().executeUpdate(sql); 
					}
					con.close();
                    out.print("<meta http-equiv='refresh' content='0;url=cart.jsp'>");
					}
					else{
			 			con.close();//結束資料庫連結
						response.sendRedirect("login.jsp") ;
		 			}
					
                        
                }
            }
            catch(SQLException sExec) 
            {
                out.println("SQL錯誤"+sExec.toString());
            }
        }        
        catch(ClassNotFoundException err) 
        {
            out.println("class錯誤"+err.toString());
        }
    
	}
	
%>