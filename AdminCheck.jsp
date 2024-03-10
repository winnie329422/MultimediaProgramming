<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if(request.getParameter("admin_id") !=null && !request.getParameter("admin_id").equals("") 
	&& request.getParameter("admin_pwd") != null && !request.getParameter("admin_id").equals("")){
    
	 sql = "SELECT * FROM `admin` WHERE `admin_id`= ? AND `admin_pwd`= ?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, request.getParameter("admin_id"));
	pstmt.setString(2, request.getParameter("admin_pwd"));
    ResultSet rs =pstmt.executeQuery();
	
    if(rs.next()){            
        session.setAttribute("admin_id",request.getParameter("admin_id"));
		con.close();//結束資料庫連結
        response.sendRedirect("admin_goods.jsp") ;
    }
    else{
		con.close();//結束資料庫連結
		%>
        <script>
			alert("帳號密碼不符！請重新登入");
			location.replace("admin_goods.jsp");
		</script>
		<%
	}
}
else
	response.sendRedirect("admin.jsp");
%>
