<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%@ page import = "java.io.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>購物車</title>
  <link rel="stylesheet" type="text/css" href="assets/css/header.css">
  <link rel="stylesheet" text="text/css" href="assets/css/car.css">
</head>

<body>
  <!-- 登入/註冊表單 開始-->
  <div id="id01" class="modal ">
    <div class="animate" style="display: flex; justify-content: center;">
      <form class="modal-content " action="check.jsp" method="post">
        <div class="imgcontainer">
          <span onclick="document.getElementById('id01').style.display='none'" class="close"
            title="關閉此視窗">&times;</span>
          <p style="font-size: 25px;">請先登入</p>
        </div>

        <div class="container">
          <label for="uname"><b>帳號(電子郵件)</b></label>
          <input type="text" placeholder="請輸入電子郵件" name="member_mail" required>

          <label for="psw"><b>密碼</b></label>
          <input type="password" placeholder="請輸入密碼" name="member_password" required>

          <button type="submit">登入</button>
          <button type="button" onclick="document.getElementById('id01').style.display='none'"
            class="cancelbtn">取消</button>
          <img src="assets/images/welcomTo-removebg-preview.png" alt="welcome">
        </div>
      </form>
    </div>
  </div>
  <div id="id02" class="modal ">
    <div class="animate" style="display: flex; justify-content: center;">
      <form class="modal-content " action="signup.jsp" method="post">
        <div class="imgcontainer">
          <span onclick="document.getElementById('id02').style.display='none'" class="close"
            title="關閉此視窗">&times;</span>
          <p style="font-size: 25px;">新會員? 請先註冊</p>
        </div>

        <div class="container">
          <label for="uname"><b>姓名</b></label>
          <input type="text" placeholder="請輸入姓名" name="member_name" required>
          <div class="congender">性別
            <input type="radio" name="member_gender" value="female" class="rr" checked>女
            <input type="radio" name="member_gender" value="male" class="rr">男
          </div>
          <div style="width: 100%;">
            <label for="birth"><b>生日</b></label>
            <input type="date" name="member_birth">
          </div>
          <label for="phonenum"><b>手機號碼</b></label>
          <input type="tel" placeholder="請輸入電話" name="member_phone" required>
          <span><b>地址</b></span>
          <input type="text" name="member_address" placeholder="請輸入地址" required>
          <label for="mail"><b>電子信箱</b></label>
          <input type="email" name="member_mail" placeholder="請輸入你的電子信箱" required>
          <label for="psw"><b>密碼</b></label>
          <input type="password" placeholder="請輸入密碼" name="member_password" required>

          <button type="submit">註冊</button>
          <button type="button" onclick="document.getElementById('id02').style.display='none'"
            class="cancelbtn">取消</button>
        </div>
      </form>
    </div>
  </div>
  <!-- 登入/註冊表單 結束 -->

  <div class="ALL">
    <!-- header選單開始 -->
    <div id="main">
      <div class="topnav">
        <div class="myTopnav">
          <div class="imgNav">
		  <%
	String host[] = {"PS5", "Switch", "Xbox"};
	int i =0;
    %>
            <a href="index.jsp"><img src="assets/images/theme.png" alt="玩童"></a>
            <a href="allgoods.jsp?h=<%=host[0]%>" class="active"><img src="assets/images/ps5.png">PS5</a>
            <a href="allgoods.jsp?h=<%=host[1]%>"><img src="assets/images/switch.png" style="margin-right: 2px;">switch</a>
            <a href="allgoods.jsp?h=<%=host[2]%>"><img src="assets/images/xbox.png" style="margin-right: -10px;">Xbox</a>
            <a href="aboutus.jsp"><img src="assets/images/team.png" style="width: 52px;margin-right: 5px;">About us</a>
          </div>
          <div class="MemCartSearch">
            <div class="MemberCart">
              <%if(session.getAttribute("member_mail") == null)
              {%>
                <!-- 尚未登入就顯示下面兩個button-->
                <button onclick="document.getElementById('id01').style.display='block'">登入</button>
                <button>/</button><button onclick="document.getElementById('id02').style.display='block'">註冊</button>       
               <%}
              else
              {%>
              <!-- 已登入就顯示下面的button-->
              <div class="dropdown">
              <button style="padding: 0%;" class="dropbtn"><img style="cursor: pointer;" src="assets/images/user.png">
              </button>
               
              <div class="dropdown-content">
                 <a href="member.jsp">會員中心</a>
                <!-- 這邊是登出 -->
                <form action="logout.jsp" method="post">
              <input type="submit" value="登出" class="logout">
                </form>
             </div>
           </div>
             <%}%>
              <a href="car.jsp" style="padding: 0%;"><img style="cursor: pointer;"
                  src="assets/images/shopping-cart.png"></a>
            </div>
            <div class="search-container">
              <form action="search.jsp" style="display: flex; align-items: center; justify-content: flex-end;">
                <input type="text" class="searchText" placeholder="Search.." name="search">
                <button type="submit"><img src="assets/images/search.png" width="15px"></button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- header選單結束 -->
    <!-- 內文開始 -->
	<%
   	if (session.getAttribute("member_mail") == null)
    {
        %>
        	<script>
        		alert("請先登入會員!");
        		location.replace("index.jsp");
        	</script>
        <%        
        return;
    }
	Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    PreparedStatement pstmt = null;
	ResultSet rs = null;
	sql = "SELECT * FROM `member` WHERE `member_id` = '" + session.getAttribute("member_id") + "'";
    rs = stmt.executeQuery(sql);
	rs.next();
