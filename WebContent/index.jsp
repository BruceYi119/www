<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Header header = new Header();
String css = header.getCss();
String js = header.getJs();
String title = header.getTitle();
String headerUrl = header.getHeaderUrl();

Nav nav = new Nav();
String menu = nav.getMenu();

Footer footer = new Footer();
String footerUrl = footer.getFooterUrl();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="/view/img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="/view/img/favicon.ico" type="image/x-icon" />
<title><%=title%></title>
<%=css%>
<link rel="stylesheet" href="/view/css/main.css">
<%=js%>
<script defer type="text/javascript" src="/view/js/main.js"></script>
</head>
<body>
	<div id="wrap">
		<jsp:include page="<%=headerUrl%>" flush="false"/>
		<nav>
			<div class="base_wrap">
				<%=menu%>
			</div>
		</nav>
		<main>
			<div class="base_wrap">
				<div id="demo" class="carousel slide mt10 mb10" data-ride="carousel">
					<ul class="carousel-indicators">
						<li data-target="#demo" data-slide-to="0" class="active"></li>
						<li data-target="#demo" data-slide-to="1"></li>
						<li data-target="#demo" data-slide-to="2"></li>
					</ul>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="/view/img/main_banner01.jpg" alt="배너1">
						</div>
						<div class="carousel-item">
							<img src="/view/img/main_banner02.jpg" alt="배너2">
						</div>
						<div class="carousel-item">
							<img src="/view/img/main_banner03.jpg" alt="배너3">
						</div>
					</div>
					<a class="carousel-control-prev" href="#demo" data-slide="prev"><span class="carousel-control-prev-icon"></span></a>
					<a class="carousel-control-next" href="#demo" data-slide="next"><span class="carousel-control-next-icon"></span></a>
				</div>
				<div class="flexWeap">
					<div class="left">
						<div class="covidWrrap">
							<h4>Today 코로나 현황</h4>
							<div class="lodingWrap">
								<div class="spinner-border text-muted"></div>
							</div>
						</div>
					</div>
					<div class="right"></div>
				</div>
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="false"/>
	</div>
</body>
</html>