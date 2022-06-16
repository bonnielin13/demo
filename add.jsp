<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>add</title>
</head>
<body>
<%

try {

//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
           sql="USE `demo`";
           con.createStatement().execute(sql);
		     request.setCharacterEncoding("UTF-8");  
           String new_name=request.getParameter("id");
		   String new_content=request.getParameter("comment");
         int gID=Integer.parseInt(request.getParameter("gID"));
           int c = 0;
           while((c=new_content.indexOf("\n"))!=-1)
              new_content = new_content.substring(0,c) + "<br>"+new_content.substring(c+1);
//Step 4: 執行 SQL 指令	
           sql="INSERT board (`name`, `content`,`productid`) VALUES ('" + new_name + "','"+new_content+"','"+gID+"')";      
           con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          out.print("<script>alert('評價和留言已發布！'); window.location='index.jsp'</script>");
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
