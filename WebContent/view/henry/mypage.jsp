<%@page import="www.member.Member"%>
<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
<%@page import="www.db.dao.MymovielistDAO" %>
<%@page import="www.db.dto.MymovielistDTO" %>
<%@page import="www.db.dao.MystoryDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@page import="www.pagination.Pagination"%>
<%@page import="java.net.URLEncoder" %> 
<%-- <%@ include file="/include/top.jsp" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Member m = new Member();

//로그인 확인 후 로그인안했을시 로그인 페이지로 이동
boolean login = m.isLogin(session);
if (!login)
	response.sendRedirect("/view/member/login.jsp");


request.setCharacterEncoding("utf-8");
int cpage = request.getParameter("cpage") != null ? Integer.parseInt(request.getParameter("cpage")) : 1;
int range = request.getParameter("range") != null ? Integer.parseInt(request.getParameter("range")) : 1;

Header h = new Header();
String css = h.getCss("admin");
String js = h.getJs("admin");

Pagination p = new Pagination();
MymovielistDAO mydao = new MymovielistDAO();
MymovielistDTO mydto = new MymovielistDTO();
StringBuilder sb = new StringBuilder();

//***** SESSION ID & NAME 저장
String id = session.getAttribute("id").toString();
String name = session.getAttribute("name").toString();

//String sql = "select rownum, t.* from mymovielist t";
//mydao.selectAll(sql);
//pageContext.setAttribute("list", mydao.getList());

sb.append("select count(*) total from mymovielist");
int listCnt = mydao.count(sb.toString());
p.setInfo(cpage, range, listCnt);
String pageInfo = p.getInfo();
sb.setLength(0);
sb.append("select ");
sb.append(mydto.toString(true));
sb.append(" from (select seq, tt.* from (select rownum seq, t.* from (select * from mymovielist where id='"+id+"' order by writedate desc) t) tt where seq >= ?) where rownum <= ?");
mydao.selectAll(sb.toString(), Integer.toString(p.getStartList()), Integer.toString(p.getListSize()));

//***** LIST
pageContext.setAttribute("list", mydao.getList());

Header header = new Header();
css = header.getCss();
js = header.getJs();
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
<link rel="stylesheet" type="text/css" href="../../view/css/henry.css">
<%=css%>
<%=js%>
<script defer type="text/javascript" src="/view/js/pagination.js"></script>
<script defer type="text/javascript" src="/view/js/henry.js"></script>
</head>
<body onclick="boundary()">
	<input type="hidden" id="color_class" value="henry" />
	<div id="wrap">
	<input type="hidden" name="url" value="/view/henry/mypage.jsp" />
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
						<div class="sideMyStory"><a class="current" href="mypage.jsp">스토리<br/>Board</a></div>
						<div class="sideMovie"><a href="henry.jsp">영화<br/>List</a></div>
					</div>
					<div class="main">
						<c:set var="k" value="0"/>
						<c:forEach var="mdto" items="${list}">
						<c:set var="movietitle" value="${mdto.title }"/>
						<h5 class="mToStoryRegDate">찜 목록 등록일 : ${mdto.writedate}</h5>
						<ul class="movieList CmovieList">
							<li class="cLi">
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
							<%
								String movietitle=pageContext.getAttribute("movietitle").toString();
							%>
							<div class="deleteMovieBtn">
								<a onclick="return mymoviedel()" href="deletemymovie.jsp?title=<%=URLEncoder.encode(movietitle)%>&id=<%=id%>">삭제</a>
							</div>
						</ul>
						<%
								MystoryDAO sdao = new MystoryDAO();
								String sql = "select rownum, t.* from storyboard t where movietitle="+"'"+movietitle+"'"+" and id="+"'"+id+"'";
								sdao.select(sql);
								pageContext.setAttribute("sdto", sdao.getDto());
						%>
						<div class="cWrap">
						<c:if test="${fn:length(sdto.writedate) == 0}">
							<form method="post" class="insertBox" action="insert_story.jsp">
							<input type="hidden" class="submitCBtn" name="title" value="${mdto.title }">
							<input type="hidden" class="submitCBtn" name="id" value="<%=id%>">
								<table>
									<tr>
										<td class="cBoxContents" onclick="event.stopPropagation()">
											<textarea class="cText" name="content" maxlength="250" placeholder="영화에 관한 스토리를 등록해주세요."></textarea>
											<input type="submit" class="submitCBtn" value="등록">
										</td>
									</tr>
								</table>
							</form>
							</c:if>
							<!-- 뿌려주는 칸 -->
							
						    <c:if test="${fn:length(sdto.writedate) != 0}">
							<table class="storybox">
								<tr>
									<td class="story" colspan="3">
										<div class="storyBoard">${sdto.content }</div>
										<div class="wDay">스토리 등록일 : ${sdto.writedate }</div>
									</td>
								</tr>
								<tr class="supdelWrap">
									<td class="updateBtn"><a href="#" onclick="showUpdate(${k})">수정</a></td>
									<td class="deleteBtn"><a onclick="return mystorydel()" href="deletemystory.jsp?sno=${sdto.sno}&id=<%=id%>">삭제</a></td>
								</tr>
							</table>
							<c:set var="k" value="${k+1}"/>
						   </c:if>	
						   <c:if test="${fn:length(sdto.writedate) != 0}">
							<form method="post" class="updateBox" action="update_story.jsp">
							<input type="hidden" class="submitCBtn" name="title" value="${mdto.title }">
							<input type="hidden" class="submitCBtn" name="id" value="<%=id%>">
								<table>
									<tr>
										<td class="cBoxContents"  onclick="event.stopPropagation()">
											<textarea class="cText" name="content" maxlength="250">${sdto.content }</textarea>
											<input onclick="return mystoryupdate()" type="submit" class="submitCBtn" value="수정">
										</td>
									</tr>
								</table>
							</form>
						  </c:if>
						</div>
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

