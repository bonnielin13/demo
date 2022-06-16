<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if(request.getParameter("memberid") !=null && !request.getParameter("memberid").equals("") 
	&& request.getParameter("pwd") != null && !request.getParameter("pwd").equals("")){

    sql = "SELECT * FROM `member` WHERE `memberid`='" +request.getParameter("memberid") + 
	      "'  AND `pwd`='" + request.getParameter("pwd") + "'"  ; 
	
    ResultSet rs =con.createStatement().executeQuery(sql);
    if( request.getParameter("memberid").equals ("10944148") &&  request.getParameter("pwd").equals ("10944154")){
   session.setAttribute("memberid","pwd");
   out.print("<script>alert('管理員登入成功！'); window.location='backindex.jsp' </script>");
  }
  else{
    if(rs.next()){            
        session.setAttribute("memberid",request.getParameter("memberid"));
		con.close();//結束資料庫連結
        response.sendRedirect("member.jsp") ;
    }
    else{
		con.close();//結束資料庫連結
        out.println("密碼帳號不符 !! <a href='login.html'>按此</a>重新登入") ;
	}
}
	}
else
	response.sendRedirect("login.html");
%>
