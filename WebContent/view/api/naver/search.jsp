<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.header.Header"%>
<%@page import="www.api.naver.Search"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.UnsupportedEncodingException"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Header header = new Header();
String css = header.getCss();
String js = header.getJs();
String title = header.getTitle();

Nav nav = new Nav();
String menu = nav.getMenu();

request.setCharacterEncoding("utf-8");

Search nsapi = new Search();
String json = nsapi.search("둘리", "INTELLECTUALS");
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
			<h2 id="logo"><a href="/"><%=title%></a></h2>
		</header>
		<nav>
			<%=menu%>
		</nav>
		<div class="container">
			<main>
				<h2>전체 지식iN()</h2>
				<ul>
					<li>
						<dl>
							<dt></dt>
							<dd></dd>
						</dl>
					</li>
				</ul>
			</main>
		</div>
		<footer>
			<p id="copyright">Copyright 2020 1team.</p>
		</footer>
	</div>
</body>
</html>