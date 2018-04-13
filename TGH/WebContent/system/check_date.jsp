<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String loan = request.getParameter("loan");
	String returnd = request.getParameter("returnd");

	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
		Statement stmt = conn.createStatement();
		String SQL = "SELECT TO_DATE('" + returnd + "') - TO_DATE('" + loan + "') FROM dual";
		String date = "";
		
		ResultSet rs = stmt.executeQuery(SQL);
		while(rs.next()){
			date = rs.getString(1);
		}
		response.sendRedirect("../Alter/check_date.jsp?param=" + date);
		
		

		
	}catch(Exception e){
		//System.out.println("[ Error ] " + e);
	}

%>