<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if(request.getParameter("first") !=null && !request.getParameter("first").equals("")
 &&request.getParameter("last") !=null && !request.getParameter("last").equals("")
 && request.getParameter("memberid") !=null && !request.getParameter("memberid").equals("") 
 && request.getParameter("pwd") != null && !request.getParameter("pwd").equals("")){
  
  
 request.setCharacterEncoding("UTF-8");  
 String new_first=request.getParameter("first");
 String new_last=request.getParameter("last");
 String new_id=request.getParameter("memberid");
 String new_pwd=request.getParameter("pwd");

    sql = "INSERT member (`memberid`, `pwd`,`first`,`last`) ";
           sql+="VALUES ('" + new_id + "', ";
           sql+="'"+new_pwd+"', ";
		   sql+="'"+new_first+"', ";
           sql+="'"+new_last+"')";      
           con.createStatement().execute(sql);
    out.print("<script>alert('註冊會員成功!'); window.location='login.html'</script>");
}
else
 response.sendRedirect("login.html");
%>
%>
