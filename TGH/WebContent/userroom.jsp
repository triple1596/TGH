<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			function del_room() {
				var choice = confirm("방 예약을 취소하시겠습니까?");
				if(choice == true){
					var two_choice = prompt("고객님의 비밀번호를 입력하여 주십시오","ex) Password");
					if(two_choice == document.check_form_user.user_pw.value){
						
					}else{
						alert("비밀번호가 다릅니다.");
					}
				}else{
					return false;
				}
			}
		</script>
		<style type="text/css">			
			h1{
				color: #FFFFFF;
				padding-left: 400px;
			}
			hr{
				height: 4px;
				background-color: #FFFFFF;
			}
			#div_white{
				background-color: #FFFFFF;
				height: 540px;
			}
			#input_btn{
				background-color: black;
				color: #FFFFFF;
				padding: 10px;
				padding-left: 7px;
				padding-right: 7px;
				font-size: 15px;
			}
			#room_table{
				text-align: center;
				padding-top: 120px;
			}
			td{
				width: 150px;
			}
			th{
				font-size: 20px;
			}
		</style>
	</head>
	<body>
		<%
			String user_id = (String) session.getAttribute("user_id");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "1234");
			Statement stmt = conn.createStatement();
			String usercheck = "SELECT user_pw FROM userdate WHERE user_id = '" + user_id + "'";
			ResultSet check_user = stmt.executeQuery(usercheck);
			String user_pw = "";
			
			while(check_user.next()){
				user_pw = check_user.getString(1);
			}
			
			
			
			
			String sql = "SELECT s.room_grade, s.room_name, (TO_DATE(r.return_date) - TO_DATE(r.rental_date)) * s.room_price, TO_CHAR(r.rental_date,'YYYY-MM-DD'), TO_CHAR(r.return_date,'YYYY-MM-DD'), r.ren_pk FROM room_set s, rental_room r WHERE s.room_pk = r.room_pk AND r.user_pk = '" + user_id + "'";
			//System.out.println("[ SQL ] " + sql);
			ResultSet rs = stmt.executeQuery(sql);
			%>
			<h1>객실 대여 정보</h1><hr/>
			<div id="div_white">
			<center>
			<table id="room_table">
				<tr>
					<th>객실 등급</th>
					<th>객실 이름</th>
					<th>체크인 날짜</th>
					<th>체크아웃 날짜</th>
					<th>가격</th>
					<th>&nbsp;&nbsp;</th>
				</tr>
			<%
			while (rs.next()) {
			%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
					<td><%=rs.getString(3) %></td>
					<td id="input_btn"><a onclick="location.href='Alter/del_room_check.jsp?ren_pk=<%=rs.getString(6)%>&grade=<%=rs.getString(2)%>'">예약 취소</a></td>
				</tr>
			<% 
			}
		%>
		</table>
		</center>
		</div>
		
		
	</body>
</html>