<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8");%>

<%
try {
        //Step 1: 載入資料庫驅動程式 
            Class.forName("com.mysql.jdbc.Driver");
            try {
        //Step 2: 建立連線 	
                String url="jdbc:mysql://localhost/?serverTimezone=UTC";
                String sql="";
                Connection con=DriverManager.getConnection(url,"root","1234");
                if(con.isClosed())
                   out.println("連線建立失敗");
                else {
        //Step 3: 選擇資料庫   
                   sql="use esports";
                   con.createStatement().execute(sql);

        String member_mail=request.getParameter("member_mail");
	String member_name=request.getParameter("member_name");
        String member_gender=request.getParameter("member_gender");
	String member_birth=request.getParameter("member_birth");
	String member_phone=request.getParameter("member_phone");
	String member_address=request.getParameter("member_address");
	String member_password=request.getParameter("member_password");

        sql="INSERT `member` (`member_mail`, `member_name`,  `member_gender`, `member_birth`,`member_phone`,`member_address`,`member_password`) ";
        sql+="VALUES ('" + member_mail + "', ";
        sql+="'"+member_name+"', ";
        sql+="'"+member_gender+"', ";
        sql+="'"+member_birth+"', ";   
        sql+="'"+member_phone+"',"; 
	sql+="'"+member_address+"',";
        sql+="'"+member_password+"')";
        
        session.setAttribute("member_mail",member_mail);
        
        con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
           response.sendRedirect("member.jsp");
        }
}
catch (SQLException sExec) {
       out.println("SQL錯誤"+sExec.toString());
}
}
catch (ClassNotFoundException err) {
out.println("class錯誤"+err.toString());
}
%>