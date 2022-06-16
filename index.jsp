
<%@ page contentType="text/html" import="java.sql.*" language="java" import="java.util.*"%>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CAR</title>
    <link rel="stylesheet" type="text/css" href="assets/css/index.css">
    <script src="assets/js/index.js"></script>
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
		<%
try {
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
           ResultSet rs;
           con.createStatement().execute(sql);
           //設定亂數ran
           Random ran=new Random();
           // current_adid亂數決定值為1-3,//nextInt(3)產生0到2的亂數
           int current_adid=ran.nextInt(3)+1;
//Step 4: 執行 sql9 指令, 只有一筆資料             
           sql="SELECT * FROM `randad` WHERE `ADID`= " + current_adid;
           rs=con.createStatement().executeQuery(sql);
//Step 5: 顯示結果            
           // 產生廣告需要的連結, 圖片, 替代文字
           while (rs.next()) //只有一筆資料
           {
             out.println("<a href="+rs.getString(4)+">");
					
             out.println("<img style= padding-left:100px;text-align:center;width:1200px;height:600px; src =assets/"+rs.getString(2)+"/"+rs.getString(3)+">");
			 
           }
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
			<br>
			
<%/*
			String thePath=request.getRealPath("/")+"final" ; 

			//getRealPath表本網頁所在的目錄
			File count=new File(thePath,"count.txt");//要事先建立
			BufferedReader count_in=new BufferedReader(new FileReader(count));//建立檔案輸入串流
			int x=Integer.parseInt(count_in.readLine());//使用readLine讀取檔案, 格式為字串
			count_in.close();//關閉輸入串流
			//計數器加1
			if(session.isNew())
			x++;
			out.print("<br>"+"你是第"+x+"位訪客");
			FileWriter count_out=new FileWriter(count);
			count_out.write(String.valueOf(x));//將數字轉成字串,寫入輸出串流
			count_out.flush();//將buffer寫入
			count_out.close();//關閉串流*/

			%>
			<br>
			<%
try {
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
			int count=0;
			
           String sql="USE `demo`";
           con.createStatement().execute(sql);
		   sql = "SELECT * FROM `count`";
		   ResultSet rs = con.createStatement().executeQuery(sql);
		   if(rs.next()){
			    String countString = rs.getString(1);
			    count = Integer.parseInt(countString);
			    if(session.isNew()){
				    count=count+1;
				    countString = String.valueOf(count);
				    sql = "Update `count` SET `count` = "+countString;
				    con.createStatement().execute(sql);
			}
			out.print("你是第"+count+"位訪客!");
		   }
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
    </header>
    
	
	
	
	
	
    
</body>
</html>