<%@page import="java.security.interfaces.RSAKey"%>
<%@page import="www.db.dao.Recipe_boardDAO"%>
<%@page import="www.db.dto.Recipe_boardDTO"%>
<%@page import="www.db.dao.RcommentDAO"%>
<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
/* 게시글 */
String rbno = request.getParameter("rbno");
Recipe_boardDAO dao = new Recipe_boardDAO();
String sql = "select rownum, t.* from recipe_board t where rbno=?";
dao.select(sql,rbno);

/* 댓글 */
RcommentDAO rdao = new RcommentDAO();
String rno = request.getParameter("rbno");
sql="select rownum,t.* from rcomment t where rno=? order by rcno desc";
rdao.selectAll(sql,rno);

pageContext.setAttribute("dto",dao.getDto());
pageContext.setAttribute("list",rdao.getList());
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
<script defer src="/view/js/rcomment.js"></script>
<style>
a {
color:black;
text-decoration:none;
}
a:hover {
text-decoration:underline;
}
 .base_wrap {
border:1px solid red;
}
.contents {
text-align:center;
margin:auto;
width:1000px;
border:1px solid black;
}
#recipe {
width:1000px;
height:500px;
border:1px solid yellow;
}
#recipe td {
border:1px solid black;
}

#mainImg {
margin:auto;
width:500px;
height:500px;
border:1px solid black;
}
/* topCont */
#topCont {
border:1px solid black;
margin:10px 0 10px 0;
}

/* process */
#process {
text-align:center;
width:800px;
margin:auto;
}
#stepImg {
float:left;
width:200px;
height:200px;
border:1px solid black;
margin-left:30px;
}
#stepCon {
float:left;
width:550px;
height:200px;
border:1px solid black;
padding-top:80px;
}
#process:after {
content: "";
display:block;
clear:both;
}

/* comment */
.comment_list{
border:1px solid black;
width:600px;
}
.rcontent_box{
border:1px solid black;
margin:10px;
padding:10px;
text-align:left;
width:600px;
}
.comment_info {
color:gray;
font-size:0.8em;
}
.comment_info a {
color:gray;
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
				<h2>지원페이지</h2>
				<table class="table">
					<tr><td>컨텐츠1</td></tr>
					<tr><td>컨텐츠2</td></tr>
					<tr><td>컨텐츠3</td></tr>
				</table>
				<div class="contents">
				<h2>Content</h2>
						<div>
							<span><a href="recipe_list.jsp">목록</a></span>
							<span><a href="recipe_update.jsp?rbno=${dto.rbno}">수정</a></span>
							<span><a href="recipe_delete.jsp?rbno=${dto.rbno}">삭제</a></span>
						</div>
					<div id="mainImg">
						<img id="mainImg" src="" alt="메인이미지">
					</div>
					<div id="topCont">
						<h5> ${dto.name } </h5>
						<h3> ${dto.title } </h3>
						<div id="ingredients">
							<b>재료</b>
							<ul>
							<%
								String ingredients = dao.getDto().getIngredients();
								String[] ingre = ingredients.split(",");
								for(int i=0;i<ingre.length;i++)
								{
							%>

								<li><%=ingre[i] %></li><!-- 데이터 나눠서 넣기 -->
							<%
								}
							%>
							</ul>
						</div>
					</div>
					<div id="process">
						<%
							String contents = dao.getDto().getContent();
							String[] content = contents.split(",");
							for(int i=0;i<content.length;i++)
							{
						%>
						<div class="step[i]">
							<div id="stepImg"><img src="" alt="이미지"></div>
							<div id="stepCon"><%=content[i] %></div>
						</div>
						<%
							}
						%>
					</div>
					<div>
						<div id="liked"><a href="recipe_liked.jsp?rbno=${dto.rbno}">♥</a>
							<div>
								<span><b> 조회수 ${dto.readnum } </b></span>
								<span><b> 좋아요 ${dto.liked } </b></span>
							</div>
						</div>
						<div align="center" id="comment_box">
							<form id="commFrm" name="rcomment" method="post" action="rcomment_write_ok.jsp">
								<input type="hidden" name="rno" value="${dto.rbno }"> <!-- recipe테이블의 id -->
								<input type="hidden" name="rcno"> <!-- recomment테이블의 id -->
								<input type="text" name="name" size="5" placeholder="작성자" id="name">
								<input type="text" name="content" size="50" placeholder="댓글 내용" id="content">
								<input type="submit" onclick="submit()" value="댓글달기" id="submit">
							</form>
						</div>
						<div align="center" id="comment_list">
							<form name="commList" method="post" action="rcomment_update_ok.jsp">
							<c:forEach items="${list}" var="rdto">
								<input type="hidden" name="rno" value="${dto.rbno }"> <!-- recipe테이블의 id -->
								<input type="hidden" name="rcno"> <!-- recomment테이블의 id -->
								<div class="rcontent_box">
									<span name="rname"><b> ${rdto.name } </b></span>
									<span name="rcontent"> ${rdto.content } </span>
									<div class="comment_info">
										<span id="comment_info_date"> ${rdto.writeday } </span>
										<a href="#" onclick="comm_update()" class="commUpdate"> 수정 </a> <a href="rcomment_delete.jsp?rcno=${rdto.rcno }&rno=${rdto.rno}"> 삭제 </a>
									</div>	
								</div>
							</c:forEach>
							</form>
						</div>
						<div>
							<span><a href="recipe_list.jsp">목록</a></span>
							<span><a href="recipe_update.jsp?rbno=${dto.rbno}">수정</a></span>
							<span><a href="recipe_delete.jsp?rbno=${dto.rbno}">삭제</a></span>
						</div>
					</div>
				</div>
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="true"/>
	</div>
</body>
</html>