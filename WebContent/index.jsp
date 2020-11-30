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
				<div class="search_wrap">
					<div class="search_event_wrap">
						<input type="text" id="search" placeholder="검색" />
						<button class="btn btn-success" id="btn_search">검색</button>
						<select class="custom-select hide" id="searchType">
							<option value="NEWS" selected="selected">뉴스</option>
							<option value="BLOG">블로그</option>
							<option value="BOOK">책</option>
							<option value="ENCYC">백과사전</option>
							<option value="MOVIE">영화</option>
							<option value="CAFE">카페글</option>
							<option value="KIN">지식iN</option>
							<option value="LOCAL">지역</option>
							<option value="ERRATA">오타변환</option>
							<option value="WEBKR">웹문서</option>
							<option value="IMAGE">이미지</option>
							<option value="SHOP">쇼핑</option>
							<option value="DOC">전문자료</option>
						</select>
					</div>
				</div>
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
		<div id="darkMode">
			<button type="button">다크 모드</button>
		</div>
	</div>
</body>
</html>