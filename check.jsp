<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if(request.getParameter("member_mail") !=null && !request.getParameter("member_mail").equals("") 
	&& request.getParameter("member_password") != null && !request.getParameter("member_mail").equals("")){

    //sql = "SELECT * FROM `member` WHERE `member_mail`='" +request.getParameter("member_mail") + 
	      //"'  AND `member_password`='" + request.getParameter("member_password") + "'"  ; 
    //ResultSet rs =con.createStatement().executeQuery(sql);
    
	 sql = "SELECT * FROM `member` WHERE `member_mail`= ? AND `member_password`= ?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, request.getParameter("member_mail"));
	pstmt.setString(2, request.getParameter("member_password"));
    ResultSet rs =pstmt.executeQuery();
	
    if(rs.next()){            
        session.setAttribute("member_mail",request.getParameter("member_mail"));
		con.close();//結束資料庫連結
        response.sendRedirect("member.jsp") ;
    }
    else{
		con.close();//結束資料庫連結
		%>
        <script>
			alert("帳號密碼不符！請重新登入");
			location.replace("index.jsp");
		</script>
		<%
	}
}
else
	response.sendRedirect("index.jsp");
%>
