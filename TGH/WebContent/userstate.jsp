<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<style>		
			#div_white{
				background-color: #FFFFFF;
				padding-bottom: 200px;
			}
			hr{
				height: 4px;
				background-color: #FFFFFF;
			}
			h1{
				color: #FFFFFF;
				padding-right: 1000px;
				margin-left: 400px;
			}
			#input_btn{
				background-color: black;
				color: #FFFFFF;
				border: none;
				padding: 10px;
				padding-left: 10px;
				padding-right: 10px;
				font-size: 18px;
			}
			th{
				font-size: 20px;
				text-align: left;
				font-weight: lighter;
			}
			td{
				text-align: center;
				padding-left: 50px;
				padding-top: 20px;
				font-weight: bolder;				
				font-size: 20px;
				border-bottom-color: black;
				border-bottom: 1px;				
			}
			table{
				padding-top: 100px;
			}
	</style>
	<body>
			<h1>회원 정보</h1><hr/>
			<div id="div_white">
				<%
					String user_id = (String) session.getAttribute("user_id");
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "1234");
					Statement stmt = conn.createStatement();
					String sql = "SELECT user_id, user_name, user_phone FROM userdate WHERE user_id = '" + user_id	+ "'";
					//System.out.println("[ SQL ] " + sql);
					ResultSet rs = stmt.executeQuery(sql);
					while (rs.next()) {
				%>
					<center>
						<table>
							<tr>
								<th>이름</th>
								<td><%=rs.getString("user_name") %></td>
							</tr>
							<tr>
								<th>아이디</th>
								<td><%=rs.getString("user_id") %></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><%=rs.getString("user_phone") %></td>
							</tr>
							<tr>
								<td>   </td>
							</tr>
							<tr>
								<td colspan="2">
									<button onclick="location.href='index.jsp?param=userdate.jsp'" id="input_btn">회원정보 수정</button>
									<button onclick="location.href='index.jsp?param=userroom.jsp'" id="input_btn">방 대여 정보</button>
								</td>
							</tr>
						</table>
					</center>
				<%
					}
				%>
			</div>	
	</body>
</html>