%>
    <div class="mb1">
      <h1>購物車</h1>
    </div>
	<%
		   sql="SELECT * FROM `cart` WHERE `member_mail`='" +session.getAttribute("member_mail")+"'"; 
		   rs = stmt.executeQuery(sql);
		   rs.last();
		   if (rs.getRow() == 0){
			   %> <div class="ForNo">
					<div class="hero-image">
						<div class="hero-text">
							<h1>購物車尚無商品</h1>
							<p>點選去逛逛吧</p>
							  <a href="index.jsp"><button>Home</button></a>
							  <a href="allgoods.jsp?h=<%=host[0]%>"><button>PS5</button></a>
							  <a href="allgoods.jsp?h=<%=host[1]%>"><button>switch</button></a>
							  <a href="allgoods.jsp?h=<%=host[2]%>"><button>Xbox</button></a>
						</div>
					</div>
				</div><%
		   }else{%>
    <div class="C-all">
      <div class="C-a">
	  <%
				int a=0;
				int discount = 0;
				rs.beforeFirst();
				while(rs.next())
                {%>
		
        <div class="CC">
          <div class="car">
			
            <div class="imag">
              <a href="good.jsp?p=<%=rs.getString(3)%>"><img src="assets/images/<%=rs.getString(3)%>-1.jpg" class="popo"></a>
            </div>
            <div class="int1">
              <p class="bbb"><%=rs.getString(4)%></p>
              <div class="int2">
			    <form  method="post" action="cart_quantity.jsp">
                <div class="qq">
                  <p class="aaa">數量: </p>

                  <input type="hidden" name="product_id" value="<%=(rs.getString(3))%>">
        <input type="hidden" name="product_stock" value="<%=(rs.getString(7))%>">
        <input type="hidden" name="product_price" value="<%=(rs.getString(6))%>">
        
                  <input type="submit" value="-"  onclick="jian(this)" class="but" style="margin-left: 20px;" name="num">
                  <input type="number" value="<%=rs.getString(5)%>" class="qqq" name="cart_quantity" readonly>
                  <input type="submit" value="+" onclick="jia(this)" class="but" name="num">
                </div>
        
				</form>
                <script>
                  /* function jia(me) {

                   var td = me.parentNode;

                    var inputs = td.getElementsByTagName("input"); // 找到此td下所有input標籤

                    // inputs[1].value = inputs[1].value - 0 + 1; // 用-0的辦法轉為數字

                    // parseInt 將字串轉整數 parseFloat 將字串轉小數

                    inputs[1].value = parseInt(inputs[1].value) + 1;

                    calculate();

                  }*/

                  // 減少商品數量


                  function jian(me) { 

                   /* var td = me.parentNode;

                    var num = td.querySelector("input[type=number]"); // 只查詢有type=number屬性的input標籤

                    var r = num.value - 1;

                    if (r >= 1) { // 只有減得的結果是大於等於1的情況下才需要改變文字框的值

                      num.value = r;

                      calculate();
						}
                    }*/

                  
                </script>
                <p class="aaa">$<%=Integer.parseInt(rs.getString(5))*Integer.parseInt(rs.getString(6))%></p>
				<input type="hidden" value="<%=a+=Integer.parseInt(rs.getString(5))*Integer.parseInt(rs.getString(6))%>">
				<input type="hidden" name="cart_id" value="<%=(rs.getString(1))%>">
              </div>

            </div>
			<form name="form1" method="post" action="deletegood.jsp" >
            <div  class="amanda">
              <input type="submit" class="cancel" value="X">
            </div>
			<input type="hidden" name="cart_id" value="<%=(rs.getString(1))%>">
			<input type="hidden" name="member_mail" value="<%=(rs.getString(2))%>">
			<input type="hidden" name="product_id" value="<%=(rs.getString(3))%>">
			<input type="hidden" name="product_name" value="<%=(rs.getString(4))%>">
			<input type="hidden" name="cart_quantity" value="<%=(rs.getString(5))%>">
			<input type="hidden" name="product_price" value="<%=(rs.getString(6))%>">
			<input type="hidden" name="product_stock" value="<%=(rs.getString(7))%>">
			</form>
          </div>
        </div>
		
		<%}%>
      </div>
	  <%
		discount=(a/10000)*1000;
	  %>
      <div class="T-all">
        <div class="T-total">
          <p class="T-word">商品總計:NT:<%=a%>元</p>
          <p class="T-word">商品運費:NT:0元</p>
		  <p class="T-word">商品折扣:NT:<%=discount%>元</p>
          <p class="T-word">總價:NT:<%=a-discount%>元</p>
        </div>
		
        <div class="button"><a href="cart.jsp"><input type="submit" value="前往結帳" class="mm_but01"></a></div>
        
		<div class="buybuy">
          <div>
            <img src="assets/images/buy.png" class="frog">
          </div>
        </div>
      </div>
    </div><%}%>
    <%
String thePath=request.getRealPath("/")+"pro0609" ; 

//getRealPath表本網頁所在的根目錄
File count=new File(thePath,"count.txt");//要事先建立
BufferedReader count_in=new BufferedReader(new FileReader(count));//建立檔案輸入串流
String strNo=(String)session.getAttribute("x");
int x=Integer.parseInt(count_in.readLine());//使用readLine讀取檔案, 格式為字串
count_in.close();//關閉輸入串流
//計數器加1
if (session.isNew())
     x++;
session.setAttribute("x", strNo);%>
    <div class="footer">
      <p>已瀏覽人數：<%=x%> 人</p>
      <p>版權所有© 2021 玩童</p>
    </div>
  </div>
<% FileWriter count_out=new FileWriter(count);
count_out.write(String.valueOf(x));//將數字轉成字串,寫入輸出串流

count_out.flush();//將buffer寫入
count_out.close();//關閉串流
%>

</body>

</html>