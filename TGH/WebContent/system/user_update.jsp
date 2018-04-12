<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%	
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
		Statement stmt = conn.createStatement();
		String sql = "UPDATE userdate SET user_pw = '" + pw + "', user_name = '" + name + "', user_phone = '" + phone + "' WHERE user_id = '" + id + "'";
		stmt.executeUpdate(sql);
		response.sendRedirect("../Alter/update_success.html");
	}catch(Exception e){
		response.sendRedirect("../Alter/update_fail.html");
	}

%>