<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
#nav {
	background-color: #8C8C8C;
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
	margin: 0;
	padding: 0;
}

.zeta-menu li {
	float: left;
	list-style: none;
	position: relative;
}

.zeta-menu li:hover {
	background: #8C8C8C;
}

.zeta-menu li:hover>a {
	color: hotpink;
}

.zeta-menu a {
	color: white;
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
			<li><a href="Building_change.jsp">호텔 페이지로</a></li>
			<li><a href="index.jsp?param=movie/movie_list.jsp">영화 목록</a>
			<li><a href="#">2</a>
				<ul>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
				</ul></li>
			<li><a href="#">3</a>
				<ul>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
				</ul></li>
		</ul>
	</div>
</body>