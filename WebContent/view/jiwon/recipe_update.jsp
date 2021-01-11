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

String rbno = request.getParameter("rbno");
String sql = "select rownum, t.* from recipe_board t where rbno=?";
dao.select(sql,rbno);
pageContext.setAttribute("dto",dao.getDto());
pageContext.setAttribute("rcategorys", dao.rcategorys);

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
<script defer src="/view/js/recipe_write.js"></script>
<style>

</style>
<script>
 </script>
 <style>
 .base_wrap{
border:1px solid red;
}
.contents {
	margin:auto;
	width:1000px;
	border:1px solid black;
}
#recipe {
width:1000px;
height:500px;
border:1px solid yellow;
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
				<h2>지원 페이지</h2>
				<table class="table">
					<tr><td>컨텐츠1</td></tr>
					<tr><td>컨텐츠2</td></tr>
					<tr><td>컨텐츠3</td></tr>
				</table>
			<div class="contents">
				<h2>RecipeUpdate</h2>
				<form method="post" action="recipe_update_ok.jsp" enctype="multipart/form-data">
				<input type="hidden" name="rbno" value="${dto.rbno }">
				<!-- <form method="post" action="recipe_write_ok.jsp"> -->
					<table id="recipe" align="center">
						<tr>
							<td> 제목 </td>
							<td><input type="text" name="title" size="60" value="${dto.title }"></td>
						</tr>
						<tr>
							<td> 카테고리 </td>
							<td>
								<select name="rcategory">
									<option>--선택--</option>
								<c:forEach items="${rcategorys}" var="rcategory">
									<c:if test="${dto.rcategory }.equals(${rcategory})">
									<option value="${rcategory}" selected> ${rcategory} </option>
									</c:if>
									<c:if test="!${dto.rcategory }.equals(${rcategory})">
									<option value="${rcategory}"> ${rcategory} </option>
									</c:if>
								</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td> 완성사진 </td>
							<td><input type="file" name="img" class="img"></td>
						</tr>
						<tr>
							<td> 메뉴 </td>
							<td><input type="text" name="rname" size="60" value="${dto.rname }"></td>
						</tr>
						
						<tr>
							<td> 재료 </td>
							<td id="ingredients">
							<%
								String ingredients = dao.getDto().getIngredients();
								String[] ingre = ingredients.split(",");
								for(int i=0;i<ingre.length;i++)
								{
							%>
								<input type="text" name="ingredients" class="ingredients" placeholder="예) 돼지고기 300g" value="<%=ingre[i] %>"/> <input type="button" class="delIngre" value="X" />
							<%
								}
							%>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="button" onclick="addIngre()" value="재료추가" /></td>
						</tr>
						<tr>
							<td>순서</td>
							<%
								String contents = dao.getDto().getContent();
								String[] content = contents.split(",");
								for(int i=0;i<content.length;i++)
								{
							%>
							<td id="content">
								<textarea cols="50" rows="4" name="content"  class="content"><%=content[i] %></textarea>
								<input type="file" name="img" class="img"><input type="button" class="delContent" value="X" />
							</td>
							<%
								}
							%>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="button" onclick="addContent()" value="순서추가"></td>
						</tr>
						<tr>
							<td align="center"><input type="submit" value="레시피 수정"></td>
						</tr>
					</table>
				</form>
			</div>
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="true"/>
	</div>
</body>
</html>