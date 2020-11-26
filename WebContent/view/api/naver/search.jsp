<%@page import="java.util.ArrayList"%>
<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.api.naver.Search"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String searchTxt = request.getParameter("search");

Header header = new Header();
String css = header.getCss();
String js = header.getJs();
String title = header.getTitle();

Nav nav = new Nav();
String menu = nav.getMenu();

request.setCharacterEncoding("utf-8");

Search nsapi = new Search();
String json = nsapi.search(searchTxt, "INTELLECTUALS");
JSONObject jo = new JSONObject(json);
String total = jo.get("total").toString();
JSONArray jsonList = (JSONArray)jo.get("items");
Iterator it = jsonList.iterator();
ArrayList<JSONObject> list = new ArrayList();

while(it.hasNext())
	list.add((JSONObject)it.next());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title><%=title%></title>
<%=css%>
<link rel="stylesheet" href="/view/css/api_search.css">
<%=js%>
</head>
<body>
	<div id="wrap">
		<header>
			<div class="base_wrap">
				<h1 id="logo"><a href="/">Doogle</a></h1>
				<p class="search_wrap">
					<input type="text" id="search" placeholder="검색" value="<%=searchTxt%>" />
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
				<h5>전체 지식iN(<%=total%>)</h5>
				<ul class="sort">
					<li><a href="#" id="sort1">정확도</a></li>
					<li><a href="#" id="sort2">최신순</a></li>
					<li><a href="#" id="sort3">추천순</a></li>
				</ul>
				<ul class="list">
					<c:forEach items="<%=list%>" var="data">
					<li>
						<dl>
							<dt><a href="${data.get("link")}">${data.get("title")}</a></dt>
							<dd>${data.get("description")}</dd>
						</dl>
					</li>
					</c:forEach>
				</ul>
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