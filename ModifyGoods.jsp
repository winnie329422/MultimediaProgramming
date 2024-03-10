<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8");%>
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

		   String product_id=request.getParameter("product_id");
		   String product_name=request.getParameter("product_name");
		   String product_intro=request.getParameter("product_intro");
		   int product_price = Integer.parseInt(request.getParameter("product_price"));
           int product_stock = Integer.parseInt(request.getParameter("product_stock"));
		   String product_host=request.getParameter("product_host");
		   String product_type=request.getParameter("product_type");
		   String add=request.getParameter("add");
		   
//Step 4: 執行 SQL 指令	
sql = "UPDATE `product` SET `product_name`='"+product_name+"',`product_price`='"+product_price+"',`product_intro`='"+
      product_intro+"',`product_host`='"+product_host+"',`product_type`='"+product_type+"',`product_stock`='"+product_stock+"',`add`='"+add+"' WHERE product_id ='"+product_id+"'";
con.createStatement().execute(sql);


			con.close();//結束資料庫連結
			
		   
		   response.sendRedirect("admin_goods.jsp");
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
