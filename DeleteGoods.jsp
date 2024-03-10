<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import = "java.io.*"%>
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
			   sql="use esports";
			   con.createStatement().execute(sql);
			   PreparedStatement pstmt = con.prepareStatement(sql);
			   ResultSet tmp =pstmt.executeQuery();
			   
			   sql = "SELECT * FROM `product`"; 
			   pstmt = con.prepareStatement(sql);
			   tmp=pstmt.executeQuery();
		   while(tmp.next())
			{
			   
			   String product_id=request.getParameter("product_id");

			   sql = "DELETE FROM `product` WHERE `product_id`='"+product_id+"'";
			   pstmt = con.prepareStatement(sql);
			   pstmt.execute();
				
			   con.close();//結束資料庫連結
			
		   
			   out.println("<script>self.location=document.referrer; alert('商品刪除成功');</script>") ;
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