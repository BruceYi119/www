<%@page import="www.member.Member"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.Select"%>
<%@page import="www.db.dto.StockBoardDTO"%>
<%@page import="www.db.dao.StockBoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file="/include/top.jsp" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%

request.setCharacterEncoding("utf-8");

Header header = new Header();
String css = header.getCss();
String js = header.getJs();
String title = header.getTitle();
String headerUrl = header.getHeaderUrl();

Nav nav = new Nav();
String menu = nav.getMenu();

Footer footer = new Footer();
String footerUrl = footer.getFooterUrl();

request.setCharacterEncoding("utf-8");
String pager = request.getParameter("pager") != null ? request.getParameter("pager") : "1";
String dspCount = "13"; // 보여지는 갯수
String index = pager.equals("1") ? "1" : ((Integer.parseInt(pager) - 1) * Integer.parseInt(dspCount) + 1) + ""; // start값
String kind = request.getParameter("kind") != null ? request.getParameter("kind") : null;
String search = request.getParameter("search") == null ? "" : request.getParameter("search");
String sword = request.getParameter("sword") == null ? "" : request.getParameter("sword");
// 페이지가 1인경우 스타트값은 1 , 1페이지 이상인경우 (Integer.parseInt(pager) * Integer.parseInt(dspCount) + 1)
// 2페이지면 21이겠쬬?
StockBoardDAO dao = new StockBoardDAO();
StringBuilder sb = new StringBuilder();
StockBoardDTO dtoa = new StockBoardDTO();

pageContext.setAttribute("pager", pager);
pageContext.setAttribute("search", search);
pageContext.setAttribute("sword", sword);
pageContext.setAttribute("kind", kind);

sb.append("select count(*) count from stockboard");
if (kind != null)
	sb.append(" where kind = ?");

if (kind != null)
	dao.count(sb.toString(), kind);
else
	dao.count(sb.toString());
String pageCount = dao.getCount();
// out.print(pageCount);
ArrayList<String> kindList = dao.getKindList();

pageContext.setAttribute("kindList", kindList);

sb.setLength(0);	// 스트링빌더 초기화 
sb.append("select ");
sb.append(dtoa.toString(true));
sb.append(" from (select seq, t2.* from (");
sb.append("select rownum seq, t1.* from (select * from stockboard");
if (search != "")
	if(search.equals("name"))
		sb.append(" where name like '%' || ? || '%'");
	else if(search.equals("title"))
		sb.append(" where title like '%' || ? || '%'");
if (kind != null)
	sb.append("  where kind = ? ");
sb.append(" order by sbno desc) t1");
sb.append(") t2 where seq >= ?) where rownum <= ?");
if (kind != null)
	dao.selectAll(sb.toString(), kind, index, dspCount);
else
	dao.selectAll(sb.toString(), index, dspCount);
if (search == "")
	dao.selectAll(sb.toString(), index, dspCount);
else if(search !="")
	dao.selectAll(sb.toString(),sword,index,dspCount);
// out.print(sb.toString());

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title><%=title%></title>

