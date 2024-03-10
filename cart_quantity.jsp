<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@include file="config.jsp" %>
<%@ page import = "java.io.*"%>

		<%
sql = "SELECT * FROM `cart` "; 
		   PreparedStatement pstmt = con.prepareStatement(sql);
		   ResultSet tmp =pstmt.executeQuery();

			 pstmt = con.prepareStatement(sql);
		   tmp=pstmt.executeQuery();

		   String product_id = request.getParameter("product_id");
				String num =request.getParameter("num");

				int product_stock = Integer.parseInt(request.getParameter("product_stock"));
				int cart_quantity = Integer.parseInt(request.getParameter("cart_quantity"));

					if(cart_quantity>=(product_stock) && num.equals("+"))
					{}else if(num.equals("+")){
					cart_quantity++;
				}
						
					if(cart_quantity==1 && num.equals("-"))
					{}else if(num.equals("-")){
					cart_quantity--;
				}
			
				sql = " UPDATE `cart` SET `cart_quantity` = '"+cart_quantity+"' where `product_id`  = '"+product_id+"'";
				pstmt = con.prepareStatement(sql);
				pstmt.execute();
	

				con.close();//結束資料庫連結
					
				   
				response.sendRedirect("car.jsp");
		
				

		%>
