<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			function test(){
				var start = document.loan_form.loan.value;
				var end = document.loan_form.returnd.value;

				/*start = start.split('-');
				end = end.sqlit('-');
				
				/*start = new Date(start[0], start[1], start[2]);
				end = new Date(end[0], end[1], end[2]);
				
				
				start_unixtime = parseInt(start.getTime()/1000);
				end_unixtime = parseInt(end.getTime()/1000);
				
				var timeDifference = start_unixtime - end_unixtime;
				var timeDifferenceInHours = timeDifference/60/60;
			 	var timeDifferenceInDays = timeDifferenceInHours/24;*/

				
				
				if(start < end){
					document.loan_form.submit();
					
				}else{
					alert("반납일자는 대출일자보다 미래에 있어야 합니다");
				}
				 
				
				
			}
			$(document).ready(function(){
			    $('input[type="date"]').change(function(){
			        //alert(this.value);       
			        var inputDate = new Date(this.value);
			    });
			});
		</script>
	</head>
	<body>
		<% 
		String now_name = request.getParameter("room_name");
		String now_grade = request.getParameter("room_name");
		
		%>
		<form action="system/check_date.jsp" method="post" name="loan_form">
			<h3 style="color: white;">Selected Room Set [<%=now_name %>]</h3>
			
			<h4 style="color: white;">Loan date</h4>
			<input type="date" name="loan">
			<h4 style="color: white;">Return date</h4>
			<input type="date" name="returnd">
			<input type="button" value="Test" onclick="test()">
		</form>
		

	</body>
</html>

