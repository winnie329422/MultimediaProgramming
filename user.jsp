<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if(session.getAttribute("member_mail") != null ){
    sql = "SELECT * FROM `member` WHERE `member_mail`='" +session.getAttribute("member_mail")+"';"; 
	ResultSet rs =con.createStatement().executeQuery(sql);
	String member_mail="", member_password="";
	//讀出id, pwd當成使用者要更改時的內定值
	while(rs.next()){
	    member_mail=rs.getString("member_mail");
		member_password=rs.getString("member_password");
	}
    con.close();//結束資料庫連結
%>
哈囉，<%=member_mail%>，<a href='logout.jsp'>登出</a><br />
請修改會員資料：<br />
<form action="update.jsp" method="POST">
您的姓名：<input type="text" name="member_mail" value="<%=member_mail%>" />
您的密碼：<input type="password" name="member_password" value="<%=member_password%>" />
<input type="submit" name="b1" value="更新資料" />
</form>
<%
}
else{
	con.close();//結束資料庫連結
%>
<h1><font color="red">您尚未登入，請登入！</font></h1>
<form action="check.jsp" method="POST">
帳號：<input type="text" name="member_mail" /><br />
密碼：<input type="password" name="member_password" /><br />
<input type="submit" name="b1" value="登入" />
</form>
<%
}
%>
