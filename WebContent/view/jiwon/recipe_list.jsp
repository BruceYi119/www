<%@page import="www.member.Member"%>
<%@page import="www.pagination.Pagination"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %><!-- 파일업로드와 관련된클래스 -->
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %><!-- 파일이름이 동일한것이 있을떄 파일이름을 자동으로 변경해줌 -->
<%@page import="java.io.File" %>
<%@page import="java.util.Enumeration"%>
<%@page import="www.db.dao.Recipe_boardDAO"%>
<%@page import="www.db.dto.Recipe_boardDTO"%>
<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Member m = new Member();

boolean login = m.isLogin(session);
if (!login)
	response.sendRedirect("/view/member/login.jsp");

request.setCharacterEncoding("utf-8");
int cpage = request.getParameter("cpage") != null ? Integer.parseInt(request.getParameter("cpage")) : 1;
int range = request.getParameter("range") != null ? Integer.parseInt(request.getParameter("range")) : 1;

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
Recipe_boardDTO dto = new Recipe_boardDTO();
Pagination p = new Pagination();
StringBuilder sb = new StringBuilder();

// 페이징 range설정
p.setRangeSize(3);
p.setListSize(3);

// 총 게시글 수 쿼리
sb.append("select count(*) total from recipe_board");

// 총 게시글 수 가져오기
int listCnt = dao.count(sb.toString());

// 페이징 정보 생성
p.setInfo(cpage, range, listCnt);

// 페이징 정보 json string으로 저장
String pageInfo = p.getInfo();

// sb초기화
sb.setLength(0);

// list조회 쿼리
sb.append("select ");
sb.append(dto.toString(true));
sb.append(" from (select seq, tt.* from (select rownum seq, t.* from (select * from recipe_board order by writeday desc) t) tt where seq >= ?) where rownum <= ?");

// list조회
dao.selectAll(sb.toString(), Integer.toString(p.getStartList()), Integer.toString(p.getListSize()));

pageContext.setAttribute("list", dao.getList());

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
<script defer src="/view/js/pagination.js"></script>
<style>
a {
	color: black;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
	color: #f1b950;
}
#etc{
text-align:center;
font-weight:900;
float:right;
width:150px;
line-height:40px;
height:40px;
border:1px solid #f5cf87;
box-shadow: 1px 3px 3px 0px #D3D3D3;
border-radius:5px;
}
th {
text-align:center;
text-weight:900;
height:50px;
}
td{
border-top:1px solid #145724;
}
.contents {
margin:auto;
margin-top:100px;
margin-bottom:100px;
width:1100px;
border:1px solid #f1b950;
border-radius:10px;
padding:50px;

}
#list{
margin:auto;
}
</style>
</head>
<body>
	<input type="hidden" id="color_class" value="jiwon" />
	<input type="hidden" name="url" value="/view/jiwon/recipe_list.jsp" />
	<input type="hidden" name="page" value='<%=cpage%>' />
	<input type="hidden" name="listCnt" value='<%=listCnt%>' />
	<input type="hidden" name="info" value='<%=pageInfo%>' />
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
					<div id="etc"><a href="recipe_write.jsp">레시피 올리기</a></div>
					<table id="list" width="1000" align="center">
					<colgroup>
						<col width="10%"/>
						<col width="20%"/>
						<col width="40%"/>
						<col width="10%"/>
						<col width="5%"/>
						<col width="5%"/>
					</colgroup>
						<tr>
							<th>카테고리</th>
							<th>이미지</th>
							<th>제목</th>
							<th>이름</th>
							<th>조회수</th>
							<th>좋아요</th>
						</tr>
						<c:forEach var="dto" items="${list }">
						<tr>
							<td align="center">${dto.rcategory }</td>
							<td><img src="/upload/img/${dto.mainimg }" width="250" height="250"/></td>
							<td><a href="readnum.jsp?rbno=${dto.rbno }">${dto.title }</a></td>
							<td>${dto.name }</td>
							<td align="center">${dto.readnum }</td>
							<td align="center">${dto.liked }</td>
						</tr>
						</c:forEach>

						<tr>
							<td colspan="7">
								<ul class="pagination justify-content-center" id="pageWrap">
									<!-- 페이징 영역 -->
								</ul>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="true"/>
	</div>
</body>
</html>