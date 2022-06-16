<%@ page contentType="text/html" import="java.sql.*" language="java" import="java.util.*"%>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link rel="stylesheet" href="./assets/css/style.css">
</head>
<body >
    
    <div class="login">
        <form>
        <fieldset>
            <legend class="legand">會員登入</legend>
            <input type="first" class="email" placeholder="信箱" /><br>
        <input type="password" class="password" placeholder="密碼" /><br>
        <input type="button" class="button" value="GO"  onclick="location.href=''">
        <div class="bt"><a href="register.html"><p>註冊會員</p></a></div>
        
        </fieldset>
    </form>
    </div>
  
</body>
</html>