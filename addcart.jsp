<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8");%>


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
		   sql = "SELECT * FROM `cart` WHERE `member_mail`='" +session.getAttribute("member_mail")+"'"; 
		   ResultSet tmp =con.createStatement().executeQuery(sql);
           //從表格傳遞中文到資料庫, 必須使用getBytes("ISO-8859-1")編碼
		String product_id = request.getParameter("product_id");//商品number
		String product_name = request.getParameter("product_name");//商品名稱
		String product_price = request.getParameter("product_price");//商品價格
		int product_stock = Integer.parseInt(request.getParameter("product_stock"));//庫存
		int cart_quantity = Integer.parseInt(request.getParameter("cart_quantity"));//消費者選取數量
		String member_mail=(String)session.getAttribute("member_mail");//消費者信箱
		if(session.getAttribute("member_mail") == null)
  {%>
				<script>
					alert("請先登入會員!");
					location.replace("index.jsp");
				</script>
			<%}
		while(tmp.next()){
		if (tmp.getString("product_id").equals(product_id))
		{
			%>
				<script>
					alert("此商品已存在於購物車");
					location.replace("good.jsp?p=<%=product_id%>")
				</script>
			<%
			return;
		}
	}
	if((cart_quantity)>(product_stock))//下訂數量大於庫存
	{%>
	<script type="text/javascript" language="javascript">
	alert("庫存數量不足");
	location.replace("good.jsp?p=<%=product_id%>")
	</script> 

	<%
	}
    
	else
	{ 
//Step 4: 執行 SQL 指令	
           sql = "INSERT into `cart` (member_mail,product_id,product_name,cart_quantity,product_price,product_stock)";
		   sql+="VALUES ('" +member_mail+ "', ";			
		   sql+="'" +product_id+ "', ";
		   sql+="'"+product_name+"', ";
		   sql+="'"+cart_quantity+"', ";
		   sql+="'"+product_price+"', ";
		   sql+="'"+product_stock+"') ";
           con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();%>
		   <script>
	alert("成功加入購物車");
	location.replace("good.jsp?p=<%=product_id%>")
</script>
		   <%
		 }
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


