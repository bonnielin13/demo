<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if(session.getAttribute("memberid") != null ){
    if(request.getParameter("memberid")!=null){
    sql = "UPDATE `member` SET `memberid`='"+request.getParameter("memberid")+"', `pwd`='"+request.getParameter("pwd")+"' WHERE `memberid`='"+session.getAttribute("memberid")+"'";
	//con.createStatement().execute(sql);
    //sql = "UPDATE `member` SET `pwd`='"+request.getParameter("pwd")+"' WHERE `memberid`='"+session.getAttribute("memberid")+"'";
	con.createStatement().execute(sql);	
	con.close();//結束資料庫連結
	out.print("<script>alert('更新成功!'); window.location='member.jsp'</script>");
	}
	else{
	  con.close();//結束資料庫連結	
	  out.print("<script>alert('更新失敗!請填寫完整'); window.location='member.jsp'</script>");
	}
}
else{
	con.close();//結束資料庫連結
}
%>
