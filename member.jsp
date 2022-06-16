<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>member</title>
    <link rel="stylesheet" href="assets/css/member.css">
</head>
<body> <header>
    <h1><a href="index.jsp">I DOT CAR</a></h1>
          <div class="iconbox">
              <a href="login.html"><img src="assets/images/man.jpg" alt="user"></a>
              <a href="cart.jsp"><img src="assets/images/shop2.png" alt="cart"></a>
          </div>

      <nav>
          <ul class="list">                
              <li><a href="top.jsp" class="listplace">銷售排行</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                
              <li><a href="top.jsp#here">熱門車型</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <li><a href="member.jsp" class="listplace">會員專區</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <li><a href="about.html" class="listplace">關於我們</a></li>                                
          </ul>
      </nav>
      <h2>會員專區</h2>
<%
	if(session.getAttribute("memberid")==null){
%>
		<div style="text-align:center; font-size:50px;" >
			<%out.print("你不是會員，請你離開");%>
		</div>
<%	
}
if(session.getAttribute("memberid") != null ){
    sql = "SELECT * FROM `member` WHERE `memberid`='" +session.getAttribute("memberid")+"';"; 
	ResultSet rs =con.createStatement().executeQuery(sql);
	String memberid="", pwd="";
	//讀出id, pwd當成使用者要更改時的內定值
	while(rs.next()){
	    memberid=rs.getString("memberid");
		pwd=rs.getString("pwd");
	}
con.close();//結束資料庫連結
%>

  </header>
    <div class="member" >
         <h4>個人資料</h4>
			<form action="update.jsp" method="POST">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;您的帳號：<input type="text" name="memberid" value="<%=memberid%>" /></p><br>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;您的密碼：<input type="password" name="pwd" value="<%=pwd%>" /></p><br>
				&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="b1" value="更新資料" />&nbsp;&nbsp;
				<a href='logout.jsp'>登出</a>
			</form>
        <div class="order">
        <h4>
         訂購紀錄
		</h4>
		<%
        if(session.getAttribute("memberid")==null){
			%>
			<div style="text-align:center; font-size:50px;" >
			<%out.print("尚無購買紀錄");%>
			</div>
			<%
		}
        else{
          Class.forName("com.mysql.jdbc.Driver");
          String url4="jdbc:mysql://localhost/?serverTimezone=UTC";
          Connection con4=DriverManager.getConnection(url,"root","1234");
          String sql4="USE demo";
          request.setCharacterEncoding("utf-8");
          con4.createStatement().execute(sql4);
          String memberid1 = (String)session.getAttribute("memberid");
		  sql4="select * from `order`, `product` where memberid='" + memberid1 + "' AND order.id = product.id";
		  ResultSet rs4=con4.createStatement().executeQuery(sql4);
		  while(rs4.next()){
	%>
<div id="app">
        <div class="container" >
			<img src="<%=rs4.getString("src")%>" style=" width:500px; height:300px; float:right; "><br>
            <p style="font-size:30px;">&nbsp;&nbsp;&nbsp;&nbsp;車型:<%=rs4.getString("id")%></p><br>
			<p style="font-size:30px;"><%=rs4.getString("name")%></p><br>
            <p style="font-size:30px;">&nbsp;&nbsp;&nbsp;&nbsp;預約時間:<%=rs4.getString("time")%></p><br>
		</div>
<hr style="width:100%;border:none;">
<%}}%>
   
<%
}
else{
	con.close();//結束資料庫連結
}
%>  
</body>
<footer>
    <div class="copyright" >
        <p>Copyright &copy; 2022 I DOT CAR</p>
    </div>
  </footer> 
</html>
