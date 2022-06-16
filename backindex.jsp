<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>後台</title>
    <link rel="stylesheet" href="./assets/css/style.css">
</head>
<body >
    
    <div class="login">
	
        <fieldset>
            <legend class="legand">查詢車型ID</legend>
            <form action="idresult.jsp" method="post">
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
		
        <input type="submit" value="查詢車型">
  </form>			
			
			
        </fieldset>
		
        <form action="insert.jsp" method="POST">
        <fieldset>
            <legend class="legand">新增</legend>
			<input type="text" name="name" placeholder="車輛名稱" required /><br>
			<input type="text" name="price" placeholder="車輛價格" required /><br>
			<input type="text" name="content" placeholder="車輛介紹" required /><br>
			<input type="text" name="number" placeholder="車輛庫存" required /><br>
			<input type="text" name="car1" placeholder="車身座位" required /><br>
			<input type="text" name="car2" placeholder="性能數據" required /><br>
			<input type="text" name="car3" placeholder="變速系統" required /><br>
			<input type="text" name="car4" placeholder="能量消耗" required /><br>
			<input type="text" name="car5" placeholder="引擎形式" required /><br>
			<input type="text" name="car6" placeholder="排氣量" required /><br>
			<input type="text" name="car7" placeholder="進口國產?" required /><br>
			<input type="submit" class="button" value="新增">
			
        </fieldset>
		</form>
		<form action="update.jsp" method="POST">
        <fieldset>
            <legend class="legand">修改</legend>
			<input type="text" name="id1" placeholder="id" ><br>
            <input type="text" name="name1" placeholder="車輛名稱" ><br>
			<input type="text" name="price1" placeholder="車輛價格"  ><br>
			<input type="text" name="content1" placeholder="車輛介紹" ><br>
			<input type="text" name="number1" placeholder="車輛庫存" ><br>
			<input type="text" name="car11" placeholder="車身座位" ><br>
			<input type="text" name="car21" placeholder="性能數據" ><br>
			<input type="text" name="car31" placeholder="變速系統" ><br>
			<input type="text" name="car41" placeholder="能量消耗" ><br>
			<input type="text" name="car51" placeholder="引擎形式" ><br>
			<input type="text" name="car61" placeholder="排氣量" ><br>
			<input type="text" name="car71" placeholder="進口國產?" ><br>
			<input type="submit" class="button" value="修改">
			
        </fieldset>
		</form>
		
		<form action="delete.jsp" method="POST">
        <fieldset>
            <legend class="legand">刪除</legend>
            <input type="text" name="id2" placeholder="id" ><br>
			<input type="submit" class="button" value="刪除">
			
        </fieldset>
		</form>
		<form action="backlook.jsp" method="POST">
        <fieldset>
            <legend class="legand">瀏覽</legend>
            
			<input type="submit" class="button" value="瀏覽訂單">
			
        </fieldset>
		</form>
		<a href="index.jsp">返回首頁</a>
    </div>
  
</body>
</html>