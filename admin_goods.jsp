<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8");%>
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
  <link rel="stylesheet" type="text/css" href="assets/css/admin_goods.css">
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
    <table>
      <th>編號</th>
      <th>名稱</th>
      <th>圖片</th>
      <th>價格</th>
      <th>摘要</th>
      <th>庫存</th>
      <th>類別</th>
      <th>類型</th>
      <th>上架</th>
      <th>修改/刪除</th>
      <!-- 第一筆商品開始 -->
      
        
        <%
        String db_user="root";
        String db_pwd="1234";
        String db_database="esports";
        Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db_database+"?user="+db_user+"&password="+db_pwd+"&useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC");

        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);

        String sql="select * from product";
        ResultSet rs = stmt.executeQuery(sql);
        int index = 1;
        while (rs.next())
        {     
          %>
        <form action="ModifyGoods.jsp" method="post">    
          
        <tr>
          <td>
            <input type="text" name="product_id" id="product_id" readonly="readonly" value="<%= rs.getString(1) %>"></td>
          </td>
          <td><input type="text" name="product_name" id="product_name" value="<%= rs.getString(2) %>"></td>
          <td class="choose">
            
            <div>
              <input id="input_file1_1" class="input_file midden" type="file" value="選擇檔案" style="width:70px;"/> <%=rs.getString(1)%>-1.jpg<br>
              <img id="img_file1_1" src="assets/images/<%=rs.getString(1)%>-1.jpg">
            </div>

            <div>
              <input id="input_file1_2" class="input_file midden" type="file" value="選擇檔案" style="width:70px;"/> <%=rs.getString(1)%>-2.jpg<br>
              <img id="img_file1_2" src="assets/images/<%=rs.getString(1)%>-2.jpg">
            </div>

            <div>
              <input id="input_file1_3" class="input_file midden" type="file" value="選擇檔案" style="width:70px;"/> <%=rs.getString(1)%>-3.jpg<br>
              <img id="img_file1_3" src="assets/images/<%=rs.getString(1)%>-3.jpg">
            </div>

          </td>
          <td><input type="text" name="product_price" id="product_price" value="<%= rs.getString(3) %>"></td>
          <td><input type="text" name="product_intro" id="product_intro" value="<%= rs.getString(5) %>"></td>
          <td><input type="text" name="product_stock" id="product_stock" value="<%= rs.getString(4) %>"></td>

          <td><select name="product_host">
          <option name="product_host" value="switch" <%= rs.getString(6).equals("switch") ? "selected = 'selected'" : "" %>>
              switch
          </option>
          <option name="product_host" value="PS5" <%= rs.getString(6).equals("PS5") ? "selected = 'selected'" : "" %>>
            PS5
          </option>
          <option name="product_host" value="Xbox" <%= rs.getString(6).equals("Xbox") ? "selected = 'selected'" : "" %>>
            Xbox
          </option>     
            </select>
          </td>

          <td><select name="product_type">
            <option name="product_type" value="main" <%= rs.getString(7).equals("main") ? "selected = 'selected'" : "" %>>
              main
          </option>
          <option name="product_type" value="other"<%= rs.getString(7).equals("other") ? "selected = 'selected'" : "" %>>
            other
          </option>

            </select>
          </td>
			
                    <%if (rs.getString(9).equals("v")){%>
                       <td><input type="checkbox" id="box" name="add"  value="v" class="checkbox_add" checked></td>
                          <%}else{%>
                       <td><input type="checkbox" id="box" name="add"  value="null" class="checkbox_add"></td>
                        <%}%>
                       
          <td valign="center" class="admin_good">
            <input type="submit" value="修改" />
      </form>
      <form action="DeleteGoods.jsp" method="post">
        <input type="hidden" name="product_id" value="<%= rs.getString(1) %>" />
        <input type="submit" value="刪除" />
      </form>
      <%}%>
      </td>
      </tr>
      <!-- 第一筆商品結束 -->
      <!-- 第二筆商品開始 -->
      <!--<form action="" method="post">
        <tr>
          <td>
            <p>2</p>
          </td>
          <td><input type="text" value="switch"></td>
          <td class="choose">
            <div>
              <input id="input_file1_1" class="input_file midden" type="file" required>
              <img id="img_file1_1" src="assets/images/choose.png">
            </div>

            <div>
              <input id="input_file1_2" class="input_file midden" type="file" required>
              <img id="img_file1_2" src="assets/images/choose.png">
            </div>

            <div>
              <input id="input_file1_3" class="input_file midden" type="file" required>
              <img id="img_file1_3" src="assets/images/choose.png">
            </div>
          </td>
          <td><input type="text" value="6000"></td>
          <td><input type="text" value="最新款式，附手把"></td>
          <td><input type="text" value="20"></td>
          <td><select name="type">
              <option value="switch">
                switch
              </option>
              <option value="PS5">
                PS5
              </option>
              <option value="Xbox">
                Xbox
              </option>
            </select>
          </td>
          <td><input type="checkbox"></td>
          <td valign="center" class="admin_good">
            <input type="submit" value="修改" />
      </form>
      <form action="" method="post">
        <input type="submit" value="刪除" />
      </form>
      </td>
      </tr>
      第二筆商品結束 -->
    </table>
  </div>
  <script>

      $(function(){
    		$(".checkbox_add").change(function(){
    			if ($(this).prop("checked"))
    			{
    				$(this).val("v");
    			}
    			else 
    			{
    				$(this).val("null");	
    			}
    		})
    	})
		

  </script>
</body>

</html>