<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			table{
				color: white;
			}
		</style>
	</head>
	<body>
	<% 
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
		Statement stmt = conn.createStatement();
		String sql = "SELECT m.movie_name, m.movie_time, m.movie_auther, m.movie_type, TO_CHAR(t.start_time,'HH24:MI'), TO_CHAR(t.start_time+(SELECT movie_time FROM movie WHERE movie_pk = m.movie_pk)/24/60,'HH24:MI'), m.movie_pk FROM movie m, movie_time t WHERE m.movie_pk = t.movie_pk";
		ResultSet rs = stmt.executeQuery(sql);
		%>
		<table>
			<tr>
				<th>영화 제목</th>
				<th>상영시간</th>
				<th>감독</th>
				<th>장르</th>
				<th>상영 시작 시간</th>
				<th>상영 종료 시간</th>
				<th>         </th>
			</tr>
			
			
		
		
		<%
		
		while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %>분</td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><%=rs.getString(6) %></td>
				<td><a href="./Alter/movie_check.jsp?pk=<%=rs.getString(7) %>">예매</a></td>
			</tr>
			
			
			<%
			
		}
	%>
	
		</table>
	</body>
</html>