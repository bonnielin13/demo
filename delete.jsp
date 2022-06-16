<!doctype html>
<%@ page import = "java.sql.*"%> 
<%@page import="java.util.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<html>
   <head>
      <title>產品刪除</title>
   </head>
   <body>
      <%  
        try {
            Class.forName("com.mysql.jdbc.Driver");	  
            try {
//Step 2: 建立連線
                String url="jdbc:mysql://localhost/?serverTimezone=UTC";
                Connection con=DriverManager.getConnection(url,"root","1234");   				
	        	if(con.isClosed())
                    out.println("連線建立失敗");
                else
                    {	
                 request.setCharacterEncoding("utf-8");
                 con.createStatement().execute("USE demo");
         	
         
  
         String id=request.getParameter("id2");
        
         
			
         
         	 String sql ="DELETE FROM `product` WHERE id='"+id+"'";
             
         int rec=con.createStatement().executeUpdate(sql);
         	if(rec>0)
         {   
         
	        out.println("刪除成功");
			out.println("<a href = backindex.jsp>"+"返回"+"</a>");
			}
	 else{
		 out.println("刪除失敗");
			out.println("<a href = backindex.jsp>"+"返回"+"</a>");
	 }
	 

         con.close();
					} }        
                              
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
         