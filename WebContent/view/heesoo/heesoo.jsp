<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.header.Header"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Header header = new Header();
String css = header.getCss();
String js = header.getJs();

Nav nav = new Nav();
String menu = nav.getMenu();

request.setAttribute("importCss", css);
request.setAttribute("importJs", js);
request.setAttribute("menuHtml", menu);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Doogle</title>
${importCss}
${importJs}
<style type="text/css">

</style>
<script type="text/javascript">
$(function() {

});
</script>
</head>
<body>
	<div id="wrap">
		<header class="heesoo">
			<h2 id="logo"><a href="/">Doogle</a></h2>
		</header>
		<nav class="heesoo">
			${menuHtml}
		</nav>
		<div class="container">
			<main>
				<h2>희수 페이지</h2>
				<table class="table">
					<tr><td>컨텐츠1</td></tr>
					<tr><td>컨텐츠2</td></tr>
					<tr><td>컨텐츠3</td></tr>
				</table>
			</main>
		</div>
		<footer class="heesoo">
			<p id="copyright">Copyright 2020 1team.</p>
		</footer>
	</div>
</body>
</html>