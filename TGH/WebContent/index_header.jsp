<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
	.atag{
		font-size: small;
		color: #BDBDBD;
		float: right;
		padding-right: 15%;
		padding-top: 3%;
	}
	.btag{
		font-size: small;
		color: #BDBDBD;
		float: right;
		padding-right: 10%;
		padding-top: 3%;
	}
	.header{
		text-align: center;
	}
	#container {display: flex;}
	#box-left {
		flex: 3;
		text-align: right;
	}
	#box-center {
		flex: 3;
		margin-top: 30px;
		padding-top: 25px;
		padding-bottom: 25px;
	
	}
	#box-right { flex: 3;}
	
	#icon{
		width: 170px;
		height: 170px;
	}
	
</style>
<div class="header" id="container">
	<div id="box-left">
		
		<img alt="logo" src="image/logoicon.png" id="icon">
	</div>
	<div id="box-center">
		
		<a href="index.jsp"><img alt="TGH" src="image/TGH.png"></a>
	</div>
	<div id="box-right">
		<% 
		String log = (String)session.getAttribute("isLogin");
		if(log != null){
			%>
				<a class="atag" href="system/logout.jsp">로그아웃</a>
				<a class="btag">|</a>
				<a class="atag" href="index.jsp?param=userdate.jsp">회원정보</a>
			<%
		}else{
			%><a class="atag" href="index.jsp?param=login.jsp">로그인</a><%
		}
		%>
		
		
		
		
		
		<a class="btag">|</a>
		<a class="atag" href="index.jsp?param=join.jsp">회원가입</a>
	</div>
</div>