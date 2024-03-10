<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@include file="config.jsp" %>
<%@ page import = "java.io.*"%>


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="assets/css/header.css">
  <link rel="stylesheet" text="text/css" href="assets/css/member.css">
  <link rel="stylesheet" text="text/css" href="assets/css/star.css">
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
  <script type="text/javascript" src="assets/js/header.js"></script>
  <title>會員中心</title>
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
    <!-- 會員資料 -->
    <%
    if(session.getAttribute("member_mail") != null ){
      sql = "SELECT * FROM `member` WHERE `member_mail`='" +session.getAttribute("member_mail")+"';"; 
    ResultSet rs =con.createStatement().executeQuery(sql);
    String member_mail="", member_password="", member_name="", member_birth="", member_phone="", member_gender="",member_address="";
    //讀出member_mail, member_password當成使用者要更改時的內定值
    while(rs.next()){
      member_mail=rs.getString("member_mail");
      member_password=rs.getString("member_password");
      member_name=rs.getString("member_name");
      member_birth=rs.getString("member_birth");
      member_phone=rs.getString("member_phone");
      member_address=rs.getString("member_address");
      member_gender=rs.getString("member_gender");
    %>
          
    <div class="member ">
      <div class="M">
        <div class="asd">
          <div class="mb1">會員資料<button onclick="editMember()">編輯資料</button></div>
        </div>
        
<form action="update.jsp" method="POST">
          <div class="MM M-name">
            <span>姓名 :</span>
            <input type="text" id="memName" readonly="readonly" required placeholder="請輸入姓名" name="member_name" value="<%=member_name%>" />
          </div>
          <div class="MM M-gender">
            <div class="gg">
              <span>性別 : </span>
              <div class="gen">
                <%if (member_gender.equals("male")){%>
                <input type="radio" name="member_gender" value="male" id="memGenB"  class="r1" checked="true" disabled>男
                <input type="radio" name="member_gender" value="female" id="memGenG"  class="r1" disabled>女
                <%}
							else{%>
                <input type="radio" name="member_gender" value="male" id="memGenB"  class="r1" disabled>男
                <input type="radio" name="member_gender" value="female" id="memGenG"  class="r1" checked="true" disabled>女
                <%}%>                       
              </div>
            </div>
          </div>


          <div class="MM M-phone">
            <span>電話 : </span>
            <input type="tel" id="memPhone" readonly="readonly" required placeholder="請輸入電話" name="member_phone" value="<%=member_phone%>">
          </div>
          <div class="MM M-birth">
            <span>生日 :</span>
            <input type="date" id="memBirth" readonly="readonly" required name="member_birth" value="<%=member_birth%>" min="1900-01-01"
              max="2021-06-18">
          </div>

          <div class="MM M-address">
            <span>地址 : </span>
            <input type="text" id="memAdress" readonly="readonly" required placeholder="請輸入地址" name="member_address" value="<%=member_address%>">
          </div>
          <div style="display: flex;">
            <div style="width: 50%;">
              <div class="MM M-Email">
                <span>信箱 : </span>
                <input type="email" readonly="readonly" required oninvalid="setCustomValidity('請輸入正確的email');"
                  oninput="setCustomValidity('');" placeholder="請輸入你的電子信箱" name="member_mail" value="<%=member_mail%>" />
              </div>
            </div>
            <div class="MM M-password">
              <span>密碼 :</span>
              <input type="password" id="myInput" required name="member_password" value="<%=member_password%>" placeholder="請輸入密碼">
              <div class="seePass"><input type="checkbox" class="seePass" onclick="seePass()">看密碼</div>
            </div>
          </div>
          <div class="button"><input type="submit" value="確認修改資料" class="mm_but01"></div>
        </form>
        

      </div>
    </div><%}%>
    <!-- 訂單紀錄 -->
	
    <div class="member ">
      <div class="M">
        <div class="asd">
          <div class="mb1">訂單紀錄</div><br>
        </div>
        <!-- 第一筆訂單 -->
		<%
		 Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    PreparedStatement pstmt = null;
	ResultSet ss = null;
		 sql="SELECT * FROM `order` WHERE `member_mail`='" +session.getAttribute("member_mail")+"' GROUP BY `time`"; 
		   ss = stmt.executeQuery(sql);
		   int discount = 0;
		   ss.last();
		   if (ss.getRow() == 0){
			   %><p>尚無訂單</p><%
			   }else{
				   ss.beforeFirst();
		   while(ss.next()){
		String time = ss.getString("time");
		int order_id = Integer.parseInt(ss.getString("order_id"));
		%>
		<form action="deleteorder.jsp" method="post">
        <div class="AnOrder">
          <div class="orderEntity">
            <div>
              <p>訂單編號：<a href="order.jsp?o=<%=ss.getString(1)%>"><%=ss.getString(1)%></a></p>
              <p>下單日期：<%=ss.getString(13)%></p>
            </div>
            <div>
              <p>狀態：待出貨</p>
              <div><input type="submit" value="我要退貨" class="orderEntityButton"></div>
            </div>
          </div><%
		   sql="SELECT * FROM `order` WHERE `time`='" +time+"' AND `order_id`='"+order_id+"'"; 
		  ResultSet tmp=con.createStatement().executeQuery(sql);
		   while(tmp.next()){ %>
          <div class="orderItems">
            <div>
              <p><%=tmp.getString(5)%></p>
            </div>
            <div>
              <p>$<%=tmp.getString(7)%> X <%=tmp.getString(6)%> = <%=tmp.getString(9)%></p>
            </div>
          </div><%}%>
		  <input type="hidden" name="cart_id" value="<%=(ss.getString(2))%>">
		  <input type="hidden" name="deleteorder" value="<%=ss.getString(16)%>"/>
		  <input type="hidden" name="product_id" value="<%=ss.getString(4)%>"/>
		  <input type="hidden" name="time" value="<%=ss.getString(17)%>"/>
          <div class="orderPrice">
            <div>
              <p></p>
            </div>
            <div><%discount=(order_id/10000)*1000;%>
			 <p>折扣金額：$<%=discount%></p>
              <p>訂單總金額：$ <%=(order_id-discount)%></p>
            </div>
          </div>
        </div>
		</form>
		   <%}}%>
      </div>
    </div>
    <!-- 訂單記錄結束 -->
    <!-- 評論紀錄 -->
    <div class="member ">
      <div class="M">
        <div class="asd">
          <div class="mb1">評論紀錄</div><br>
        </div>
        <div class="ForComments">
          
          <!-- 第一筆評論 -->
          <% 
		sql="SELECT * FROM `order`,`message` WHERE `message`.`pnum`=`order`.`product_id` AND `mesname`='" +member_name+"' AND `member_mail`='" +session.getAttribute("member_mail")+"'"; 
        ResultSet sss = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
	    sss.last();
		if (sss.getRow() == 0){%>
		<img class="NoComments" src="assets/images/NoComments.JPG">
		<%}else{
			sss.beforeFirst();
		  while(sss.next()){
   %>
   
          <div class="AComment">
            <img class="CommentsImg" src="assets/images/<%=sss.getString("product_id")%>-1.jpg">
            <div class="CommentsWord">
              <p><%=sss.getString("product_name")%></p>
			  
          <div class="rating" style="cursor:default;">
            <%if (sss.getString("star").equals("star_one")){%>
            <input type="radio" name="rating_stars" value="star_one" id="starOne" disabled />
            <label for="star_one" class="stars">One star</label>
            <%}%>

            <%if (sss.getString("star").equals("star_two")){%>
              <input type="radio" name="rating_stars" value="star_one" id="starOne" disabled />
              <label for="star_one" class="stars">One star</label> 
            <input type="radio" name="rating_stars" value="star_two" id="starTwo" disabled />
            <label for="star_two" class="stars">Two stars</label>
            <%}%>

            <%if (sss.getString("star").equals("star_three")){%>
              <input type="radio" name="rating_stars" value="star_one" id="starOne" disabled />
            <label for="star_one" class="stars">One star</label>
            <input type="radio" name="rating_stars" value="star_two" id="starTwo" disabled />
            <label for="star_two" class="stars">Two stars</label>
            <input type="radio" name="rating_stars" value="star_three" id="starThree" disabled />
            <label for="star_three" class="stars">Three stars</label>
            <%}%>

            <%if (sss.getString("star").equals("star_four")){%>
              <input type="radio" name="rating_stars" value="star_one" id="starOne" disabled />
            <label for="star_one" class="stars">One star</label>
            <input type="radio" name="rating_stars" value="star_two" id="starTwo" disabled />
            <label for="star_two" class="stars">Two stars</label>
            <input type="radio" name="rating_stars" value="star_three" id="starThree" disabled />
            <label for="star_three" class="stars">Three stars</label>
            <input type="radio" name="rating_stars" value="star_four" id="starFour" disabled />
            <label for="star_four" class="stars">Four stars</label>
            <%}%>

            <%if (sss.getString("star").equals("star_five")) {%>
              <input type="radio" name="rating_stars" value="star_one" id="starOne" disabled />
            <label for="star_one" class="stars">One star</label>
            <input type="radio" name="rating_stars" value="star_two" id="starTwo" disabled />
            <label for="star_two" class="stars">Two stars</label>
            <input type="radio" name="rating_stars" value="star_three" id="starThree" disabled />
            <label for="star_three" class="stars">Three stars</label>
            <input type="radio" name="rating_stars" value="star_four" id="starFour" disabled />
            <label for="star_four" class="stars">Four stars</label>
            <input type="radio" name="rating_stars" value="star_five" id="starFive" disabled />
            <label for="star_five" class="stars">Five stars</label>
            <%}%>
		  </div>
      <p><%out.println(sss.getString("message"));%></p>
      <p><%out.println("留言時間："+sss.getString("wrdate")+" "+sss.getString("wrtime"));%></p>
          </div>
          <!-- 第一筆評論結束 -->
          
		  
        </div><%}}%>
      </div>	
	  
    </div>
	</div><%}%>
    <!-- 評論記錄結束 -->
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
  <!-- 看密碼 -->
  <script>
    function seePass() {
      var x = document.getElementById("myInput");
      if (x.type === "password") {
        x.type = "text";
      } else {
        x.type = "password";
      }
    }
  </script>
  <!-- 編輯個人資料 -->
  <script>
    function editMember() {
      $('.MM input[type="text"],.MM input[type="date"],.MM input[type="tel"],.MM input[type="password"]').css({
        'border-width': '1px'
      });
      $('.M-password').css({
        'display': 'flex'
      })
      $('.button').css({
        'display': 'inline-block'
      })
      $('.asd button').css({
        'display': 'none'
      })
      $('#memName').removeAttr("readonly");
      $('#memPhone').removeAttr("readonly");
      $('#memAdress').removeAttr("readonly");
      $('#memBirth').removeAttr("readonly");
      $('#memGenG').removeAttr("disabled");
      $('#memGenB').removeAttr("disabled");
    }
  </script>
</body>

</html>