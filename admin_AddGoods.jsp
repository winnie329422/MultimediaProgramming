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
  <link rel="stylesheet" type="text/css" href="assets/css/admin_AddGoods.css">
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
            <input style="padding: 5px 15px; font-size: 15px; margin-top: -1px;" type="submit" value="登出">
          </form>
          </div>
        </div>
      </div>
    </div>
    <!-- 後台header結束 -->
    <table>
      <!-- 如果編號是使用AI，下面第一個tr就不用了 -->
      <form action="AddGoods.jsp" method="POST">
      <tr>
        <td>編號</td>
        <td><input type="text" name="product_id" required></td>
      </tr>
      <tr>
        <td>名稱</td>
        <td><input type="text" name="product_name" required></td>
      </tr>
      <tr>
        <td>圖片</td>
        
        <td class="choose">
          <div>
            <input id="input_file1_1" class="input_file midden" type="file" name="product_img" >
            <img id="img_file1_1" src="assets/images/choose.png">
          </div>

          <div>
            <input id="input_file1_2" class="input_file midden" type="file" name="product_img" >
            <img id="img_file1_2" src="assets/images/choose.png">
          </div>

          <div>
            <input id="input_file1_3" class="input_file midden" type="file" name="product_img" >
            <img id="img_file1_3" src="assets/images/choose.png">
          </div>
        </td>
        
      </tr>
      <tr>
        <td>價格</td>
        <td><input type="text" name="product_price" required></td>
      </tr>
      <tr>
        <td>摘要</td>
        <td><input type="text" name="product_intro" required></td>
      </tr>
      <tr>
        <td>庫存</td>
        <td><input type="text" name="product_stock" required></td>
      </tr>
      <tr>
        <td>類別</td>
        <td><select name="product_host">
            <option name="product_host" value="switch">
              switch
            </option>
            <option name="product_host" value="PS5">
              PS5
            </option>
            <option name="product_host" value="Xbox">
              Xbox
            </option>
          </select></td>
      </tr>
      <tr>
        <td>類型</td>
        <td><select name="product_type">
            <option value="main">
              main
            </option>
            <option value="other">
              other
            </option>
          </select></td>
      </tr>
      <input type="hidden" name="add" value="null">
	  <input type="hidden" name="product_sales" value="0">
    </table>
     <input type="submit" value="新增" />
</form>

  
  </div>
</body>

</html>