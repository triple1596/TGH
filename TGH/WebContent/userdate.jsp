<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			function check_update(){
				var ch = prompt("변경 전 비밀번호를 입력해주십시오","ex) Password1234");
				if(ch == document.userdate_form.check_user.value){
					if(document.userdate_form.name.value == ""){
						alert("회원성명을 입력하여 주십시오");
						return false;
					}else if(document.userdate_form.id.value == ""){
						alert("아이디를 입력하여 주십시오");
						return false;
					}else if(document.userdate_form.pw.value == ""){
						alert("비밀번호를 입력하여 주십시오");
						return false;
					}else if(document.userdate_form.pw.value != document.userdate_form.repw.value){
						alert("재확인 비밀번호를 확인하여 주십시오");
						return false;
					}else if(document.userdate_form.phone.value == ""){
						alert("전화번호를 입력해주십시오");
						return false;
					}else{
						
						return true;
					}
				}else{
					alert("비밀번호가 일치하지 않습니다");
					return false;
				}
			}
		</script>
		<style>
			th{
				text-align: left;				
				color: black;				
				font-size: 20px;				
				font-weight: lighter;
			}			
			td{
				text-align: center;
				padding-left: 50px;
				padding-top: 20px;				
			}
			#input_btn{
				background-color: black;
				color: #FFFFFF;
				border: none;
				padding: 10px;
				padding-left: 10px;
				padding-right: 10px;
				font-size: 18px;
			}
			#div_white{
				background-color: #FFFFFF;
				padding-bottom: 100px;
			}
			h1{
				color: #FFFFFF;
				padding-right: 1000px;
				margin-left: 400px;
			}
			hr{
				height: 4px;
				background-color: #FFFFFF;
			}
			
			#info_input{
				border-left-width: 0px; 
				border-right-width: 0px; 
				border-top-width: 0px; 
				border-bottom-width: 2px; 
				border-color: black;
				font-size: 20px;
			}
			#update_table{
				padding-top: 100px;	
			}
		</style>
	</head>
	<body>
		<h1>회원 정보 수정</h1><hr/>
		<%
			String user_id = (String) session.getAttribute("user_id");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "1234");
			Statement stmt = conn.createStatement();
			String sql = "SELECT user_id, user_pw, user_name, user_phone FROM userdate WHERE user_id = '" + user_id	+ "'";
			//System.out.println("[ SQL ] " + sql);
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
		%>
		<div id="div_white">
		<center>
		<form action="system/user_update.jsp" method="post" name="userdate_form" onsubmit="return check_update()">
			<table id="update_table">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" id="info_input" autocomplete="off" value="<%=rs.getString("user_name")%>"></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" id="info_input" maxlength="15"	autocomplete="off" value="<%=rs.getString("user_id")%>" readonly></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id="info_input" name="pw"></td>
				</tr>
				<tr>
					<th>비밀번호 재확인</th>
					<td><input type="password" id="info_input" name="repw"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" id="info_input" name="phone" autocomplete="off" value="<%=rs.getString("user_phone")%>"></td>
				</tr>
				<tr>
					<td>    </td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="회원 정보 수정" id="input_btn"></td>
				</tr>
			</table>
			<input type="hidden" name="check_user" value="<%=rs.getString("user_pw")%>">
		</form>
		</center>
		</div>
			<%
				}
			%>
		
	</body>
</html>