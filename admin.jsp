<%@ page language="java" import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>
<%@ include file="config.jsp" %>
<%@ page import = "java.io.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>管理者登入</title>
  <link rel="stylesheet" type="text/css" href="assets/css/header.css">
  <link rel="stylesheet" type="text/css" href="assets/css/admin.css">
</head>

<body>
  <div class="ALL">
    <div id="main">
      <div class="topnav">
        <div class="myTopnav">
          <div class="imgNav" style="padding: 20px;">
            <img src="assets/images/theme.png" alt="玩童">
            <p>後臺系統</p>
          </div>
        </div>
      </div>
    </div>
    <div class="adminAP">
      <div class="adminAP">
        <p class="welcomeWord">歡迎回來，請先登入</p>
        <form action="AdminCheck.jsp" method="post">
        <p>帳號：<input type="text" name="admin_id" required></p>
        <p>密碼：<input type="password" name="admin_pwd" required></p>
        <input type="submit" value="登入">
        </form>
      </div>
      <div><img src="assets/images/admin.png"></div>
    </div>
  </div>
</body>

</html>