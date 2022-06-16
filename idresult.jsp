<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!-- Step 0: import library -->
<%@page import = "java.sql.*"%>
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
           while(rs.next()){			
		    //一筆一筆讀取資料，如果回傳false,表示資料讀取完畢。
		    //用回圈印出結果，getString(1)表示id,getString(2)表示name,依此類推
			out.print("id =" +rs.getString(1)+ "<BR>");
                        for(int i=2; i<=3; i++){
                            out.println(rs.getString(i) + "<BR>");
                        }
						out.print("<img src =" +rs.getString(4)+">"+ "<BR>");
                        out.println("---------------------------------------<BR>");
			//每次印完一次資料，就印分隔線區隔。
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