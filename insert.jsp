
<!-- Step 0: import library -->
<%@ page import = "java.sql.*" %> 

<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<html>
    <head>
        <title>JSP INSERT</title>
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
                    con.createStatement().execute("use `demo`");  
//Step 4: 執行 SQL 指令        
                   
					String new_name =  (request.getParameter("name"));
					String new_price =  (request.getParameter("price"));
					String new_content =  (request.getParameter("content"));
					String new_number = (request.getParameter("number"));
					String new_car1 =  (request.getParameter("car1"));
					String new_car2 =  (request.getParameter("car2"));
					String new_car3 =  (request.getParameter("car3"));
					String new_car4 =  (request.getParameter("car4"));
					String new_car5 =  (request.getParameter("car5"));
					String new_car6 =  (request.getParameter("car6"));
					String new_car7 =  (request.getParameter("car7"));
                    String sql = "INSERT `product`(`name`,`price`,`content`,`number`,`car1`,`car2`,`car3`,`car4`,`car5`,`car6`,`car7`) ";
					sql+="VALUES ('" + new_name + "', ";
                    sql+="'"+new_price+"', ";
		            sql+="'"+new_content+"', ";
                    sql+="'"+new_number+"', ";
                    sql+="'"+new_car1+"', ";
					sql+="'"+new_car2+"', ";
					sql+="'"+new_car3+"', ";
					sql+="'"+new_car4+"', ";
					sql+="'"+new_car5+"', ";
					sql+="'"+new_car6+"', ";
					sql+="'"+new_car7+"')";
					
								
                    //SQL語法，這裡需要用單引號, 59有無單引號都可
                    //con.createStatement().execute(sql);
                    int no=con.createStatement().executeUpdate(sql); //可回傳異動數
                    if (no>0){
//Step 5: 顯示結果 
                    out.println("新增成功");
					out.println("<a href = backindex.jsp>"+"返回"+"</a>");
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