<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%request.setCharacterEncoding("UTF-8");%>
<%
if(session.getAttribute("member_mail") != null ){
    if(request.getParameter("member_mail")!=null){
    sql = "UPDATE `member` SET `member_mail`='"+request.getParameter("member_mail")+"' WHERE `member_mail`='"+session.getAttribute("member_mail")+"'";
	con.createStatement().execute(sql);
    sql = "UPDATE `member` SET `member_password`='"+request.getParameter("member_password")+"' WHERE `member_mail`='"+session.getAttribute("member_mail")+"'";
	con.createStatement().execute(sql);	
	sql = "UPDATE `member` SET `member_name`='"+request.getParameter("member_name")+"' WHERE `member_mail`='"+session.getAttribute("member_mail")+"'";
	con.createStatement().execute(sql);	
	sql = "UPDATE `member` SET `member_birth`='"+request.getParameter("member_birth")+"' WHERE `member_mail`='"+session.getAttribute("member_mail")+"'";
	con.createStatement().execute(sql);	
	sql = "UPDATE `member` SET `member_phone`='"+request.getParameter("member_phone")+"' WHERE `member_mail`='"+session.getAttribute("member_mail")+"'";
	con.createStatement().execute(sql);	
	sql = "UPDATE `member` SET `member_address`='"+request.getParameter("member_address")+"' WHERE `member_mail`='"+session.getAttribute("member_mail")+"'";
	con.createStatement().execute(sql);	
	sql = "UPDATE `member` SET `member_gender`='"+request.getParameter("member_gender")+"' WHERE `member_mail`='"+session.getAttribute("member_mail")+"'";
	con.createStatement().execute(sql);	

	con.close();//結束資料庫連結
	%>
	<script>
		alert("更新成功");
		location.replace("member.jsp");
	</script>
	<%
	}
	else{
	  con.close();//結束資料庫連結	
	  %>
	  <script>
		alert("更新失敗");
		location.replace("member.jsp");
	</script>
	<%
	}
}
else{
	con.close();//結束資料庫連結
}
%>
