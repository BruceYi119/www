<%@page import="www.db.dao.Recipe_boardDAO"%>
<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%=js%>
</head>
<body>
	<input type="hidden" id="color_class" value="jiwon" />
	<div id="wrap">
		<jsp:include page="<%=headerUrl%>" flush="true"/>
		<nav>
			<div class="base_wrap">
				<%=menu%>
			</div>
		</nav>
		<main>
			<div class="base_wrap">
				<h2>지원페이지</h2>
				<table class="table">
					<tr><td>컨텐츠1</td></tr>
					<tr><td>컨텐츠2</td></tr>
					<tr><td>컨텐츠3</td></tr>
				</table>
				<div class="contents">
				<h2>list</h2>
				<table width="600" align="center">
					<tr>
						<td colspan="6" align="right"> <a href="recipe_write.jsp"> 레시피 올리기 </a> </td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td>메뉴명</td>
						<td>이미지</td>
						<td>제목</td>
						<td>이름</td>
						<td>조회수</td>
						<td>좋아요수</td>
					</tr>
					<c:forEach items="${list }" var="dto">
					<tr>
						<td>카테고리</td>
						<td>${dto.rcategory }</td>
					</tr>
					<tr>
						<td>메뉴명</td>
						<td>${dto.rname }</td>
					
						<td></td>				<!-- 넣어야함 -->
						<td><a href="content.jsp?id=${dto.id }">${bdto.title }</a></td>
						<td>${dto.readnum }</td>
						<td>${dto.liked }</td>
					</tr>
					</c:forEach>
				</table>
			</div>
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="true"/>
	</div>
</body>
</html>