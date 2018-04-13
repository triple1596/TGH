<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String log = (String)session.getAttribute("isLogin");
	if(log != null){
		String sendtext = request.getParameter("room_name");
		String sendgrade = request.getParameter("room_grade");
		response.sendRedirect("../index.jsp?param=rental_room.jsp&room_name=" + sendtext + "&room_grade=" + sendgrade);
	}else{
		response.sendRedirect("../Alter/rental_fail.html");
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	
	</body>
</html>