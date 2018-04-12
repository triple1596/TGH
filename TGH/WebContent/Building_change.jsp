<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String type = (String)session.getAttribute("type");

	if(type == "movie"){
		session.setAttribute("type", "hotel");
	}else{
		session.setAttribute("type", "movie");
	}
	String chercksession = (String)session.getAttribute("type");
	System.out.println("[ Session ] " + chercksession);
	response.sendRedirect("index.jsp");



%>