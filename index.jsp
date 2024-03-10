<%@ page language="java" import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>
<%@ include file="config.jsp" %>
<%@ page import = "java.io.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="assets/css/header.css">
  <link rel="stylesheet" type="text/css" href="assets/css/index.css">
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
  <script type="text/javascript" src="assets/js/header.js"></script>
  <title>玩童</title>
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
    <!-- 首頁大圖slider -->
    <div style="display: flex; flex-direction: column; align-items: center;">
      <div class="slideshow-container">
        <div class="mySlides fade">
          <img src="assets/images/slide1.png" class="wid">
        </div>
        <div class="mySlides fade">
          <img src="assets/images/slide2.png" class="wid">
        </div>
        <div class="mySlides fade">
          <img src="assets/images/slide3.png" class="wid">
        </div>
		<div class="mySlides fade">
          <img src="assets/images/slide4.png" class="wid">
        </div>
        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>
      </div>
      <div class="ali">
        <span class="dot" onclick="currentSlide(1)"></span>
        <span class="dot" onclick="currentSlide(2)"></span>
        <span class="dot" onclick="currentSlide(3)"></span>
		<span class="dot" onclick="currentSlide(4)"></span>
      </div>
      <!-- 首頁大圖slider 結束 -->
      <!-- 熱門商品開始 -->
      <div class="hotGoods">
        <div style="display: flex; justify-content: center;">
          <h1><img src="assets/images/left1.png" class="top arr">熱門商品<img src="assets/images/right1.png"
              class="top arrr"></h1>
        </div>

        <div class="LotOfGood">
          <!-- 第二名 -->
		<%
			sql="SELECT * FROM `product` WHERE `add`='v' and `product_sales` < (select MAX(`product_sales`) from `product` ) ORDER BY `product_sales` DESC LIMIT 1";
			ResultSet rs=con.createStatement().executeQuery(sql);
			while(rs.next()){
		%>
          <div class="Agood" onclick="location.href='good.jsp?p=<%=rs.getString(1)%>'">
            <div class="con">
              <div class="hover-box">
                <div class="img-box">
                  <div class="sameHeight"><img src="assets/images/<%=rs.getString(1)%>-1.jpg" alt="switch lite" style="width:100%">
                  </div>
                </div>
                <div class="info-box">
                  <div class="info-content">
                    <span>
                      <h2><%=rs.getString(2)%></h2>
                      <p class="price">NT$ <%=rs.getString(3)%></p>
                    </span>
                  </div>
                </div>
              </div>
            </div>
            <span class="No2"><img src="assets/images/Top2.png"></span>
		</div><%}%>
          <!-- 第一名 -->
		<%
			sql="SELECT * FROM `product` WHERE `add`='v' ORDER BY `product_sales` DESC LIMIT 1 ";
			ResultSet ss=con.createStatement().executeQuery(sql);
			while(ss.next()){
		%>
          <div class="Agood" onclick="location.href='good.jsp?p=<%=ss.getString(1)%>'">
            <div class="con">
              <div class="hover-box">
                <div class="img-box">
                  <div class="sameHeight"><img src="assets/images/<%=ss.getString(1)%>-1.jpg" alt="switch lite" style="width:100%">
                  </div>
                </div>
                <div class="info-box">
                  <div class="info-content">
                    <span>
                      <h2><%=ss.getString(2)%></h2>
                      <p class="price">NT$ <%=ss.getString(3)%></p>
                    </span>
                  </div>
                </div>
              </div>
            </div>
            <span class="No1"><img src="assets/images/Top1.png"></span>
          </div><%}%>
          <!-- 第三名 -->
		<%
			sql="SELECT * FROM `product` WHERE `add`='v' and `product_sales` < (select MAX(`product_sales`) from `product` WHERE  `product_sales` < (select MAX(`product_sales`) from `product` )) ORDER BY `product_sales` DESC LIMIT 1";
			ResultSet tmp=con.createStatement().executeQuery(sql);
			while(tmp.next()){
		%>
          <div class="Agood" onclick="location.href='good.jsp?p=<%=tmp.getString(1)%>'">
            <div class="con">
              <div class="hover-box">
                <div class="img-box">
                  <div class="sameHeight"><img src="assets/images/<%=tmp.getString(1)%>-1.jpg" alt="switch lite" style="width:100%">
                  </div>
                </div>
                <div class="info-box">
                  <div class="info-content">
                    <span>
                      <h2><%=tmp.getString(2)%></h2>
                      <p class="price">NT$ <%=tmp.getString(3)%></p>
                    </span>
                  </div>
                </div>
              </div>
            </div>
            <span class="No3"><img src="assets/images/Top3.png"></span>
			</div><%}%>
        </div>
        <!-- END GRID -->
      </div>
      <!-- 熱門商品 結束 -->
    </div>
    <!-- 首頁結束-->
    <script>
      var myIndex = 0;

      carousel();

      function carousel() {
        var i;
        var x = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        for (i = 0; i < x.length; i++) {
          x[i].style.display = "none";
        }
        myIndex++;
        if (myIndex > x.length) {
          myIndex = 1
        }
        x[myIndex - 1].style.display = "block";

        for (i = 0; i < x.length; i++) {
          dots[i].className = dots[i].className.replace(" act", "");
        }
        dots[myIndex - 1].className += " act";
        setTimeout(carousel, 4000); // Change image every 2 seconds
      }


      showSlides(myIndex);

      // Next/previous controls
      function plusSlides(n) {
        showSlides(myIndex += n);
      }

      // Thumbnail image controls
      function currentSlide(n) {
        showSlides(myIndex = n);
      }

      function showSlides(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        if (n > slides.length) {
          myIndex = 1
        }
        if (n < 1) {
          myIndex = slides.length
        }
        for (i = 0; i < slides.length; i++) {
          slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
          dots[i].className = dots[i].className.replace(" act", "");
        }
        slides[myIndex - 1].style.display = "block";
        dots[myIndex - 1].className += " act";
      }


      priceformat();

      function priceformat() {
        var p = document.getElementsByClassName("pricef");
        for (var i = 0; i < p.length; i++) {
          p[i].innerText = pricef(p[i].innerText);
        }
        document.getElementsByClassName("price").innerText = p;
      }

      function pricef(price) {
        var p = price.toString();
        if (p.length < 3) {
          return p;
        } else {
          return pricef(p.substr(0, p.length - 3)) + "," + p.substr(p.length - 3);
        }
      }
      fire();

      function fire() {
        var top = document.getElementsByClassName("arr");

        for (var j = 0; j < top.length; j++) {
          if (top[j].getAttribute("src") == "assets/images/left1.png") {
            top[j].setAttribute("src", "assets/images/left2.png");
          } else {
            top[j].setAttribute("src", "assets/images/left1.png");
          }
        }
        setTimeout(fire, 200);
      }

      hand();

      function hand() {
        var hot = document.getElementsByClassName("arrr");

        for (var j = 0; j < hot.length; j++) {
          if (hot[j].getAttribute("src") == "assets/images/right1.png") {
            hot[j].setAttribute("src", "assets/images/right2.png");
          } else {
            hot[j].setAttribute("src", "assets/images/right1.png");
          }
        }
        setTimeout(hand, 200);
      }
    </script>
    
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
  <div class="contact">
    <div>
      <a href="mailto:amanda090988@gmail.com">
        <img src="assets/images/frog.png" class="frog">
      </a>
    </div>
  </div>
</body>

</html>