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
		<style>
			#div_white{
				background-color: #FFFFFF;
				height: 540px;
			}
			#price{
				padding-left: 200px;
			}
			h1{
				padding-left: 200px;
			}
			#little{
				font-size: 15px;
				font-weight: lighter;
			}
			h3{
				padding-left: 200px;
			}
			hr{
				height: 4px;
				background-color: #FFFFFF;
			}
			#input_des{
				margin-left: 200px;
				border-color: black;
				width: 300px;
				height: 30px;
			}
			#input_btn{
				background-color: black;
				color: #FFFFFF;
				border: none;
				padding: 10px;
				padding-left: 10px;
				padding-right: 10px;
				font-size: 18px;
				margin-left: 200px;
			}
		</style>
	</head>
	<body>
		<% 
		String now_name = request.getParameter("room_name");
		String now_price = request.getParameter("room_price");
		
		%>
		<form action="system/check_date.jsp" method="post" name="loan_form">
			<h1 style="color: white;"><%=now_name %></h1><hr/>
			
			<div id="div_white">
				<h2 id="price">가격 [<%=now_price %>\<a id="little">/1박</a>]</h2><br/>
				
				<h3>체크인</h3>
				<input id="input_des" type="date" name="loan">
				<h3>체크아웃</h3>
				<input id="input_des" type="date" name="returnd">
				<input type="hidden" name="room_type" value="<%=now_name%>"><br/><br/><br/>
				<input id="input_btn" type="button" value="예약하기" onclick="test()">
			</div>
		</form>
		

	</body>
</html>

