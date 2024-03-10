<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<title>recordOrder</title>
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
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
           sql="use esports";
           con.createStatement().execute(sql);
           //從表格傳遞中文到資料庫, 必須使用getBytes("ISO-8859-1")編碼
		

		
		
		sql = "SELECT * FROM `cart`, `product` WHERE `product`.`product_id` = `cart`.`product_id` AND `member_mail`='" +session.getAttribute("member_mail")+"'"; 
		ResultSet tmp =con.createStatement().executeQuery(sql);
		String p = request.getParameter("p");
		sql="SELECT * FROM `product` WHERE product_id='"+p+"'";
		
		while(tmp.next())
		{
			String sendname=request.getParameter("member_name");
	        String sendphone=request.getParameter("member_phone");
			String sendaddress=request.getParameter("member_address");
	        String payment=request.getParameter("payment");
			String card_id=request.getParameter("card_id");
			java.sql.Date orderdate=new java.sql.Date(System.currentTimeMillis());
			java.sql.Time time = new java.sql.Time(System.currentTimeMillis());
			String cart_id = tmp.getString("cart_id");
	        String member_mail = tmp.getString("member_mail");
	        String product_id = tmp.getString("product_id");
	        String product_name = tmp.getString("product_name");
			int cart_quantity = Integer.parseInt(tmp.getString("cart_quantity"));
	        String product_price = tmp.getString("product_price");
			int product_stock = Integer.parseInt(tmp.getString("product_stock"));
			String order_id = request.getParameter("order_id");
			int product_sales = Integer.parseInt(tmp.getString("product_sales"));
			if((cart_quantity)>(product_stock))//下訂數量大於庫存
	{%>
	<script type="text/javascript" language="javascript">
	alert("庫存數量不足");
	window.document.location.href="allgoods.jsp";
	</script> 

	<%
	}else{
			
            sql = "INSERT into `order`(`cart_id`,`member_mail`,`product_id`,`product_name`,`cart_quantity`,`product_price`,`product_stock`,`sendname`,`sendphone`,`sendaddress`,`orderdate`,`payment`,`card_id` ,`order_id`,`time`)";
            sql+="VALUES ('"+cart_id+"', "; 
			sql+="'" +member_mail+ "', ";			
            sql+="'" +product_id+ "', ";
            sql+="'"+product_name+"', ";
            sql+="'"+cart_quantity+"', ";
            sql+="'"+product_price+"', ";
			sql+="'"+product_stock+"', ";
            sql+="'"+sendname+"', ";  
            sql+="'"+sendphone+"', "; 
			sql+="'"+sendaddress+ "', "; 
			sql+="'"+orderdate+"', "; 
            sql+="'"+payment+"', ";  
			sql+="'"+card_id+"', ";
			sql+="'"+order_id+"', ";
			sql+="'"+time+"') ";
            con.createStatement().execute(sql);
								
			int inv = (Integer.valueOf(product_stock) - Integer.valueOf(cart_quantity));
			sql = " UPDATE `product` SET `product_stock` = '"+inv+"' WHERE `product_id` = '"+product_id+"'";
			con.createStatement().executeUpdate(sql);

			int sto = (Integer.valueOf(product_sales) + Integer.valueOf(cart_quantity));
			sql = " UPDATE `product` SET `product_sales` = '"+sto+"' WHERE `product_id` = '"+product_id+"'";
			con.createStatement().executeUpdate(sql);
			
			int totalprice = ((Integer.valueOf(product_price)*Integer.valueOf(cart_quantity)));
			sql = " UPDATE `order` SET `totalprice` = '"+totalprice+"' WHERE `member_mail` = '"+member_mail+"' AND `cart_id`='"+cart_id+"'";
			con.createStatement().executeUpdate(sql);
			
			sql = "DELETE FROM `cart` WHERE `member_mail` = '"+member_mail+"'";
			con.createStatement().executeUpdate(sql);
			
			}
		}
 //Step 6: 關閉連線
           response.sendRedirect("member.jsp");
		   con.close();
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
  </body>
</html>