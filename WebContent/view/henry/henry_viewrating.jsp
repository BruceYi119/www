<%@page import="www.member.Member"%>
<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
<%@page import="www.db.dao.MoviesDAO" %>
<%@page import="www.db.dto.MoviesDTO" %>
<%@page import="www.db.dao.MymovielistDAO" %>
<%@page import="www.db.dto.MymovielistDTO" %>
<%@page import="www.pagination.Pagination"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Member m = new Member();

//로그인 확인 후 로그인안했을시 로그인 페이지로 이동
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

//페이징 처리
request.setCharacterEncoding("utf-8");
int cpage = request.getParameter("cpage") != null ? Integer.parseInt(request.getParameter("cpage")) : 1;
int range = request.getParameter("range") != null ? Integer.parseInt(request.getParameter("range")) : 1;

Pagination p = new Pagination();
MoviesDAO mdao = new MoviesDAO();
MoviesDTO mdto = new MoviesDTO();
StringBuilder sb = new StringBuilder();

// 페이징 range설정
// p.setRangeSize(5);

// 총 게시글 수 쿼리
sb.append("select count(*) total from movies");

// 총 게시글 수 가져오기
int listCnt = mdao.count(sb.toString());

// 페이징 정보 생성
p.setInfo(cpage, range, listCnt);

// 페이징 정보 json string으로 저장
String pageInfo = p.getInfo();

// sb초기화
sb.setLength(0);

// list조회 쿼리
sb.append("select ");
sb.append(mdto.toString(true));
sb.append(" from (select seq, tt.* from (select rownum seq, t.* from (select * from movies order by viewrating desc) t) tt where seq >= ?) where rownum <= ?");

// list조회
mdao.selectAll(sb.toString(), Integer.toString(p.getStartList()), Integer.toString(p.getListSize()));

//pageContext LIST 저장
pageContext.setAttribute("list", mdao.getList());

//***** SESSION ID & NAME 저장
String id = session.getAttribute("id") != null ? session.getAttribute("id").toString() : "";
String name = session.getAttribute("name") != null ? session.getAttribute("name").toString() : "";

// 찜목록
MymovielistDAO mydao = new MymovielistDAO();
String sql = "select rownum, t.* from mymovielist t where id = ?";
mydao.selectAll(sql, id);
ArrayList<String> mylist = new ArrayList();

for (MymovielistDTO mydto : mydao.getList())
	mylist.add(mydto.getTitle());

pageContext.setAttribute("mylist", mylist);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="/view/img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="/view/img/favicon.ico" type="image/x-icon" />
<title><%=title%></title>
<link rel="stylesheet" type="text/css" href="../../view/css/henry.css">
<%=css%>
<%=js%>
<script defer type="text/javascript" src="/view/js/pagination.js"></script>
</head>
<body>
	<input type="hidden" id="color_class" value="henry" />
	<div id="wrap">
		<input type="hidden" name="url" value="/view/henry/henry_viewrating.jsp" />
		<input type="hidden" name="page" value='<%=cpage%>' />
		<input type="hidden" name="listCnt" value='<%=listCnt%>' />
		<input type="hidden" name="info" value='<%=pageInfo%>' />
		<jsp:include page="<%=headerUrl%>" flush="true"/>
		<nav>
			<div class="base_wrap">
				<%=menu%>
			</div>
		</nav>
		<main>
		
			<div class="base_wrap">
				<div class="mainWrap">
					<div class="sidebar">
						<div class="sideMyStory"><a href="mypage.jsp">스토리<br/>Board</a></div>
						<div class="sideMovie"><a class="current" href="henry.jsp">영화<br/>List</a></div>
					</div>
					<div class="main">
						<h2>현재 상영영화 (관람평순)</h2>
						<ul class="listHeader">
							<li class="listHeaderTitle"><a href="henry.jsp">상영영화</a></li>
							<li class="listHeaderTitle"><a href="henry_name.jsp">이름순</a></li>
							<li class="listHeaderTitle"><a class="current" href="henry_viewrating.jsp">관람평순</a></li>
							<li class="listHeaderTitle"><a href="henry_salesrating.jsp">예매율순</a></li>
							<li class="listHeaderTitle"><a href="henry_releasedate.jsp">개봉일순</a></li>
						</ul>
						<c:forEach var="mdto" items="${list}">
						
						<ul class="movieList">
							<li>
								<img src="/view/img/movie/${mdto.imgtitle }.jpg" class="movieImage">
								<dl class="credit_summary">
									<dt class="movieTitle">${mdto.title}</dt>
									<div class="creditWrap">
										<div class="credit">
											<div>
												<div class="creditHeading">관람평점</div>
												<div class="creditData">${mdto.viewrating}</div>
											</div>
										</div>
										<div class="credit">
											<div>
												<div class="creditHeading">예매율</div>
												<div class="creditData">${mdto.salesrating}%</div>
											</div>
										</div>
									</div>
									<div class="creditWrap">
										<div class="credit">
											<div>
												<div class="creditHeading">장르</div>
												<div class="creditData">${mdto.genre}</div>
											</div>
										</div>
										<div class="credit">
											<div>
												<div class="creditHeading">상영시간</div>
												<div class="creditData">${mdto.runtime}</div>
											</div>
										</div>
									</div>
									<div class="creditWrap">
										<div class="credit">
											<div>
												<div class="creditHeading">개봉일</div>
												<div class="creditData">${mdto.releasedate}</div>
											</div>
										</div>
										<div class="credit">
											<div>
												<div class="creditHeading">감독</div>
												<div class="creditData">${mdto.filmdirector}</div>
											</div>
										</div>
									</div>
								</dl>
							</li>
							<c:if test="${!mylist.contains(mdto.title)}">
							<div class="addtoMylistBtn">
								<a href="henry_ok.jsp?mno=${mdto.mno}&id=<%=id%>">스토리보드에<br/>추가</a>
							</div>
							</c:if>
							<c:if test="${mylist.contains(mdto.title)}">
							<div class="addtoMylistBtn">
								<a href="mypage.jsp">스토리<br>Board</a>
							</div>
							</c:if>
						</ul>
						</c:forEach>
						<tfoot>
							<tr>
								<td colspan="11">
									<ul class="pagination justify-content-center" id="pageWrap">
										
									</ul>
								</td>
							</tr>
						</tfoot>
					</div>
				</div>
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="true"/>
	</div>
</body>
</html>

