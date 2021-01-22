<%@page import="www.member.Member"%>
<%@page import="java.util.Arrays"%>
<%@page import="www.db.dao.Recipe_boardDAO"%>
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

Recipe_boardDAO dao = new Recipe_boardDAO();

String rbno = request.getParameter("rbno");
String sql = "select rownum, t.* from recipe_board t where rbno=?";
dao.select(sql,rbno);
pageContext.setAttribute("dto",dao.getDto());
pageContext.setAttribute("rcategorys", dao.rcategorys);

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
<%=js%>
<script defer src="/view/js/recipe_write.js"></script>
<link rel="stylesheet" href="/view/css/recipe_update.css">
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
				<h2>RecipeUpdate</h2>
				<hr>
				<form method="post" action="recipe_update_ok.jsp" enctype="multipart/form-data">
				<!-- <form method="post" action="recipe_write_ok.jsp"> -->
				<input type="hidden" name="rbno" value="${dto.rbno }"> 
				<input type="hidden" name="name" value="<%=session.getAttribute("name").toString() %>">
					<div id="recipe_write">
						<div class="cont_wrap">
							<p class="cont_tit"> 카테고리 </p>
							<div class="sub">
								<select name="rcategory">
									<option> - - 카테고리를 선택해주세요 - - </option>
									<c:forEach var="category" items="${rcategorys}">
										<option value="${dto.rcategory}"> ${category} </option>
										<c:if test="${dto.rcategory eq category}">
											<option value="${category}" selected="selected"> ${category} </option>
										</c:if>
										<c:if test="${dto.rcategory ne category}">
											<option value="${category}"> ${category} </option>
										</c:if>
									</c:forEach>
								</select>
								<span id="cateMsg">카테고리를 선택하세요</span>
							</div>
						</div>
						<div class="cont_wrap">
							<p class="cont_tit"> 제 목 </p>
							<input type="text" name="title" size="90" value="${dto.title }" placeholder="당신의 레시피에 제목을 입력해주세요.">
							<div id="titMsg">제목을 입력해주세요.</div>
						</div>
						<div class="cont_wrap">
							<p class="cont_tit"> 작성자 </p>
							<div id="nameBox">${dto.name }</div>
						</div>
						<div class="intro_wrap">
							<p class="cont_tit"> 음식소개 </p>
							<textarea cols="90" rows="5" name="intro" placeholder="음식을 간단히 소개해주세요">${dto.intro }</textarea>
							<div id="introMsg">음식 소개를 작성해주세요.</div>
						</div>
						<div id="mainImg">
							<div id="mainImg_tit"><p class="cont_tit"> 메인이미지 </p></div>
							<div id="mainImg_cont">
								<div class="imgUpload">
									<c:set var="img" value="${fn:split(dto.img,',') }"/>
									<img class="img" src="/upload/img/${dto.mainimg}" width="300" height="300" alt="">
									<div class="imgBtn">							
										<input type="file" class="addImg" name="mainImg" value="${img[0]}" onchange="readImg(this)" multiple/>
									</div>
								</div>
							</div>
						</div>
						<hr>
						<div class="ingre">
							<div id="ingre_main">
								<div class="ingre_tit">
									<p class="cont_tit"> 재 료 </p>
									<div id="ingreBtn"><input type="button" class="btn" onclick="addMainIngre()" value="재료추가" /></div>
								</div>
								<div class="ingre_container">
									<p>※ 재료는 재료명과 재료의 양에 간격을 두어 입력해주세요 ※ </p>
								<c:set var="ingredients" value="${fn:split(dto.ingredients,',') }"/>
								<c:forEach var="i" begin="0" end="${fn:length(ingredients)-1 }">
									<span class="el"><input type="text" name="ingredients" class="ingredients" value="${ingredients[i] }" placeholder="예) 돼지고기 400g" /> <input type="button" class="delIngre" value="X" /> </span>
								</c:forEach>
								</div>
								<div id="ingreMsg">빈칸을 모두 채워주세요</div>
							</div>
						</div>
						<div id="step_wrap">
							<div class="step_tit">
								<p class="cont_tit"> 요리 순서 </p>
								<div id="stepBtn"><input type="button" class="btn" onclick="addContent()" value="순서추가"></div>
							</div>
							<div class="cont_container">
								<c:set var="contents" value="${fn:split(dto.content,',') }"/>
								<c:forEach var="i" begin="0" end="${fn:length(contents)-1 }">
								<div class="contInner">
									<div class="imgUpload">
										<img class="img" src="/upload/img/${img[i]}" width="200" height="200" alt="">
										<div class="imgBtn">							
											<input type="file" class="addImg" name=imgStep[]" onchange="readImg(this)" multiple/>
										</div>
									</div>
									<div class="contText">
										<textarea cols="50" rows="7" name="content"  class="content" placeholder="레시피를 순서대로 작성해주세요.">${contents[i] }</textarea>
									</div>
									<div class="BtnBox"><input type="button" class="delContent" value="X" /></div>
								</div>
								</c:forEach>
							</div>
							<div id="stepMsg">빈칸을 모두 채워주세요</div>
						</div>
						<div id="last">
							<div id="submit"><input id="submitBtn" type="submit" value="레시피 수정"></div>
							<div id="cancel"><a id=""href="recipe_list.jsp?rbno=">취소</a></div>
						</div>
					</div>
				</form>
			</div>
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="true"/>
	</div>
</body>
</html>