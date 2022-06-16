<%@ page pageEncoding="UTF-8" import="java.util.*, java.sql.*" %>


<%
	if(session.getAttribute("memberid")==null){
		out.print("<script>alert('請先登入！'); window.location='login.html'</script>");
	}
	else{
			String id = request.getParameter("cartid");
			String time = request.getParameter("cartime");
			String amount = (String) session.getAttribute("amount");
			String memberid = (String) session.getAttribute("memberid");

			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost/";
			Connection con=DriverManager.getConnection(url,"root","1234");
			String sql="USE demo";
			con.createStatement().execute(sql);

			sql = "select * from `cart` where memberid='" + memberid + "' AND id='"+id+"'  AND time='"+time+"' AND amount='"+amount+"'";
			ResultSet rs=con.createStatement().executeQuery(sql); 
						
				sql="insert cart(memberid,id,time,amount) value ('" + memberid + "' , ";
				sql+="'"+id+"',";
				sql+="'"+time+"',";
				sql+="'"+1+"')";
				con.createStatement().execute(sql);
				
					out.print("<script>alert('加入購物車成功!'); window.location='cart.jsp'</script>");

		con.close();
	}


	


				
%>



