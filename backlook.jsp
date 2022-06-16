<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Step 0: import library -->
<%@ page import = "java.sql.*" %> 
<html>
    <head>
        <title></title>
    </head>
    <body>
       
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
                    con.createStatement().execute("USE `demo`");
//Step 4: 執行 SQL 指令 
                    String sql = "SELECT `memberid`, `id`, `time`, `ordernum` FROM `order`" ;
                    ResultSet tmp =  con.createStatement().executeQuery(sql);
//Step 5: 顯示結果                  
			out.println("會員編號&nbsp車型編號&nbsp預約時間&nbsp訂單編號<br>");
                    while(tmp.next()){			
		    //一筆一筆讀取資料，如果回傳false,表示資料讀取完畢。
		    //用回圈印出結果，getString(1)表示id,getString(2)表示name,依此類推
                        for(int i=1; i<5; i++){
                            out.println(tmp.getString(i)+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
                        }
                        out.println("<BR>");
			//每次印完一次資料，就印分隔線區隔。
		    }
//Step 6: 關閉連線					
                    con.close();
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
