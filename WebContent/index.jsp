<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.header.Header"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Header header = new Header();
String css = header.getCss();
String js = header.getJs();
String title = header.getTitle();

Nav nav = new Nav();
String menu = nav.getMenu();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title><%=title%></title>
<%=css%>
<%=js%>
</head>
<body>
	<div id="wrap">
		<header>
			<div class="base_wrap">
				<h1 id=logo><a href="/"><span>Doogle</span></a></h1>
				<p class="search_wrap">
					<input type="text" id="search" placeholder="검색" />
					<button class="btn btn-success" id="btn_search">검색</button>
				</p>
			</div>
		</header>
		<nav>
			<div class="base_wrap">
				<%=menu%>
			</div>
		</nav>
		<main>
			<div class="base_wrap">
				<h2>메인페이지</h2>
				<table class="table">
					<tr><td>컨텐츠1</td></tr>
					<tr><td>컨텐츠2</td></tr>
					<tr><td>컨텐츠3</td></tr>
				</table>
			</div>
		</main>
		<footer>
			<div class="base_wrap">
				<p id="copyright">Copyright 2020 1team.</p>
			</div>
		</footer>
	</div>
</body>
</html>