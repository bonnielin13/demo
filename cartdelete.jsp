<%@ page pageEncoding="UTF-8" import="java.util.*, java.sql.*" %>
<%
            Class.forName("com.mysql.jdbc.Driver");	  
            String url="jdbc:mysql://localhost/?serverTimezone=UTC";
            Connection con=DriverManager.getConnection(url,"root","1234");   				
            String num = request.getParameter("cartnum");
			String delete = request.getParameter("delete");
			String sql="USE demo";
			con.createStatement().execute(sql);          
            request.getParameter("delete");
                sql="delete from `cart` where num = '"+num+"'";
                con.createStatement().execute(sql);
			    out.print("<script>alert('刪除成功！'); window.location='cart.jsp'</script>");
			con.close();
%>