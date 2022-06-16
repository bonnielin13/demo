<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=<device-width>, initial-scale=1.0">
    <link rel="stylesheet" href="assets\css\cart.css">
    <title>Document</title>
</head>
<body>
    <header id = head>        
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
    </header>
    <h2>購物車清單</h2>
<%
        if(session.getAttribute("memberid")==null){
			%>
			<div style="text-align:center; font-size:50px;" >
				out.print("<script>alert('你的購物車有點空欸，先登入會員吧'); window.location='login.html' </script>");
			</div>
			<%
		}
        else{
          Class.forName("com.mysql.jdbc.Driver");
          String url4="jdbc:mysql://localhost/?serverTimezone=UTC";
          Connection con4=DriverManager.getConnection(url4,"root","1234");
          String sql4="USE demo";
          request.setCharacterEncoding("utf-8");
          con4.createStatement().execute(sql4);
          String memberid = (String)session.getAttribute("memberid");

          sql4="select * from `cart`, `product` where memberid='" + memberid + "' AND cart.id = product.id";
          ResultSet rs4=con4.createStatement().executeQuery(sql4);
	%>
<div id="app">
        <div class="container">
            <div class="item_header">
                <div class="item_detail" style="text-align:center">車型</div>
                <div class="price" style="text-align:center">預約時間</div>
                <div class="operate" style="text-align:center">刪除</div>
            </div>
<%
		while(rs4.next()){
%>
			<div class="item_header item_body">
                <div class="item_detail">
                    <img src="<%=rs4.getString("src")%>" >
                    <div class="name"><%=rs4.getString("name")%></div>
                </div>
                <div class="price"><%=rs4.getString("time")%></div>
			<form action="cartdelete.jsp" method="post" accept-charset="utf-8" style="border:none">
                <input type="submit" name="delete" value="&times;"> 
				<input type="hidden" name="cartnum" value='<%=rs4.getString("num")%>'>
			</form>
			</div>
			<br>
        </div>
</div>
<%}}%>	
<div style="text-align:center">
                <input type="button" value="確定預約" onclick="location.href='checkout.jsp'" style="width:100px; height:50px" >
</div>
    <footer>
        <div class="copyright">
            <p>Copyright &copy; 2022 I DOT CAR</p>
        </div>
      </footer>      
		
</body>
</html>
