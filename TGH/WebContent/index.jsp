<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>HotelsCombined</title>
		<style type="text/css">
			a{
				text-decoration: none;
			}
			body{
				background-color: black;
			}
		</style>
	</head>
	<body>
		<jsp:include page="index_header.jsp"/>
		<%
		String type = (String)session.getAttribute("type");
		if(type == null){
			%><jsp:include page="index_nav_hotel.jsp"/><%
		}else if(type.equals("movie")){
			%><jsp:include page="index_nav_hotel.jsp"/><%
		}else{
			%><jsp:include page="index_nav_movie.jsp"/><%
		}
		
		
		
		String param = request.getParameter("param");
		if(param == null){
			%><jsp:include page="index_section.jsp"/><%
		}else{
			%><jsp:include page="<%=param %>"/><%
		}
		%>
		
		<jsp:include page="index_footer.jsp"/>
	</body>
</html>