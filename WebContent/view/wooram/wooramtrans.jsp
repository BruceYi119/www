<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
<%-- <%@ include file="/include/top.jsp" %> --%>
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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="/view/img/favicon.ico"
	type="image/x-icon" />
<link rel="icon" href="/view/img/favicon.ico" type="image/x-icon" />
<title><%=title%></title>
<%=css%>
<link rel="stylesheet" href="/view/css/wooramtrans.css">
<%=js%>
<script defer src="/view/js/wooramtrans.js"></script>
</head>
<body>
	<input type="hidden" id="color_class" value="wooram" />
	<div id="wrap">
		<jsp:include page="<%=headerUrl%>" flush="true" />
		<nav>
			<div class="base_wrap">
				<%=menu%>
			</div>
		</nav>
		<main>
		<div class="base_wrap">
			<!-- 			여기 h2부터 table까지 입력하는 곳 -->
			<h2 align="center">두글 번역기(두글두글‍🌐💓🌍)</h2>
			<div id="container" method="get">
				<div id="all">
					<div id="one">
						<div id="one1">
							<span id="f11">원본언어</span> <select id="language1"
								name="language1">
								<option value="kr">한국어</option>
								<option value="en" selected>영어</option>
								<option value="cn">중국어</option>
								<option value="jp">일본어</option>
								<option value="fr">프랑스어</option>
								<option value="de">독일어</option>
								<option value="es">스페인어</option>
							</select>
						</div>
						<div class="clearBoth"></div>
						<textarea id="inp" name="inp" placeholder="번역할 내용을 입력하세요"></textarea>

					</div>
					<div id="ct">
						<div class="clearBoth"></div>
						<input type="button" id="btn1" value="번역하기"> <input
							type="button" id="btn2" value="새로고침">
					</div>
					<div id="two">
						<div id="two1">
							<span id="f22">번역언어</span> <select id="language2"
								name="language2">
								<option value="kr" selected>한국어</option>
								<option value="en">영어</option>
								<option value="cn">중국어</option>
								<option value="jp">일본어</option>
								<option value="fr">프랑스어</option>
								<option value="de">독일어</option>
								<option value="es">스페인어</option>
							</select>
						</div>
						<div class="clearBoth"></div>
						<div id="outp"></div>
						<div class="clearBoth"></div>
					</div>
				</div>
			</div>
		</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="true" />
	</div>
</body>
</html>