<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			function join_check(){
				if(document.join_form.name.value == ""){
					alert("회원성명을 입력하여 주십시오");
					return false;
				}else if(document.join_form.id.value == ""){
					alert("아이디를 입력하여 주십시오");
					return false;
				}else if(document.join_form.pw.value == ""){
					alert("비밀번호를 입력하여 주십시오");
					return false;
				}else if(document.join_form.pw.value != document.join_form.repw.value){
					alert("재확인 비밀번호를 확인하여 주십시오");
					return false;
				}else if(document.join_form.phone.value == ""){
					alert("전화번호를 입력해주십시오");
					return false;
				}else{
					return true;
				}
			}			
		</script>
		<style>
			#join_table{
				padding-top: 100px;				
			}
			h1{
				color: #FFFFFF;
				padding-right: 1000px;
			}
			hr{
				height: 4px;
				background-color: #FFFFFF;
			}
			#div_white{
				background-color: #FFFFFF;
				padding-bottom: 100px;
			}
			td{
				text-align: center;
				padding-left: 50px;
				padding-top: 20px;				
			}
			th{
				font-size: 20px;
				text-align: left;
				font-weight: lighter;
			}
			#info_input{
				border-left-width: 0px; 
				border-right-width: 0px; 
				border-top-width: 0px; 
				border-bottom-width: 2px; 
				border-color: black;
				font-size: 20px;
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
		</style>
	</head>
	<body>
		<center>
			<h1>회원가입</h1><hr/>
			<div id="div_white">
				<form action="system/join_action.jsp" method="post" name="join_form" onsubmit="return join_check()">
					
					<table id="join_table">
						<tr>
							<th>이름</th>
							<td><input type="text" name="name" autocomplete="off" id="info_input"></td>
						</tr>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="id" maxlength="15" autocomplete="off" id="info_input"></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="pw" id="info_input"></td>
						</tr>
						<tr>
							<th>비밀번호 재확인</th>
							<td><input type="password" name="repw" id="info_input"></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" name="phone" autocomplete="off" id="info_input"></td>
						</tr>
						<tr>
							<td>   </td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="Register" id="input_btn"></td>
						</tr>
					</table>
				</form>
			</div>
		</center>
	</body>
</html>