<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% 
String isLogin = (String)session.getAttribute("isLogin");
System.out.println("[ isLogin ] " + isLogin);


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			function rental_room(){
				if(document.hidden_form.checkroom.value == 0){
					alert("대여 가능한 방이 없습니다.");
				}else{
					document.hidden_form.submit();
				}
				
				
			
			}
		</script>
		<style>
			#room_des{
				padding-left: 200px;
			}
			#rental_btn{
				background-color: #FFFFFF;
				color: black;
				border: none;
				padding: 10px;
				padding-left: 10px;
				padding-right: 10px;
				font-size: 18px;
				margin-top: 30px;
				margin-left: 1610px;
			}
		</style>
	</head>
	<body>
		<%
			String set = request.getParameter("set");
			String amo = "";
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
				Statement stmt = conn.createStatement();
				String sql = "SELECT room_grade, room_grade_ko, room_name, room_name_ko, room_price, room_exp from room_set WHERE room_name = '" + set + "'";
				String SQL = "SELECT room_amount FROM room_set WHERE room_name = '" + set + "'";
				ResultSet amt = stmt.executeQuery(SQL);
				while(amt.next()){
					amo = amt.getString(1);
				}
				System.out.println("Amount = " + amo);
				ResultSet rs = stmt.executeQuery(sql);
				String room_names = "";
				String room_price = "";
				while(rs.next()){
					String src = rs.getString("room_name") + ".jpg"; 
					room_names = rs.getString("room_name");
					room_price = rs.getString("room_price");
					//System.out.println("[ Room Name ] " + room_names);
					%>
					<button id="rental_btn" onclick="rental_room()">예약하기</button>
					<h1 id="room_des" style="color: white;"><%=rs.getString("room_grade") %></h1>
					<center>
					<h3 style="color: white;">[<%=rs.getString("room_name") %>]</h3>
					<h4 style="color: white;">가격 [<%=rs.getString("room_price") %>\]</h4>
					<h4 style="color: white;"><%=rs.getString("room_exp") %></h4>
					
					<img src="image/<%=src %>" id="mainImage" alt="Image" style="width:1500px;height:500px;"></center>
					<form action="system/check_login.jsp" name="hidden_form">
						<input type="hidden" name="room_name" value="<%=room_names%>">
						<input type="hidden" name="room_price" value="<%=room_price%>">
						<input type="hidden" name="checkroom" value="<%=amo%>">
					</form>
					<%
				}
				
				
			}catch(Exception e){
				//System.out.println("[ Error ] " + e);
			}
		
		%>
		
	</body>
</html>