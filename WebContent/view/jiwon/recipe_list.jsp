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

Recipe_boardDAO dao = new Recipe_boardDAO();
String sql = "select rownum, t.* from recipe_board t order by writeday desc";
dao.selectAll(sql);
pageContext.setAttribute("list", dao.getList());

int index;
int pager;
if(request.getParameter("pager")==null)
	   pager=1;
else
	   pager=Integer.parseInt(request.getParameter("pager"));

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
<style>
th {
text-align:center;
}
.contents {
	margin:auto;
	width:1000px;
	border:1px solid black;
}
.base_wrap{
border:1px solid red;
}

</style>
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
				<div class="contents">
					<h2>RecipeList</h2>
					<table width="1000" align="center" border="1">
						<tr>
							<td colspan="7" align="right"> <a href="recipe_write.jsp"> 레시피 올리기 </a> </td>
						</tr>
						<tr>
							<th>카테고리</th>
							<th>메뉴</th>
							<th>이미지</th>
							<th>제목</th>
							<th>이름</th>
							<th>조회</th>
							<th>좋아요</th>
						</tr>
						<c:forEach items="${list}" var="dto">
						<tr>
							<td>${dto.rcategory}</td>
							<td>${dto.rname}</td>
							<td></td>				<!-- 넣어야함 -->
							<td><a href="readnum.jsp?rbno=${dto.rbno}">${dto.title}</a></td>
							<td>${dto.name}</td>
							<td>${dto.readnum}</td>
							<td>${dto.liked}</td>
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