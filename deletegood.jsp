<!-- Step 0: import library -->
<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<html>
<head>
<title>deletegood</title>
</head>
<body>
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
		   pstmt.execute();
		   String cart_id=request.getParameter("cart_id");

//Step 4: 執行 SQL 指令	
			sql = "DELETE FROM `cart` WHERE `cart_id` = '"+cart_id+"' ";
			pstmt = con.prepareStatement(sql);
			pstmt.execute();
			//int rec = con.createStatement().executeUpdate(sql);
			
			con.close();//結束資料庫連結
			
		   
		   response.sendRedirect("car.jsp");
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
</body>
</html>
