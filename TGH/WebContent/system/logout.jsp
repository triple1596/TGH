<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.invalidate();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta http-equiv="refresh" content="0;url='../index.jsp'" />
		<script type="text/javascript">
			function pro() {
				alert("로그아웃이 완료되었습니다");
			}
		</script>
	</head>
	<body onload="pro()">
	
	</body>
</html>