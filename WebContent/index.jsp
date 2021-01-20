<%@page import="www.db.dto.ReservationDTO"%>
<%@page import="www.db.dao.ReservationDAO"%>
<%@page import="www.db.dto.Main_customDTO"%>
<%@page import="www.db.dao.Main_customDAO"%>
<%@page import="www.db.dto.CafeDTO"%>
<%@page import="www.db.dao.CafeDAO"%>
<%@page import="www.db.dto.Recipe_boardDTO"%>
<%@page import="www.db.dao.Recipe_boardDAO"%>
<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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

StringBuilder sb = new StringBuilder();

// 영화정보
// sb.append("select rownum, t.* from cafe t order by writeday desc");

// 레시피
// Recipe_boardDAO recipeDao = new Recipe_boardDAO();
// Recipe_boardDTO recipeDto = new Recipe_boardDTO();
// sb.setLength(0);
// sb.append("select ");
// sb.append(recipeDto.toString(true));
// sb.append(" from (select rownum seq, t.* from (select * from recipe_board order by writeday desc) t) tt where seq >= 1) where rownum <= 3");
// recipeDao.selectAll(sb.toString());
// pageContext.setAttribute("recipeList", recipeDao.getList());

// 애완동물카패
// CafeDAO cafeDao = new CafeDAO();
// CafeDTO cafeDto = new CafeDTO();
// sb.setLength(0);
// sb.append("select ");
// sb.append(cafeDto.toString(true));
// sb.append(" from (select seq, tt.* from (select rownum seq, t.* from (select * from cafe order by writeday desc) t) tt where seq >= 1) where rownum <= 3");
// cafeDao.selectAll(sb.toString());
// pageContext.setAttribute("cafeList", cafeDao.getList());

// 뚝딱조립PC
// Main_customDAO mainCustomDao = new Main_customDAO();
// Main_customDTO mainCustomDto = new Main_customDTO();
// sb.setLength(0);
// sb.append("select ");
// sb.append(mainCustomDto.toString(true));
// sb.append(" from (select rownum seq, t.* from (select * from main_custom order by mcno desc) t) tt where seq >= 1) where rownum <= 3");
// mainCustomDao.selectAll(sb.toString());
// pageContext.setAttribute("pcList", mainCustomDao.getList());

// 갈비대첩 예약현황
// ReservationDAO reservationDao = new ReservationDAO();
// ReservationDTO reservatopmDto = new ReservationDTO();
// sb.setLength(0);
// sb.append("select ");
// sb.append(reservatopmDto.toString(true));
// sb.append(" from (select rownum seq, t.* from (select * from reservation order by rwritedate desc) t) tt where seq >= 1) where rownum <= 3");
// reservationDao.selectAll(sb.toString());
// pageContext.setAttribute("reservationList", reservationDao.getList());
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
<link rel="stylesheet" href="/view/css/main.css">
<%=js%>
<script defer type="text/javascript" src="/view/js/main.js"></script>
</head>
<body>
	<div id="wrap">
		<jsp:include page="<%=headerUrl%>" flush="false"/>
		<nav>
			<div class="base_wrap">
				<%=menu%>
			</div>
		</nav>
		<main>
			<div class="base_wrap">
				<div id="demo" class="carousel slide mt10 mb10" data-ride="carousel">
					<ul class="carousel-indicators">
						<li data-target="#demo" data-slide-to="0" class="active"></li>
						<li data-target="#demo" data-slide-to="1"></li>
						<li data-target="#demo" data-slide-to="2"></li>
					</ul>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="/view/img/main_banner01.jpg" alt="배너1">
						</div>
						<div class="carousel-item">
							<img src="/view/img/main_banner02.jpg" alt="배너2">
						</div>
						<div class="carousel-item">
							<img src="/view/img/main_banner03.jpg" alt="배너3">
						</div>
					</div>
					<a class="carousel-control-prev" href="#demo" data-slide="prev"><span class="carousel-control-prev-icon"></span></a>
					<a class="carousel-control-next" href="#demo" data-slide="next"><span class="carousel-control-next-icon"></span></a>
				</div>
				<div class="flexWeap">
					<div class="left">
						<div class="covidWrrap">
							<h4>Today 코로나 현황</h4>
							<div id="covidLoding">
								<div class="spinner-border text-muted"></div>
							</div>
						</div>
					</div>
					<div class="right">
						<div class="weatherWrap">
							<h4>현재 날씨(서울특별시)</h4>
							<div id="weatherLoding">
								<div class="spinner-border text-muted"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="flexWeap">
					<div class="left">
						<div class="stock p10">
							<table class="table">
								<thead class="thead-dark">
									<tr><th>금융(투자정보)</th></tr>
								</thead>
								<tbody>
									<tr>
										<td><a href="../minkyu/minkyu.jsp">주요 증시(지수/금/비트코인/환율/삼성전자/애플/테슬라/현대)살펴보기</a></td>
									</tr>
									<tr>
										<td><a href="../minkyu/finance_state.jsp">상장기업 실적 및 전체내역 확인하기</a></td>
									</tr>
									<tr>
										<td><a href="../minkyu/ratio_divide.jsp">국내 주요 기업 배당금 조회</a></td>
									</tr>
								</tbody>
							</table>							
						</div>
					</div>
					<div class="right">
						<div class="movie p10">
							<table class="table table-danger">
								<thead class="thead-dark">
									<tr><th>영화정보</th></tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
									</tr>
									<tr>
										<td>2</td>
									</tr>
									<tr>
										<td>3</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="flexWeap">
					<div class="left">
						<div class="recipe p10">
							<table class="table table-info">
								<thead class="thead-dark">
									<tr><th>레시피</th></tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
									</tr>
									<tr>
										<td>2</td>
									</tr>
									<tr>
										<td>3</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="right">
						<div class="cafe p10">
							<table class="table table-warning">
								<thead class="thead-dark">
									<tr><th>애완동물카페</th></tr>
								</thead>
								<tbody>
<%-- 									<c:forEach items="${cafeList}" var="dto"> --%>
<!-- 									<tr> -->
<%-- 										<td>${dto.content}</td> --%>
<!-- 									</tr>									 -->
<%-- 									</c:forEach> --%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="flexWeap">
					<div class="left">
						<div class="pc p10">
							<table class="table table-primary">
								<thead class="thead-dark">
									<tr><th>뚝딱조립PC</th></tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
									</tr>
									<tr>
										<td>2</td>
									</tr>
									<tr>
										<td>3</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="right">
						<div class="ribs p10">
							<table class="table table-dark">
								<thead class="thead-dark">
									<tr><th>갈비대첩 예약현황</th></tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
									</tr>
									<tr>
										<td>2</td>
									</tr>
									<tr>
										<td>3</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="false"/>
	</div>
</body>
</html>