<%=css%>
<link rel="stylesheet" href="/view/css/minkyu_board.css">
<%=js%>
<script defer src="/view/js/minkyu_board.js"></script>
<script defer src="/view/js/minkyu_finance.js"></script>
</head>
<body>
	<input type="hidden" id="color_class" value="minkyu" />
	<div id="wrap">
		<input type="hidden" value="${pager}" id="pager" />
		<input type="hidden" value="${kind}" id="kind" />
		<jsp:include page="<%=headerUrl%>" flush="true" />
		<nav>
			<div class="base_wrap">
				<%=menu%>
			</div>
		</nav>
		<main>
			<div class="first">
				
			</div>
			<div class="container">
				<div class="nav">
					<ul class="nav-list">
						<li class="nav-item"><a href="minkyu.jsp" class="nav-link">오늘의 증시</a></li>
						<li class="nav-item"><a href="stock_fund.jsp" class="nav-link">주식 | 펀드 차이</a></li>
						<li class="nav-item"><a href="basic_divide.jsp" class="nav-link">배당주 | 용어</a></li>
						<li class="nav-item"><a href="good_divide.jsp" class="nav-link">배당주 올바르게 투자하기</a></li>
						<li class="nav-item"><a href="ratio_divide.jsp"	class="nav-link">배당수익률 | 조회</a></li>
						<li class="nav-item"><a href="finance_state.jsp" class="nav-link">재무제표  조회</a></li>
						<li class="nav-item"><a href="board.jsp" class="nav-link">수익|노하우 공유</a></li>
					</ul>
				</div>
				<div class="content">
					<table id="table">
					<tr>
						<h1 class="first">주식 토론 게시판</h1>
						<td id="tdbtn" colspan="7">
							<% 
							Member m = new Member();

							boolean login = m.isLogin(session);
							pageContext.setAttribute("login", login);

							if (login)
								pageContext.setAttribute("name", session.getAttribute("name"));
							%>
							<c:if test="${name != null}">
								<button onclick="location='board_write.jsp'" id="btn">
								✎글쓰기
								</button>
							</c:if>
							<c:if test="${name == null }">
							<button onclick="login()" id="btn">
								✎글쓰기
								</button>
							</c:if>
							</td>
						</tr>
						
						<tr>
							<td class="td1">
								<select id="kindSelect">
								 <option value="">- 카테고리 -</option>
									<c:forEach items="${kindList}" var="data">
										<option value="${data}">${data}</option>
									</c:forEach>
								</select>
							</td>
							<td class="td1">제목</td>
							<td class="td1">글쓴이</td>
							<td class="td1">공감</td>
							<td class="td1">비공감</td>
							<td class="td1">조회수</td>
							<td class="td1">날짜</td>
						</tr>
						<%
							ArrayList<StockBoardDTO> list = dao.getList();
							pageContext.setAttribute("list",list);
						%>
						<c:forEach items="${list}" var="dto">
						<tr>
							<td class="td2">&#60;${dto.kind }&#62;
							</td>
							<td class="td2">
							<c:if test="${name != null }">
							<a href="board_readnum.jsp?sbno=${dto.sbno }&pager=${pager}&search=${search}&sword=${sword}">${dto.title }</a></td>
							</c:if>
							<c:if test="${name == null }">
							<a href="#" onclick="login()">${dto.title }</a></td>
							</c:if>
							<td class="td2">${dto.name}</td>
							<td class="td2">${dto.good}</td>
							<td class="td2">${dto.bad}</td>
							<td class="td2">${dto.readnum}</td>
							<td class="td2">${dto.writeday}</td>
						</tr>
						</c:forEach>
						<tr>
					<td colspan="7" align="center">
					<form name="se" method="post" action="board.jsp" id="seraform">
					<select name="search">
						<option value="title">제목</option>
						<option value="name">글쓴이</option>
					</select>
						<input type="text" size="30" name="sword" value="${sword}" >
						<input type="submit" value="검색">
						</form>
						</td>
					
					</tr>
						<tr>
							<td colspan="7" align="center">
								<%
								if(search.equals("title")){
									String sql = "select count(*) count from stockboard where title like '%' || ? || '%' ";
									dao.count(sql,sword);
									pageCount = dao.getCount();
									}
								if(search.equals("name")){
									String sql = "select count(*) count from stockboard where name like '%' || ? || '%' ";
									dao.count(sql,sword);
									pageCount = dao.getCount();
									}
								int page_cnt = Integer.parseInt(pageCount) / Integer.parseInt(dspCount) + 1;
								if (Integer.parseInt(pageCount) % 10 == 0)
									page_cnt--;
								pageContext.setAttribute("page_cnt", page_cnt);

								int pstart = 0;
								pstart = Integer.parseInt(pager) / 10;
								if (Integer.parseInt(pager) % 10 == 0) {
									pstart = pstart - 1;
								}
								pstart = Integer.parseInt(pstart + "1");
								pageContext.setAttribute("pstart", pstart);

								int pend = pstart + 9; //251 +9 =>260 총 페이지 : 255
								if (page_cnt < pend) {
									pend = page_cnt;
								}
								pageContext.setAttribute("pend", pend);
								%>
								 <c:if test="${pstart != 1}">
								 <a href="board.jsp?pager=${pstart-1 }&search=${search}&sword=${sword}">☜</a>
								 </c:if>
								 <c:if test="${pstart == 1}">
								 ☜
								 </c:if>
								
								<c:if test="${pager != 1}">
								<a href="board.jsp?pager=${pager-1 }&search=${search}&sword=${sword}">이전</a>
								</c:if>
								<c:if test="${pager ==1}">
								이전
								</c:if>
								<c:forEach begin="${pstart}" end="${pend}" var="i">
									<c:if test="${pager == i}">
										<a href="board.jsp?pager=${i}&search=${search}&sword=${sword}" style="color:red">${i}</a>
									</c:if>
									<c:if test="${pager != i}">
										<a href="board.jsp?pager=${i}&search=${search}&sword=${sword}">${i}</a>
									</c:if>
								</c:forEach>
									<c:if test="${pager != page_cnt}">
									 <a href="board.jsp?pager=${pager+1 }&search=${search}&sword=${sword}">다음</a>
									</c:if>
								<c:if test="${pager == page_cnt }">
									다음
								</c:if>
								<c:if test="${page_cnt != pend }">
									<a href="board.jsp?pager=${pend+1 }&search=${search}&sword=${sword}">☞</a>
								</c:if>
								<c:if test="${page_cnt == pend }">
								 	☞
								</c:if>
							</td>
						<tr>
					</table>


				</div>
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="true" />
	</div>
</body>
</html>