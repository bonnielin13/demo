<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Step 0: import library -->
<%@ page import = "java.sql.*" %> 
<html>
    <head>
        <title>JSP UPDATE</title>
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
                    
                   
	                String id=request.getParameter("id1");
	                String name=request.getParameter("name1");
           			String price=request.getParameter("price1");
                    String content=request.getParameter("content1"); 
                    String number=request.getParameter("number1");
					String car1=request.getParameter("car11");
					String car2=request.getParameter("car21");
					String car3=request.getParameter("car31");
                    String car4=request.getParameter("car41");
                    String car5=request.getParameter("car51");
                    String car6=request.getParameter("car61");
					String car7=request.getParameter("car71");
                    //con.createStatement().execute(sql);
					String sql = "UPDATE `product` SET name = '"+name+"',price = '"+price+"',content= '"+content+"',number = '"+number+"',car1 = '"+car1+"',car2 = '"+car2+"',car3 = '"+car3+"',car4 = '"+car4+"',car5 = '"+car5+"',car6 = '"+car6+"',car7 = '"+car7+"' WHERE id = '"+id+"' ";
					
                 int no=con.createStatement().executeUpdate(sql); //可回傳異動數
				 if (no > 0)
					{
                    out.println("修改成功");
					out.println("<a href = backindex.jsp>"+"返回"+"</a>");
					//Step 6: 關閉連線
					}					
					
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
