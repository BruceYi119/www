<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
<%@page import="www.api.naver.Search"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Search nsapi = new Search();
ArrayList<JSONObject> list = new ArrayList();

request.setCharacterEncoding("utf-8");
String pagev = request.getParameter("page") != null ? request.getParameter("page") : "1";
String searchTxt = request.getParameter("search") != null ? request.getParameter("search") : "둘리";
String searchType = request.getParameter("searchType") != null ? request.getParameter("searchType") : "NEWS";
String searchTitle = request.getParameter("searchTitle") != null ? request.getParameter("searchTitle") : "뉴스";
String display = request.getParameter("display") != null ? request.getParameter("display") : nsapi.getDisplay() + "";

Header header = new Header();
String css = header.getCss();
String js = header.getJs();
String title = header.getTitle();
String headerUrl = header.getHeaderUrl();

Nav nav = new Nav();
String menu = nav.getMenu();

Footer footer = new Footer();
String footerUrl = footer.getFooterUrl();

String json = nsapi.search(searchTxt, searchType);

JSONObject jo = new JSONObject(json);
String total = !searchType.equals("ERRATA") ? "(" + jo.get("total").toString() + ")" : "";
String errata = "";

if (searchType.equals("ERRATA")) {
	errata = jo.get("errata").toString();
} else {
	JSONArray jsonList = (JSONArray)jo.get("items");
	Iterator it = jsonList.iterator();

	while(it.hasNext())
		list.add((JSONObject)it.next());
}
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
<link rel="stylesheet" href="/view/css/naver_search.css">
<%=js%>
<script defer src="/view/js/naver_search.js"></script>
</head>
<body>
	<form>
		<input type="hidden" name="page" value="<%=pagev%>" />
		<input type="hidden" name="searchTxt" value="<%=searchTxt%>" />
		<input type="hidden" name="searchType" value="<%=searchType%>" />
		<input type="hidden" name="display" value="<%=display%>" />
	</form>
	<div id="wrap">
		<jsp:include page="<%=headerUrl%>" flush="false"/>
		<nav>
			<div class="base_wrap">
				<%=menu%>
			</div>
		</nav>
		<main>
			<div class="base_wrap">
				<h5><%=searchType.equals("ERRATA") ? "" : "전체"%> <%=searchTitle%><%=total%></h5>
				<c:set var="searchType" value="<%=searchType%>" />
				<c:choose>
				    <c:when test="${searchType eq 'IMAGE'}">
				    </c:when>
				    <c:otherwise>
						<ul class="sort">
							<li><a href="#" id="sort1">정확도</a></li>
							<li><a href="#" id="sort2">최신순</a></li>
							<li><a href="#" id="sort3">추천순</a></li>
						</ul>
				    </c:otherwise>
				</c:choose>
				<ul class="list">
					<c:choose>
					    <c:when test="${searchType eq 'BOOK'}">
							책
					    </c:when>
					    <c:when test="${searchType eq 'MOVIE'}">
					    	<c:forEach items="<%=list%>" var="data">
							<li class="movie">
								<p><a href="${data.get('link')}" target="_blank"><img src="${data.get('image')}" /></a></p>
								<dl>
									<dt><a href="${data.get('link')}" target="_blank"><strong>${data.get('title')}</strong> (${data.get('subtitle')})</a></dt>
									<dd class="point">
										<span class="star"><em class="view_star" style="width:${data.get('userRating')}"></em></span><em class="num">${data.get('userRating')}</em>
									</dd>
									<dd class="etc">${data.get('pubDate')}</dd>
									<dd class="etc">감독 : ${data.get('director')} 출연 : ${data.get('actor')}</dd>
								</dl>
							</li>
							</c:forEach>
					    </c:when>
					    <c:when test="${searchType eq 'LOCAL'}">
							지역
					    </c:when>
					    <c:when test="${searchType eq 'ERRATA'}">
							<span>입력값 : <%=searchTxt%> / 맞춤법 : <%=errata%></span>
					    </c:when>
					    <c:when test="${searchType eq 'IMAGE'}">
					    	<c:forEach items="<%=list%>" var="data">
							<li class="image">
								<a href="${data.get('link')}" link="${data.get('link')}"><img src="${data.get('thumbnail')}" /></a>
							</li>
							</c:forEach>
					    </c:when>
					    <c:when test="${searchType eq 'SHOP'}">
							쇼핑
					    </c:when>
					    <c:otherwise>
							<c:forEach items="<%=list%>" var="data">
							<li>
								<dl>
									<dt><a href="${data.get('link')}" target="_blank">${data.get("title")}</a></dt>
									<dd>${data.get("description")}</dd>
								</dl>
							</li>
							</c:forEach>
					    </c:otherwise>
					</c:choose>
				</ul>
				<div class="moreWrap"><a href="#" id="more">더보기</a></div>
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="false"/>
	</div>
</body>
</html>