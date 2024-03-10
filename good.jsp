<%@ page language="java" import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>
<%@ include file="config.jsp" %>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import = "java.io.*"%>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="assets/css/header.css">
  <link rel="stylesheet" text="text/css" href="assets/css/good.css">
  <link rel="stylesheet" text="text/css" href="assets/css/star.css">
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
    <!-- 商品照片 -->
	  <%
  String p = request.getParameter("p");
	sql="SELECT * FROM `product` WHERE product_id='"+p+"'";
	ResultSet rs=con.createStatement().executeQuery(sql);
	while(rs.next())
  {
  %>
    <div class="goodTop">
      <div style="margin: 65px 3% 50px 5%;">
        <div class="goodslide">
          <div class="goodpic">
            <div class="mySlides">
              <div class="numbertext">1 / 3</div>
              <img src="assets/images/<%=rs.getString(1)%>-1.jpg" style="width: 600px;">
            </div>

            <div class="mySlides">
              <div class="numbertext">2 / 3</div>
              <img src="assets/images/<%=rs.getString(1)%>-2.jpg" style="width: 600px;">
            </div>

            <div class="mySlides">
              <div class="numbertext">3 / 3</div>
              <img src="assets/images/<%=rs.getString(1)%>-3.jpg" style="width: 600px;">
            </div>
          </div>

          <a class="prev" onclick="plusSlides(-1)">❮</a>
          <a class="next" onclick="plusSlides(1)">❯</a>

          <div class="row" style="width: 600px;">
            <div class="column">
              <img class="demo cursor" src="assets/images/<%=rs.getString(1)%>-1.jpg" style="width:100%" onclick="currentSlide(1)">
            </div>
            <div class="column">
              <img class="demo cursor" src="assets/images/<%=rs.getString(1)%>-2.jpg" style="width:100%" onclick="currentSlide(2)">
            </div>
            <div class="column">
              <img class="demo cursor" src="assets/images/<%=rs.getString(1)%>-3.jpg" style="width:100%" onclick="currentSlide(3)">
            </div>
          </div>
        </div>
      </div>
      <!-- 商品價格、加入購物車 -->
      <div class="goodDetail">
        <form action="addcart.jsp"  method="post">
          <h1><%=rs.getString(2)%></h1>
          <h2>NT $ <%=rs.getString(3)%></h2>
		  <input type="hidden" name="product_id" value="<%=(rs.getString(1))%>">
		  <input type="hidden" name="product_name" value="<%=(rs.getString(2))%>">
		  <input type="hidden" name="product_price" value="<%=(rs.getString(3))%>">
          <h3>數量</h3>
          <select name="cart_quantity">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
          </select>
          <input type="submit" value="加入購物車">
          <hr>
          <h4>商品資訊</h4>
          <div class="goodQuanIntro">
            <p style="display: inline-block; width: 20%; color: #222;">商品庫存</p>
            <p style="display: inline-block; width: 75%; color: #222; vertical-align: top;"><%=rs.getString(4)%>件</p>
			<input type="hidden" name="product_stock" value="<%=(rs.getString(4))%>">
            <p style="display: inline-block; width: 20%; color: #222;">商品摘要</p>
            <p style="display: inline-block; width: 75%; color: #222; vertical-align: top;"><%=rs.getString(5)%></p>
          </div>
        </form>
      </div>
    </div>
	<%}%>
    <!-- 評論表單 -->
    <div id="id03" class="modal ">
      <div class="animate" style="display: flex; justify-content: center;">
	  
        <form class="Comment-content " action="addmessage.jsp" method="post">
          <div class="imgcontainer">
           <span onclick="document.getElementById('id03').style.display='none'" class="close"
              title="關閉此視窗">&times;</span>
            <p style="font-size: 25px;">我要評論</p>
          </div>
          <%
    sql = "SELECT * FROM `member` WHERE `member_mail`='" +session.getAttribute("member_mail")+"';"; 
    ResultSet rs3 =con.createStatement().executeQuery(sql);
	while(rs3.next())
  {
  %>
          <input type="hidden" name="mesname" value="<%=(rs3.getString(2))%>" /><%}%>
          <div class="CommentContainer">
            <div class="rate effecting">
              <input type="radio" name="rating_stars" value="star_one" id="star_one" />
              <label for="star_one" class="stars">One star</label>
              <input type="radio" name="rating_stars" value="star_two" id="star_two" />
              <label for="star_two" class="stars">Two stars</label>
              <input type="radio" name="rating_stars" value="star_three" id="star_three" />
              <label for="star_three" class="stars">Three stars</label>
              <input type="radio" name="rating_stars" value="star_four" id="star_four" />
              <label for="star_four" class="stars">Four stars</label>
              <input type="radio" name="rating_stars" value="star_five" id="star_five" />
              <label for="star_five" class="stars">Five stars</label>
            </div>
            <textarea placeholder="寫點評論..." name="message" maxlength="200" required
              oninvalid="setCustomValidity('請輸入評論');" style="resize:none;height:200px;"></textarea>
            <button type="submit">送出</button>
            <button type="button" onclick="document.getElementById('id03').style.display='none'"
              class="cancelbtn">取消</button>
              <input type="hidden" value="<%=p%>" name="page">
          </div>
		   </form>
      </div>
    </div>
    <!-- 評論表單結束 -->
    
    <!-- 商品評論 -->
    <div class="goodComment">
      <div class="goodCommentTitle">
        
        <h1>商品評論</h1>
		 <%
	sql="SELECT * FROM `order` WHERE `member_mail` = '" + session.getAttribute("member_mail") + "' AND `product_id`='"+p+"' ";
    ResultSet aaa = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql); 
	aaa.last();
		   if (aaa.getRow() != 0){
			   %>
			   <button onclick="document.getElementById('id03').style.display='block'">我要評論</button>
		   <%aaa.beforeFirst();}%>
      </div>
      
      <%
      sql="SELECT * FROM `message`  WHERE `pnum`='"+p+"' "; //算出共幾筆留言
      //ResultSet rs4 =con.createStatement().executeQuery(sql);
      ResultSet rs2 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
      rs2.last();
      int total_content = rs2.getRow();

      
		  if(total_content==0)
		   {
				%>
        <div class="Nonono"><img src="assets/images/NoComments_good.JPG"></div>
        <%
		   }
		   else{
        %>
        <div>
        <%
        //if(rs2.getString(2)==p)
          //{
          int page_num=(int)Math.ceil((double)total_content/5.0); //無條件進位
          String page_string = request.getParameter("page");
          if (page_string == null) 
                  page_string = "0";          
          int current_page=Integer.valueOf(page_string);
          if(current_page==0) //若未指定page, 令current_page為1
                current_page=1;
          int start_record=(current_page-1)*5;
          sql="SELECT * FROM `message` ORDER BY `mesnum` DESC LIMIT ";  
          //遞減排序, 讓最新的資料排在最前面
          sql+=start_record+",5";
          %>
        </div>

        <%sql="SELECT * FROM `message`  WHERE `pnum`='"+p+"' ";
		rs2=con.createStatement().executeQuery(sql);%>
        <% while(rs2.next())
            {  
          %>
      <!-- 第一筆評論 -->
      <div class="customerComment">
        <div class="NameStar" style="display: flex;">
          
         <!--人名問題 -->
          <p><%=rs2.getString(6)%></p>
          
          <div class="rating" style="cursor:default;">
            <%if (rs2.getString(4).equals("star_one")){%>
            <input type="radio" name="rating_stars" value="star_one" id="starOne" disabled />
            <label for="star_one" class="stars">One star</label>
            <%}%>

            <%if (rs2.getString(4).equals("star_two")){%>
              <input type="radio" name="rating_stars" value="star_one" id="starOne" disabled />
              <label for="star_one" class="stars">One star</label> 
            <input type="radio" name="rating_stars" value="star_two" id="starTwo" disabled />
            <label for="star_two" class="stars">Two stars</label>
            <%}%>

            <%if (rs2.getString(4).equals("star_three")){%>
              <input type="radio" name="rating_stars" value="star_one" id="starOne" disabled />
            <label for="star_one" class="stars">One star</label>
            <input type="radio" name="rating_stars" value="star_two" id="starTwo" disabled />
            <label for="star_two" class="stars">Two stars</label>
            <input type="radio" name="rating_stars" value="star_three" id="starThree" disabled />
            <label for="star_three" class="stars">Three stars</label>
            <%}%>

            <%if (rs2.getString(4).equals("star_four")){%>
              <input type="radio" name="rating_stars" value="star_one" id="starOne" disabled />
            <label for="star_one" class="stars">One star</label>
            <input type="radio" name="rating_stars" value="star_two" id="starTwo" disabled />
            <label for="star_two" class="stars">Two stars</label>
            <input type="radio" name="rating_stars" value="star_three" id="starThree" disabled />
            <label for="star_three" class="stars">Three stars</label>
            <input type="radio" name="rating_stars" value="star_four" id="starFour" disabled />
            <label for="star_four" class="stars">Four stars</label>
            <%}%>

            <%if (rs2.getString(4).equals("star_five")) {%>
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
            <%} %> 

            <!-- 留言時間 -->
            <div><%out.println("留言時間："+rs2.getString(5)+" "+rs2.getString(7));%></div>
          </div>
        </div>
        <p><%out.println(rs2.getString(3));%></p>
      </div>
      <%}
    //}
      %>
      <div>
        <center>
          <%
				for(int t=1;t<=page_num;t++) //建立1,2,...頁超連結
					out.print("<a href='good.jsp?p="+p+"&page="+t+"'>"+t+"</a>&nbsp;");
         %>
          </center>
       <%}%>
      <!-- 第二筆評論 -->
      <!--<div class="customerComment">
        <div class="NameStar" style="display: flex;">
          <p>阿曼達</p>
          <div class="rating" style="cursor:default;">
            <input type="radio" name="rating_stars" value="star_one" disabled />
            <label for="star_one" class="stars">One star</label>
            <input type="radio" name="rating_stars" value="star_two" disabled />
            <label for="star_two" class="stars">Two stars</label>
            <input type="radio" name="rating_stars" value="star_three" disabled />
            <label for="star_three" class="stars">Three stars</label>
            <input type="radio" name="rating_stars" value="star_four" disabled />
            <label for="star_four" class="stars">Four stars</label>
            <input type="radio" name="rating_stars" value="star_five" disabled />
            <label for="star_five" class="stars">Five stars</label>
          </div>
        </div>
        <p>超好玩！！</p>
      </div>-->
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
  </div>
<% FileWriter count_out=new FileWriter(count);
count_out.write(String.valueOf(x));//將數字轉成字串,寫入輸出串流

count_out.flush();//將buffer寫入
count_out.close();//關閉串流
%>

  <script>
    var slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
      showSlides(slideIndex += n);
    }

    function currentSlide(n) {
      showSlides(slideIndex = n);
    }

    function showSlides(n) {
      var i;
      var slides = document.getElementsByClassName("mySlides");
      var dots = document.getElementsByClassName("demo");
      var col = document.getElementsByClassName("column");
      if (n > slides.length) {
        slideIndex = 1
      }
      if (n < 1) {
        slideIndex = slides.length
      }
      for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
      }
      for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
        col[i].style.border = "none";
      }
      slides[slideIndex - 1].style.display = "block";
      dots[slideIndex - 1].className += " active";
      col[slideIndex - 1].style.border = "#4980a3 1px solid";
    }
  </script>
</body>

</html>