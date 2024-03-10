<!-- Step 0: import library -->
<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
<title>add</title>
</head>
<body>
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
          	
           String mesname=request.getParameter("mesname");
         String message=request.getParameter("message");
		  String star=request.getParameter("rating_stars");
		  String pnum=request.getParameter("page");
           java.sql.Date wrdate=new java.sql.Date(System.currentTimeMillis());
           java.sql.Time wrtime=new java.sql.Time(System.currentTimeMillis());
//Step 4: 執行 SQL 指令	
           sql="INSERT message (`mesname`,`pnum`,`message`,`wrdate`,`wrtime`,`star`) ";
           sql+="VALUES ('" + mesname + "', ";
           sql+="'" + pnum + "', ";
		   sql+="'" + message + "', ";
         sql+="'"+wrdate+"', ";
         sql+="'"+wrtime+"', ";  
           sql+="'"+star+"')";
           con.createStatement().execute(sql);
		   con.close();
		   
		   response.sendRedirect("good.jsp?p="+ pnum);
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
</body>
</html>
