<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		</head>
	<body>
		<%
			String set = request.getParameter("set");
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
				Statement stmt = conn.createStatement();
				String sql = "SELECT room_grade, room_grade_ko, room_name, room_name_ko, room_price, room_exp from room_set WHERE room_name = '" + set + "'";
				
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){
					String src = rs.getString("room_name") + ".jpg"; 					
					%>
					
					<h2 style="color: white;">Category [<%=rs.getString("room_grade") %>]</h2>
					<h3 style="color: white;">Room Name [<%=rs.getString("room_name") %>]</h3>
					<h4 style="color: white;">Price [<%=rs.getString("room_price") %>]</h4>
					<h4 style="color: white;">Explanation [<%=rs.getString("room_exp") %>]</h4>
					
					<img src="image/<%=src %>" id="mainImage" alt="Image" style="width:1500px;height:500px;">
					
					<%
				}
				
				
			}catch(Exception e){
				//System.out.println("[ Error ] " + e);
			}
		
		%>
	</body>
</html>