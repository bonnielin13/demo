<!DOCTYPE html>
<%@ page import = "java.sql.*"%> 
<%@page import="java.util.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
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
                <a href="login.html"><img src="assets/images/man.jpg" alt="user"></a>
                <a href="cart.jsp"><img src="assets/images/shop2.png" alt="cart"></a>
            </div>

        <nav>
            <ul class="list">                
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <li><a href="top.jsp" class="listplace">銷售排行</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                
                <li><a href="top.jsp#here">熱門車型</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <li><a href="member.jsp" class="listplace">會員專區</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <li><a href="about.jsp" class="listplace">關於我們</a></li>   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <form action="result.jsp" method="post"><br>
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
           sql = "SELECT `name` FROM `product`";
           ResultSet rs=con.createStatement().executeQuery(sql);

//Step 5：進行資料的處理
           out.println("<select size='1' name = 'name'>");
//將Name所有資料以下拉式選單表現
           while(rs.next())
                out.println("<option>" + rs.getString(1));
           out.println("</select>");
       }
//Step 6: 關閉連線
       con.close();
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
    out.println("class錯誤"+err.toString());
}
        %>   
        <input type="submit" value="查詢車輛">
  </form>			
            </ul>
        </nav>
		
    </header></br>
    <main>
        <!--輪播圖-->
        <div class="coverflow">
            <a href="#"><img src="assets/images/cool1.jpeg"></a>
            <a href="#"><img src="assets/images/cool2.jpeg"></a>
            <a href="#"><img src="assets/images/cool3.jpeg"></a>
        </div></br>
        <div class="containers">
            <h1>&nbsp;&nbsp;&nbsp;銷售排行 TOP3</h1>
            <div class="row">                
                    <a href="product.jsp?ID=1">                        
                        <div class="cars">
                            <div class="pic">
                                <img src = "assets/images/list1.jpeg">
                            </div>
                            <div class="text">
                                <h2>&nbsp;&nbsp;Rolls-Royce Ghost 6.75 V12 SWB</h2>
                            </div>
                        </div>
                    </a>            
                
                <a href="product.jsp?ID=2">
                    <div class="cars">
                        <div class="pic">
                            <img src = "assets/images/list5.jpeg">
                        </div>
                        <div class="text">
                            <h2> Ferrari Roma V8</h2>
                        </div>
                    </div>            
                </a>
                <a href="product.jsp?ID=3">
                    <div class="cars">
                        <div class="pic">
                            <img src = "assets/images/list9.jpeg">
                        </div>
                        <div class="text">
                            <h2>&nbsp;&nbsp;&nbsp;Audi R8 Coupe V10 Performance</h2>
                        </div>
                    </div>            
                </a>
                
            </div>
        </div>
        
        <!-- 下三排車 -->
        <div class="containers">
            <div id="here" name="here"></div>
            <h1>&nbsp;&nbsp;&nbsp;&nbsp;熱門車型</h1>
            <div class="row">
                <a href="product.jsp?ID=4">
                    <div class="cars">
                        <div class="pic">
                            <img src = "assets/images/list13.jpeg">
                        </div>
                        <div class="text">
                            <h2>&nbsp;&nbsp;Bentley Continental GT Speed 6.0</h2>
                        </div>
                    </div>
                </a>
                <a href="product.jsp?ID=5">
                    <div class="cars">
                        <div class="pic">
                            <img src = "assets/images/list17.jpeg">
                        </div>
                        <div class="text">
                            <h2> Porsche 911 Turbo S Coupe</h2>
                        </div>
                    </div>            
                </a>
                <a href="product.jsp?ID=6">
                    <div class="cars">
                        <div class="pic">
                            <img src = "assets/images/list21.jpeg">
                        </div>
                        <div class="text">
                            <h2>&nbsp;Aston Martin DB11 Volante 4.0V8</h2>
                        </div>
                    </div>            
                </a>
                
            </div>            
        </div>
        
        <button class="js-back-to-top back-to-top" title="回到頭部">&#65085;</button>
        <script src="https://cdn.staticfile.org/jquery/2.2.4/jquery.min.js"></script>
        <script>
            $(function () {            
            var $win = $(window);            
            var $backToTop = $('.js-back-to-top');            
            // 當用戶滾動到離頂部100像素時，展示回到頂部按鈕            
            $win.scroll(function () {            
            if ($win.scrollTop() > 100) {            
            $backToTop.show();            
            } else {            
            $backToTop.hide();            
            }            
            });            
            // 當用戶點擊按鈕時，通過動畫效果返回頭部            
            $backToTop.click(function () {            
            $('html, body').animate({scrollTop: 0}, 200);            
            });            
            });            
        </script>
    </main>
    <footer>
        <div class="copyright">
            <p>Copyright &copy; 2022 I DOT CAR</p>
        </div>
    </footer>

</body>
</html>