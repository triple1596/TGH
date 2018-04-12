<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	int count = 0;
	String user_id = "";
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
		Statement stmt = conn.createStatement();
		String sql = "SELECT COUNT(user_pk), user_id FROM userdate WHERE user_id = '" + id + "' AND user_pw = '" + pw + "' GROUP BY user_id";
		//System.out.println("[ SQL ] " + sql);
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()){
			count = rs.getInt(1);
			user_id = rs.getString(2);
		}
		
		if(count == 1){//로그인 성공
			session.setAttribute("isLogin", "Login");
			session.setAttribute("user_id", user_id);
			//System.out.println("[ User Id ] " + user_id);
			response.sendRedirect("../index.jsp");
		}else{//로그인 실패
			response.sendRedirect("../Alter/login_fail.html");
		}
		
		
		
	}catch(Exception e){
		//System.out.println("[ Error ] " + e);
	}

%>