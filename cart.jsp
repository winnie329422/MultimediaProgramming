<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%@ page import = "java.io.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>購物車確認</title>
  <link rel="stylesheet" type="text/css" href="assets/css/header.css">
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
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
    <div class="mb2">
      <h1>購物車確認</h1>
    </div>
	
    <div class="fuck1">
	
	<%
    if(session.getAttribute("member_mail") != null ){
      sql = "SELECT * FROM `member` WHERE `member_mail`='" +session.getAttribute("member_mail")+"';"; 
    ResultSet rs =con.createStatement().executeQuery(sql);
    String member_name="", member_phone="",member_address="";
    
    while(rs.next()){
      member_name=rs.getString("member_name");
      member_phone=rs.getString("member_phone");
      member_address=rs.getString("member_address");
    %>
      <div class="C-people">
        <div class="qwertt">

          <p class="bikbox">填寫資料</p>

        </div>
		<form action="recordIntoOrder.jsp" method="post">
        <div class="CC C-name">
          <span>收件人姓名 :</span>
          <input type="text" required placeholder="姓名" value="<%=member_name%>" name="member_name" />
        </div>
        <div class="CC C-phone">
          <span>收件人電話 : </span>
          <input type="text" required placeholder="電話" value="<%=member_phone%>" name="member_phone"/>
        </div>
        <div class="CC C-address">
          <span>收件人地址 : </span>
          <input type="text" required placeholder="Address" value="<%=member_address%>" name="member_address">
        </div>
        <div class="CC C-pay">

          <span>付款的方式 : </span>
          <div class="pay">
            <input type="radio" name="payment" value="貨到付款" class="r1" checked onclick="noCardPay()">貨到付款
            <input type="radio" name="payment" value="信用卡支付" class="r1" onclick="showCardPay()">信用卡支付
          </div>
        </div>
        <!-- 當信用卡支付被選擇時: -->
        <div class="CC C-num">
          <span>信用卡卡號 :</span>
          <input type="text" required placeholder="卡號" value="12345678" name="card_id" />
        </div>
        <!-- 被包著的這個東西就要出現 -->
      </div>
	  
      <div class="CC1">
        <div class="qwert">

          <p class="bikbox">確認訂單</p>

        </div>
		<%sql="SELECT * FROM `cart` WHERE `member_mail`='" +session.getAttribute("member_mail")+"'"; 
           ResultSet ss=con.createStatement().executeQuery(sql);
		   ss=con.createStatement().executeQuery(sql);%>
		   
        <div class="car1">
		<%
				int a=0;
				int discount = 0;
				while(ss.next())
                {%>
          <p class="aa"><%=ss.getString(4)%> X<%=ss.getString(5)%> = <%=Integer.parseInt(ss.getString(5))*Integer.parseInt(ss.getString(6))%>元</p>
          <input type="hidden" value="<%=a+=Integer.parseInt(ss.getString(5))*Integer.parseInt(ss.getString(6))%>">
		  <input type="hidden" name="cart_id" value="<%=(ss.getString(1))%>">
		  
		  <%}%>
          <!-- <p class="aa"></p> -->
        </div>
			<input type="hidden" name="order_id" value="<%=a%>">

		<%
		discount=(a/10000)*1000;
	  %>
        <div class="T-allohoh">
          <div class="T-total">
            <p class="T-word">商品總計:NT:<%=a%>元</p>
            <p class="T-word">商品運費:NT:0元</p>
			<p class="T-word">商品折扣:NT:<%=discount%>元</p>
            <p class="T-word">總價:NT:<%=a-discount%>元</p>
          </div>

          <div class="button"><input type="submit" value="送出帳單" class="bbcho"></div>
		  </form>
        </div>

      </div>
	  <%
      }
      con.close();//結束資料庫連結
}
else{
	con.close();//結束資料庫連結
}
%>
	
    </div>
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

  <script>
    function showCardPay() {
      $('.C-num').css({
        'display': 'flex'
      })
    }

    function noCardPay() {
      $('.C-num').css({
        'display': 'none'
      })
    }
  </script>

</body>

</html>