<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
#nav {
	background-color: #FFFFFF;
	padding-top: 20px;
	padding-bottom: 20px;
}

body {
	margin: 0;
}

.zeta-menu-bar {
	background: hotpink;
	display: inline-block;
	width: 100%;
}

.zeta-menu {
	cursor:pointer;
	margin: 0;
	padding: 0;
}

.zeta-menu li {
	float: left;
	list-style: none;
	position: relative;
}

.zeta-menu li:hover {
	background: white;
}

.zeta-menu li:hover>a {
	color: hotpink;
}

.zeta-menu a {
	color: black;
	display: block;
	padding: 10px 20px;
	text-decoration: none;
}

.zeta-menu ul {
	background: #eee;
	border: 1px solid silver;
	display: none;
	padding: 0;
	position: absolute;
	left: 0;
	top: 100%;
	width: 180px;
}

.zeta-menu ul li {
	float: none;
}

.zeta-menu ul li:hover {
	background: #ddd;
}

.zeta-menu ul li:hover a {
	color: black;
}

.zeta-menu ul a {
	color: black;
}

.zeta-menu ul ul {
	left: 100%;
	top: 0;
}

.zeta-menu ul ul li {
	float: left;
	margin-right: 10px;
}
</style>

<script src="//code.jquery.com/jquery.min.js"></script>
<script>
	$(function() {
		$(".zeta-menu li").hover(function() {
			$('ul:first', this).show();
		}, function() {
			$('ul:first', this).hide();
		});
		$(".zeta-menu>li:has(ul)>a").each(function() {
			$(this).html($(this).html() + ' &or;');
		});
		$(".zeta-menu ul li:has(ul)").find("a:first").append(
				"<p style='float:right;margin:-3px'>&#9656;</p>");
	});
</script>
<body>
	<div class='zeta-menu-bar' id="nav">
		<ul class="zeta-menu">
			<li><a href="Building_change.jsp">영화관 페이지로</a></li>
			<li><a>스탠다드</a>
				<ul>
					<li><a href="index.jsp?param=category.jsp&set=Standard_Room">스탠다드룸</a></li>
					<li><a href="index.jsp?param=category.jsp&set=Deluxe_Room">디럭스룸</a></li>
				</ul></li>
			<li><a>프리미어</a>
				<ul>
					<li><a href="index.jsp?param=category.jsp&set=Premier_Room">프리미어룸</a></li>
					<li><a href="index.jsp?param=category.jsp&set=Premier_Terrace_Room">프리미어 테라스룸</a></li>
				</ul></li>
			<li><a>스위트</a>
				<ul>
					<li><a href="index.jsp?param=category.jsp&set=Premier_Suite_Room">프리미어 스위트룸</a></li>
					<li><a href="index.jsp?param=category.jsp&set=Royal_Suite_Room">로열 스위트룸</a></li>
				</ul></li>
		</ul>
	</div>
</body>