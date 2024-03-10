<%@ page language="java" import="java.util.*, java.sql.*, java.text.*" pageEncoding="UTF-8"%>
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

	String product_id = request.getParameter("product_id");
    String product_name = request.getParameter("product_name");
    String product_intro = request.getParameter("product_intro");
	int product_price = Integer.parseInt(request.getParameter("product_price"));
    int product_stock = Integer.parseInt(request.getParameter("product_stock"));
	String product_host = request.getParameter("product_host");
	String product_type = request.getParameter("product_type");
	String product_sales = request.getParameter("product_sales");
	String add = request.getParameter("add");

    sql = "INSERT INTO `product` (`product_id`, `product_name`, `product_intro`, `product_price`, `product_stock`, `product_host`, `product_type`,`product_sales`, `add`)";
	
	 
 	sql+="VALUES ('" + product_id + "', ";
    sql+="'"+product_name+"', ";
    sql+="'"+product_intro+"', ";
    sql+="'"+product_price+"', ";   
	sql+="'"+product_stock+"', "; 
	sql+="'"+product_host+"', "; 
	sql+="'"+product_type+"', "; 
	sql+="'"+product_sales+"', "; 
	sql+="'"+add+"')";
        
	session.setAttribute("product_id",product_id);
        
	con.createStatement().execute(sql);
//Step 6: 關閉連線
	   con.close();
	  
//Step 5: 顯示結果 
	  //直接顯示最新的資料
	   response.sendRedirect("admin_goods.jsp");
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