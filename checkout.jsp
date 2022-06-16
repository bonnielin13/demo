<%@ page pageEncoding="UTF-8" import="java.util.*, java.sql.*" %>
<%
                Class.forName("com.mysql.jdbc.Driver");
				String url="jdbc:mysql://localhost/";
				Connection con=DriverManager.getConnection(url,"root","1234");
				String sql="USE demo";
				con.createStatement().execute(sql);

                String memberid = (String) session.getAttribute("memberid");
                
                sql="select * from `cart`, `product` where memberid='" + memberid + "' AND cart.id = product.id";
                ResultSet rs=con.createStatement().executeQuery(sql);

                while(rs.next()){
                    int amount=Integer.parseInt(rs.getString("amount"));
                    int number=Integer.parseInt(rs.getString("number"));
                    if(amount>number){
                        out.print("<script>alert('該車型數量不足！');window.location='cart.jsp'</script>");
                        return;
                    }
                }
		
                String memberid1=(String)session.getAttribute("memberid"); 
				String id=(String)session.getAttribute("id"); 
				String time=(String)session.getAttribute("time");  
				
                out.print("<script>alert('預約成功！');window.location='member.jsp'</script>");
				
                sql="select * from `cart` where memberid='" + memberid + "'" ;
		        ResultSet rs1=con.createStatement().executeQuery(sql);
                while(rs1.next()){
                    sql = "insert `order` (memberid,id,time) values('"+rs1.getString("memberid")+"','"+rs1.getString("id")+"','"+rs1.getString("time")+"')";
                    con.createStatement().execute(sql); 
                }
               
                 while(rs.next()){
                    String id1 = rs.getString("id");
                    int amount=Integer.parseInt(rs.getString("amount"));
                    int number=Integer.parseInt(rs.getString("number"));
                    int newnumber=(number-amount);
                    sql = "UPDATE `product` SET number = '"+newnumber+"' where id='"+id1+"' ";
                    con.createStatement().execute(sql);
                }

                sql="delete from `cart` where memberid='"+memberid+"'";
				con.createStatement().execute(sql);

%>