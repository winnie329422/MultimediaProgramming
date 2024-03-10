<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import = "java.io.*"%>
<%
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
		{
           out.println("連線建立失敗");
		}   
        else {
//Step 3: 選擇資料庫   
           sql="use esports";
		   PreparedStatement pstmt = con.prepareStatement(sql);
		   ResultSet tmp =pstmt.executeQuery();
		   
		   sql = "SELECT * FROM `order`, `product` WHERE `product`.`product_id` = `order`.`product_id`"; 
		   pstmt = con.prepareStatement(sql);
		   tmp=pstmt.executeQuery();
		   while(tmp.next())
			{
			   String deleteorder=request.getParameter("deleteorder");
			   String product_id=request.getParameter("product_id");
			   int cart_quantity =Integer.parseInt(tmp.getString("cart_quantity"));
			   int product_stock = Integer.parseInt(tmp.getString("product_stock"));
			   int product_sales = Integer.parseInt(tmp.getString("product_sales"));
			   String time=request.getParameter("time");

			   sql = "DELETE FROM `order` WHERE  `time`='"+time+"'";
			   pstmt = con.prepareStatement(sql);
			   pstmt.execute();
		   
			   
			
			   int sto = Integer.valueOf(product_stock) + Integer.valueOf(cart_quantity)*(1/2);
			   sql = " UPDATE `product` SET `product_stock` = '"+sto+"' WHERE `product_id` = '"+product_id+"'";
			   pstmt = con.prepareStatement(sql);
			   pstmt.execute();
			   
			   int sal = Integer.valueOf(product_sales) - Integer.valueOf(cart_quantity);
			   sql = " UPDATE `product` SET `product_sales` = '"+sal+"' WHERE `product_id` = '"+product_id+"'";
			   pstmt = con.prepareStatement(sql);
			   pstmt.execute();
				
			   con.close();//結束資料庫連結
			
		   
			   out.println("<script>self.location=document.referrer; alert('刪除成功');</script>") ;
			}
		   }
          }
	
    catch (SQLException sExec)
	{
           out.println("SQL錯誤"+sExec.toString());
    }
}

catch (ClassNotFoundException err) 
{
   out.println("class錯誤"+err.toString());
}
 		  
%>