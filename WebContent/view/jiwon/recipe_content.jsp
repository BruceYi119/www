<%@page import="www.member.Member"%>
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
Member m = new Member();

boolean login = m.isLogin(session);
if (!login)
	response.sendRedirect("/view/member/login.jsp");

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
sql="select rownum,t.* from rcomment t where rbno=? order by rcno desc";
rdao.selectAll(sql,rbno);

pageContext.setAttribute("dto",dao.getDto());
pageContext.setAttribute("list",rdao.getList());
pageContext.setAttribute("loginname",session.getAttribute("name"));
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
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link rel="stylesheet" href="/view/css/recipe_content.css">
<%=js%>
<script defer src="/view/js/rcomment.js"></script>
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
				<div id="recipe_menu">
					<span><a href="recipe_list.jsp"> 목 록 </a></span>
					<span><a href="recipe_update.jsp?rbno=${dto.rbno}">수정</a></span>
					<span><a href="recipe_delete.jsp?rbno=${dto.rbno}">삭제</a></span>
				</div>
				<div class="contents">
					<div id="topCont">
						<div id="cate"> 카테고리 : ${dto.rcategory } </div>
						<div id="writer"> 작성자 : ${dto.name } </div>
					</div>
					<hr>
					<div id="container">
						<div id="title_box">
							<h1> ${dto.title } </h1>
							<h3> ${dto.intro } </h3>
						</div>
						<hr>
						<div id="sub_container">
							<div id="img_box">
								<div class="swiper-container">
									<div class="swiper-wrapper">
									<c:set var="img" value="${fn:split(dto.img,',') }"/>
									<c:forEach var="i" begin="0" end="${fn:length(img)-1 }" step="1">
										<div class="swiper-slide"><img src="/upload/img/${img[i]}" width="550px" height="550px" alt="이미지"></div>
									</c:forEach>
										<!-- Add Arrows -->
										<div class="swiper-button-next"></div>
										<div class="swiper-button-prev"></div>
									</div>
									<!-- Add Pagination -->
									<div class="swiper-pagination"></div>
									<!-- Add Arrows -->
									<div class="swiper-button-next"></div>
									<div class="swiper-button-prev"></div>
								</div>
							</div>
							<!-- Swiper JS -->
							<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
							<!-- Initialize Swiper -->
							<script>
								var swiper = new Swiper('.swiper-container', {
								pagination: {
									el: '.swiper-pagination',
							        type: 'fraction',
								},
							 	navigation: {
							    	nextEl: '.swiper-button-next',
							    	prevEl: '.swiper-button-prev',
							    	},
							    });
							</script>
							<div id="ingredients">
								<div class="cont_tit">재료</div>
								<div class="ingre_box">
									<ul>
									<c:set var="ingredients" value="${fn:split(dto.ingredients,',') }"/>
									<c:forEach var="i" begin="0" end="${fn:length(ingredients)-1 }" step="1">
										<li id="ingre_el">${ingredients[i] }</li><!-- 데이터 나눠서 넣기 -->
									</c:forEach>
									</ul>
								</div>
							</div>
						</div>
						<hr>
						<div id="process">
							<ul>
							<c:set var="contents" value="${fn:split(dto.content,',') }"/>
							<c:forEach var="i" begin="0" end="${fn:length(contents)-1 }" step="1">
								<li id="cont_el">${contents[i] }</li>
							</c:forEach>
							</ul>
						</div>
					</div>
					<div>
						<div>
							<div id="liked">
								<a class="liked" href="recipe_liked.jsp?rbno=${dto.rbno}">♥</a>
								<span><b> 조회수 ${dto.readnum } </b></span>
								<span><b> 좋아요 ${dto.liked } </b></span>
							</div>
						</div>
						<!-- 댓글작성폼 -->
						<div align="center" id="comment_box">
							<form id="commFrm" name="rcomment" method="post" action="rcomment_write_ok.jsp">
								<input type="hidden" name="name" value="${loginname}">
								<input type="hidden" name="rbno" value="${dto.rbno }"> <!-- recipe테이블의 id -->
								<input type="hidden" name="rcno"> <!-- recomment테이블의 id -->
								<input type="text" name="content" size="80" placeholder="댓글 내용" id="content">
								<input type="submit" onclick="submit()" value="댓글달기" id="submit">
							</form>
						</div>
						<!-- 댓글리스트 -->
						<div align="center" id="comment_list">
						<c:forEach items="${list}" var="rdto">
							<form id="updateFrm" method="post" action="rcomment_update.jsp">
							<div class="rcontent_box">
								<span class="rname"><b> ${rdto.name} </b></span>
								<span class="rcontent"> ${rdto.content } </span>
								<div class="comment_info">
									<span id="comment_info_date"> ${rdto.writeday } </span>
									<a href="#" class="commUpdate"> 수정 </a> <a href="rcomment_delete.jsp?rcno=${rdto.rcno }&rbno=${rdto.rbno}&name=${loginname }"> 삭제 </a>
								</div>	
							</div>
							<!-- 댓글 수정폼 -->
								<input type="hidden" name="rbno" value="${dto.rbno }"> <!-- recipe테이블의 id -->
								<input type="hidden" name="rcno" value="${rdto.rcno }"> <!-- recomment테이블의 id -->
								<input type="hidden" name="name" value="${loginname }"> 
								<div class="update_box" style="display:none">
									<span class="rname"><b> ${rdto.name} </b></span>
									<span class="rcontent"><input type="text" name="content" value="${rdto.content }" size="60"> </span>
									<div class="comment_info">
										<span id="comment_info_date"> ${rdto.writeday } </span>
										<input type="submit" value="수정"> <a href="#" onclick="rollback()" class="rollback"> 취소 </a>
									</div>	
								</div>
							</form>
						</c:forEach>
						</div>
					</div>
				</div>
				<div id="recipe_menu">
					<span><a href="recipe_list.jsp"> 목 록 </a></span>
					<span><a href="recipe_update.jsp?rbno=${dto.rbno}">수정</a></span>
					<span><a href="recipe_delete.jsp?rbno=${dto.rbno}">삭제</a></span>
				</div>
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="true"/>
	</div>
</body>
</html>