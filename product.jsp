<!DOCTYPE html>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="assets/css/product.css">
    <script src="js/comment.js"></script>
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
                <li><a href="about.jsp" class="listplace">關於我們</a></li>
                          
            </ul>
        </nav>
    </header><br/>
	<%
        request.setCharacterEncoding("utf-8");
		int pid=Integer.parseInt(request.getParameter("ID"));
		Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost/?serverTimezone=UTC";
	Connection con=DriverManager.getConnection(url,"root","1234");
	String sql="USE `demo`";
		con.createStatement().execute(sql);
	sql="SELECT * FROM product WHERE `id`='"+pid+"'";
	
	ResultSet rs=con.createStatement().executeQuery(sql);
	if (rs.next()){
	%>

    <main>
        <!-- 各車資訊 -->
        <div class="big">
            <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString("name")%></h1>
            <h1 style="color:rgb(220, 27, 27)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString("price")%> </h2>
            <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString("tax")%></h2>                        
        </div>

        <div class="container">            
            <div class="row">
                <div class="row-left">
                    <div class="left-img">
                        <!-- 車輪播圖 -->
                        <div id="banner">    
                            <div id="tab">
                                <img class="tabImg" src="<%=rs.getString("src")%>" >
                                <img class="tabImg" src="<%=rs.getString("src1")%>" >
                                <img class="tabImg" src="<%=rs.getString("src2")%>" >
                                <img class="tabImg" src="<%=rs.getString("src3")%>" >
                            </div>

                            <div class="lunbo_btn">
                                <span num="0" class="tabBtn hover"></span>
                                <span num="1" class="tabBtn"></span>
                                <span num="2" class="tabBtn"></span>
                                <span num="3" class="tabBtn"></span>
                            </div>    
                        
                            <div class="arrow prve">
                                <span class="slider_left"></span>
                            </div>
                            <div class="arrow next">
                                <span class="slider_right"></span>
                            </div>    
                        </div>
                        <script type="text/javascript"> 
                            var curIndex=0;
                            var img_number = document.getElementsByClassName('tabImg').length;
                            var _timer = setInterval(runFn,2000);
                            function runFn(){      
                                curIndex = ++curIndex == img_number ? 0 : curIndex;
                                slideTo(curIndex);
                             }
                             
                        
                             window.onload = function  () {  
                                var tbs = document.getElementsByClassName("tabBtn");
                                for(var i=0;i<tbs.length;i++){
                                    tbs[i].onclick = function  () {
                                        clearInterval(_timer);
                                        slideTo(this.attributes['num'].value);
                                        curIndex = this.attributes['num'].value
                                        _timer = setInterval(runFn,2000);
                                    }
                                }
                            }
                        
                            var prve = document.getElementsByClassName("prve");
                            prve[0].onclick = function () {
                                clearInterval(_timer);
                                curIndex--;
                                if(curIndex == -1){
                                    curIndex = img_number-1;
                                }
                                slideTo(curIndex);
                                _timer = setInterval(runFn,2000);
                            }
                            
                            var next = document.getElementsByClassName("next");
                            next[0].onclick = function () {
                                clearInterval(_timer);
                                curIndex++;
                                if(curIndex == img_number){
                                    curIndex =0;
                                }
                                slideTo(curIndex);
                                _timer = setInterval(runFn,2000);
                            }
                            
                            function slideTo(index){
                                console.log(index)
                                var index = parseInt(index);
                                var images = document.getElementsByClassName('tabImg');
                                for(var i=0;i<images.length;i++){
                                    if( i == index ){
                                        images[i].style.display = 'inline';     
                                    }else{
                                        images[i].style.display = 'none';
                                    }
                                }
                                var tabBtn = document.getElementsByClassName('tabBtn');
                                for(var j=0;j<tabBtn.length;j++){
                                    if( j == index ){
                                        tabBtn[j].classList.add("hover");    
                                        curIndex=j;
                                    }else{
                                        tabBtn[j].classList.remove("hover");
                                    }
                                }
                                
                            }
                        </script>                        
                    </div></br></br>
                    <!-- 介紹文字 -->
                    <div class="left-text">
					<h2><br><br><br><br><br><br><br><br><br><br><br><br><br></h2>
                             <h2>車款介紹</h2>                   
                        <p>
						
                            <%=rs.getString("content")%><br>
                        </p>
                    </div>
                </div>
                <!-- 規格表格 -->
                <div class="row-right">
                    <div class="right-text">
                        <table class="detail">
                            <tr>
                                <td class="red">車身座位</td>
                                <td>  <%=rs.getString("car1")%></td>
                                <td class="red">排氣量</td>
                                <td>   <%=rs.getString("car6")%></td>
                            </tr>
                            <tr>
                                <td class="red">變速系統</td>
                                <td> <%=rs.getString("car3")%></td>
                                <td class="red">產地</td>
                                <td><%=rs.getString("car7")%></td>
                            </tr>
                            
                        </table>
                        <table class="detail">
                            <tr>
                                <td class="red">引擎形式</td>
                                <td> <%=rs.getString("car5")%></td>
                            </tr>
                            <tr>
                                <td class="red">性能數據</td>
                                <td><%=rs.getString("car2")%></td>
                            </tr>
                            <tr>
                                <td class="red">能量消耗</td>
                                <td> <%=rs.getString("car4")%></td>
                            </tr>
                        </table></br>
                           <div class="go">
							<h2>庫存數量 : <%=rs.getString("number")%></h2>
                            <h2>預約賞車時間:</h2>
                        </div>
                        <!-- 預約按鈕 -->
                          <form method="get" accept-charset="utf-8" action="checkcart.jsp" class="form">
						     <div class="btn">   						 
								<input type="date" name="cartime" value="預約時間" required>
								<p><input type="submit" class="button" value="REVERSE NOW"></p>
								<input type="hidden" name="cartid" value='<%=rs.getString("id")%>' >
							 </div>
						  </form>
                    </div>


                    <!-- 其他人還看了 -->
                    <div class="right-others">
                        <h4>其他人還看了</h4>
                        <a href="product.jsp?ID=<%=rs.getString("id1")%>"><img src="<%=rs.getString("src5")%>" alt="user"></a>
                    </div>
                </div>
                
            </div>            
        </div>
		<% 
		            
                    }
					
                    else{
                    out.print("資料庫連接失敗");
                    }
                %>
        <!-- 星星 -->
		<form action="add.jsp" class="star_commentbox">
                        <h1>COMMENT</h1>                            
                        
						
						</form>
		<%	
						if(session.getAttribute("memberid") != null ){
							
							Class.forName("com.mysql.jdbc.Driver");
	                        String url3="jdbc:mysql://localhost/?serverTimezone=UTC";
	                        Connection con3=DriverManager.getConnection(url,"root","1234");
	                       String sql3="USE `demo`";
		                   con3.createStatement().execute(sql3);
							
                        sql3 = "SELECT * FROM `members` WHERE `memberid`='" +session.getAttribute("memberid")+"';"; 
	                    
	                    String memberid="";
	                   //讀出id, pwd當成使用者要更改時的內定值
	                   
	                    
	           
                        con3.close();//結束資料庫連結
                           %>

        <ul class="star_comment">
            <li class="product_starlevel">
                <div class="stars">
                    
                    <form action="add.jsp" class="star_commentbox">
                                                   
                        <div class="rating">
                            <input type="radio" id="star5" name="rating" value="5" hidden>
                            <label for="star5"></label>
                            <input type="radio" id="star4" name="rating" value="4" hidden>
                            <label for="star4"></label>
                            <input type="radio" id="star3" name="rating" value="3" hidden>
                            <label for="star3"></label>
                            <input type="radio" id="star2" name="rating" value="2" hidden>
                            <label for="star2"></label>
                            <input type="radio" id="star1" name="rating" value="1" hidden>
                            <label for="star1"></label>
							<input type="hidden"  name="gID" value="<%=Integer.parseInt(request.getParameter("ID"))%>">
                        </div>
						
						
						<input type="text" placeholder="姓名" name="id" value="<%=memberid%>" required><br/>
                        <input type="text" placeholder="評論" name="comment" required><br/>
						 
                        <input type="submit" value="送出" class="send"> </form>
                </div>
            </li>
        </ul>
		<%
		try {
//Step 1: 載入資料庫驅動程式 
Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url2="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql2="";
        Connection con2=DriverManager.getConnection(url2,"root","1234");
        if(con2.isClosed())
           out.println("連線建立失敗");
	
        else {
//Step 3: 選擇資料庫   
           sql2="USE `demo`";
           con2.createStatement().execute(sql2);
//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet	
          sql2="SELECT * FROM `board` WHERE `productid`='"+pid+"'"; //算出共幾筆留言
           ResultSet rs2=con2.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql2);
           //ResultSet.TYPE_SCROLL_INSENSITIVE表紀錄指標可前後移動，ResultSet.CONCUR_READ_ONLY表唯讀
           //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
           rs2.last();
           int total_content=rs2.getRow();
           int page_num=(int)Math.ceil((double)total_content/5.0);
		   
		   
           
           out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+"總共"+total_content+"筆留言"+"  |  "+"請選擇頁數:  ");
           //每頁顯示5筆, 算出共幾頁
            //無條件進位
           //使用超連結方式, 呼叫自己, 使用get方式傳遞參數(變數名稱為page)
           for(int i=1;i<=page_num;i++) //建立1,2,...頁超連結
			   out.print("<a href='product.jsp?ID="+pid+"&page="+i+"'>"+i+"</a>&nbsp;"); //&nbsp;html的空白

           out.println("<p>");

           //讀取page變數
           String page_string = request.getParameter("page");
           if (page_string == null) {
               page_string = "0";  
		   }			   
           int current_page=Integer.valueOf(page_string);
           if(current_page==0)			   //若未指定page, 令current_page為1
		   {
	          current_page=1;
		   }
	       //計算開始記錄位置   
//Step 5: 顯示結果 
           int start_record=(current_page-1)*5;
           //遞減排序, 讓最新的資料排在最前面
           sql2="SELECT * FROM `board` WHERE `productid`='"+pid+"' ORDER BY `id` DESC LIMIT ";
           sql2+=start_record+",5";

//		 current_page... SELECT * FROM `gustbook`` ORDER BY `gbno` DESC LIMIT
//      current_page=1: SELECT * FROM `gustbook` ORDER BY `gbno` DESC LIMIT 0, 5
//      current_page=2: SELECT * FROM `gustbook` ORDER BY `gbno` DESC LIMIT 5, 5
//      current_page=3: SELECT * FROM `gustbook` ORDER BY `gbno` DESC LIMIT 10, 5
           rs2=con2.createStatement().executeQuery(sql2);
//  逐筆顯示, 直到沒有資料(最多還是5筆)
           while(rs2.next())
                {
					
                    %>
        <!-- 顧客評論 -->
        <div class="customer">           
            <div class="comment">
                <div class="comments_container">
                    <img src="assets/images/man.jpg">
                    <p class="comments_stars">★★★★</p>
					<p class="comments_content">姓名:<%=rs2.getString(2)%></p>
                    <p class="comments_content"><%=rs2.getString(3)%></p>
					
                </div>
            </div>
        </div>
		  <%
    }
          
    //Step 6: 關閉連線
              con2.close();
		
        }
	}
        catch (SQLException sExec) {
               out.println("SQL錯誤"+sExec.toString());
               
        }
    }
    catch (ClassNotFoundException err) {
          out.println("class錯誤"+err.toString());
    
    }
		}				
		

else{
	out.println("請先登入會員");	
}
                   
		  
%>
        
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