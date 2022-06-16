<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<% 
session.removeAttribute("memberid");
out.print("<script>alert('成功登出會員!'); window.location='index.jsp'</script>");
%>