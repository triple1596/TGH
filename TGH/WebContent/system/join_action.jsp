<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("INSERT INTO userdate(user_pk, user_id, user_pw, user_name, user_phone) VALUES(SEQ_USER.NEXTVAL,'" + id + "','" + pw + "','" + name + "','" + phone + "')");
		response.sendRedirect("../Alter/join_success.html");
	}catch(Exception e){
		response.sendRedirect("../Alter/join_fail.html");
	}

%>