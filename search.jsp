<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import = "java.io.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="assets/css/header.css">
  <link rel="stylesheet" text="text/css" href="assets/css/allgoods.css">
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
  <script type="text/javascript" src="assets/js/header.js"></script>
  <title>玩童</title>
</head>
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
		   request.setCharacterEncoding("utf-8");
          %>
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
    <div class="mainHost">
      <h1>搜尋結果</h1>
      <!-- 有找到商品 -->
      <%Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		PreparedStatement pstmt = null;
		ResultSet tmp = null;                  
        sql="SELECT * FROM `product` WHERE `add`='v' AND `product_name` LIKE '%"+request.getParameter("search")+"%'";
		tmp = stmt.executeQuery(sql);
		int j=1;
		tmp.last();
		if (tmp.getRow() == 0){
		  %><!-- 沒找到商品 -->
		  <img style="width: 60%;" src="assets/images/NoSearch.JPG">
		  <%
	  }else{
		tmp.beforeFirst();
		while(tmp.next()){
		if(j%4==1)
		{%><div class="LotOfGood"><%}%>
	  
        <div class="Agood" onclick="location.href='good.jsp?p=<%=tmp.getString(1)%>'">
          <div class="sameHeight"><img src="assets/images/<%=tmp.getString(1)%>-1.jpg" alt="switch lite" style="width:100%"></div>
          <h2><%=tmp.getString(2)%></h2>
          <p class="price">NT$ <%=tmp.getString(3)%></p>
        </div>
		<%if(j%4==0)
		{%></div><%}
	j++;}
	if(17<=j && j<=20)
		{%></div><%}
	if(13<=j && j<=16)
		{%></div><%}
	if(9<=j && j<=12)
		{%></div><%}
	if(5<=j && j<=8)
		{%></div><%}
	if(1<=j && j<=4)
	  {%></div><%}}%>
      </div>
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
<% FileWriter count_out=new FileWriter(count);
count_out.write(String.valueOf(x));//將數字轉成字串,寫入輸出串流

count_out.flush();//將buffer寫入
count_out.close();//關閉串流
%>
  </div>
  <div class="contact">
    <div>
      <a href="mailto:amanda090988@gmail.com">
        <img src="assets/images/frog.png" class="frog">
      </a>
    </div>
  </div>
  <!-- 解決照片非方形問題 高度會等同寬度 用line-height=height使圖片垂直置中 -->
  <!-- <script>
    var cw = $('.sameHeight').width();
    $('.sameHeight').css({
      'height': cw + '%'
    });
    $('.sameHeight').css({
      'line-height': cw + 'px'
    });
  </script> -->
</body>
<%
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
          }
  
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}

catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
} %>
</html>