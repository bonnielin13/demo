<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!-- Step 0: import library -->
<%@page import = "java.sql.*"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>topsale</title>
    <link rel="stylesheet" type="text/css" href="assets/css/top.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    

</head>
<body>
    <header>        
        <h1><a href="index.jsp">I DOT CAR</a></h1>
            <div class="iconbox">
                <a href="login.jsp"><img src="assets/images/man.jpg" alt="user"></a>
                <a href="cart.jsp"><img src="assets/images/shop2.png" alt="cart"></a>
            </div>

        <nav>
            <ul class="list">                
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <li><a href="top.jsp" class="listplace">銷售排行</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                
                <li><a href="top.jsp#here">熱門車型</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <li><a href="member.jsp" class="listplace">會員專區</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <li><a href="about.html" class="listplace">關於我們</a></li>   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</form>			
            </ul>
        </nav>
		
    </header></br> 
 <% try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else
           {
//Step 3: 選擇資料庫
           String sql="USE `demo`";
           con.createStatement().execute(sql);
//Step 4: 執行 SQL 指令的ResultSet 
           request.setCharacterEncoding("UTF-8");
           //舊版MySQL從表格傳遞中文到資料庫, 必須使用getBytes("ISO-8859-1"),"UTF-8"編碼 
           //String name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
		   String name = new String(request.getParameter("name"));
           sql = "SELECT * FROM `product` WHERE `name` ='" + name + "'";
           ResultSet rs=con.createStatement().executeQuery(sql);
//Step 5：進行資料的處理
           if (rs.next()){ //要從檔頭移到第一筆, 指標才正確
		  %> 
		  <a href="product.jsp?ID=<%=rs.getString(1)%>">
                    <div class="cars">
                        <div class="pic">
                            <img src = "<%=rs.getString(4)%>">
                        </div>
                        <div class="text">
                            <h2><%=rs.getString(2)%></h2>
                        </div>
                    </div>            
                </a>
	<%
       }
//Step 6: 關閉連線
       con.close();
    }}
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
		