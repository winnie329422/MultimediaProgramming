<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@include file="config.jsp" %>
<%@ page import = "java.io.*"%>
<%
if (session.getAttribute("admin_id") == null)
    {
        %>
        	<script>
        		alert("請先登入");
        		location.replace("admin.jsp");
        	</script>
        <%        
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="assets/css/header.css">
  <link rel="stylesheet" type="text/css" href="assets/css/adorder.css">
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
  <title>玩童後台</title>
</head>

<body>
  <div class="ALL">
    <!-- 後台header開始 -->
    <div id="main">
      <div class="topnav">
        <div class="myTopnav">
          <div class="imgNav" style="padding: 20px;">
            <a style="margin: 0px 30px;" href="admin_goods.jsp">修改/刪除商品</a>
            <a style="margin: 0px 40px;" href="admin_AddGoods.jsp" class="active">新增商品</a>
            <a style="margin: 0px 30px;" href="admin_Order.jsp">看看訂單</a>
            <form action="AdminLogout.jsp" method="post">
            <input style="padding: 5px 15px; font-size: 15px;" type="submit" value="登出">
          </form>
          </div>
        </div>
      </div>
    </div>
    <!-- 後台header結束 -->
    <div class="tab">
      <table class="winnie">
        <tr class="orderrr">
          <th>訂單日期</th>
          <th>訂單編號</th>
          <th>收件地址</th>
          <th>購買人</th>
          <th>電話</th>
          <th>訂單品項</th>
          <th>刪除</th>
        </tr>
        
        <%
        sql = "SELECT * FROM `order` GROUP BY `time`" ;
        ResultSet rs =con.createStatement().executeQuery(sql);
        while (rs.next())
        {     
          String time = rs.getString("time");
          String order_id = rs.getString("order_id");
          %> <form method="post" action="DeleteOrders.jsp">      		
        <tr class="orderr">
          <td><%= rs.getString(13) %></td>
          <td><%= rs.getString(1) %></td>
          <td><%= rs.getString(12) %></td>
          <td><%= rs.getString(10) %></td>
          <td><%= rs.getString(11) %></td>
          <td>
          <%
          
          sql="SELECT * FROM `order` WHERE `time`='" +time+"' AND `order_id`='"+order_id+"'"; 
		  ResultSet cc=con.createStatement().executeQuery(sql);
		   while(cc.next()){ %>
          <%= cc.getString(5) %> * <%= cc.getString(6) %><br>
         <%}%>
        </td>
          <td>   
      <input type="hidden" name="cart_id" value="<%=(rs.getString(2))%>">
		  <input type="hidden" name="delete" value="<%=rs.getString(16)%>"/>
      <input type="hidden" name="product_id" value="<%=rs.getString(4)%>"/>
      <input type="hidden" name="time" value="<%=rs.getString(17)%>"/>
      
              <input type="submit" value="刪除訂單" class="dele" />
             </form> <%}%>
      
            
          </td>
          
        </tr>
      </table>
    </div>
  </div>
</body>

</html>