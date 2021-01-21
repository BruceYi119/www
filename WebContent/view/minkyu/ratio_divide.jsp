<%@page import="java.util.ArrayList"%>
<%@page import="www.db.dto.StockDTO"%>
<%@page import="www.db.dao.StockDAO"%>
<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%-- <%@ include file="/include/top.jsp" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%

request.setCharacterEncoding("utf-8");
String pager = request.getParameter("pager") != null ? request.getParameter("pager") : "1";
String dspCount = "20"; // 보여지는 갯수
String index = pager.equals("1") ? "1" : ((Integer.parseInt(pager) - 1) * Integer.parseInt(dspCount) + 1) + ""; // start값
String search = request.getParameter("search") == null ? "" : request.getParameter("search");
String sword = request.getParameter("sword") == null ? null : request.getParameter("sword");
String searchText = null;
pageContext.setAttribute("searchText", searchText);
pageContext.setAttribute("pager", pager);
pageContext.setAttribute("search", search);
pageContext.setAttribute("sword", sword);
if (sword == null)
	searchText = "";
else
	searchText = sword;

StockDAO dao = new StockDAO();
StockDTO dtot = new StockDTO();
StringBuilder sb = new StringBuilder();

sb.append("select count(*) count from stock");
dao.count(sb.toString());
String pageCount = dao.getCount();
sb.setLength(0);
sb.append("select ");
sb.append(dtot.toString(true));
sb.append(" from (select seq,t2.* from(");
sb.append(" select rownum seq, t1.* from (select * from stock");
if (search.equals("suik")) {
	sb.append(" where title like '%%' ");
	sb.append(" order by suik desc) t1");
} else if (search.equals("beadang")) {
	sb.append(" where title like '%%' ");
	sb.append(" order by beadang desc) t1");
} else if (search != "")
	if (sword != null) {
		sb.append(" where title like '%' || ? || '%' ");
		sb.append(" order by suik desc) t1");
	} else {
		sb.append(" where title like '%%' ");
		sb.append(" order by suik desc) t1");
	}
else if (search.equals("suik")) {
	sb.append(" where title like '%%' ");
	sb.append(" order by suik desc) t1");
}
// 	if(search.equals("beadang"))
// 		sb.append(" order by beadang desc) t1");
else if (search == "") {
	sb.append(" where title like '%%' ");
	sb.append(" order by suik desc) t1");
}
// 	sb.append(" order by suik desc) t1");

// 	else if(search !="")
// 		sb.append(" order by beadang desc) t1");
sb.append(") t2 where seq>=? ) where rownum <=? ");
if (search.equals("suik"))
	dao.selectAll(sb.toString(), index, dspCount);
else if (search.equals("beadang"))
	dao.selectAll(sb.toString(), index, dspCount);
else if (search != "")
	dao.selectAll(sb.toString(), sword, index, dspCount);
else if (search == "")
	dao.selectAll(sb.toString(), index, dspCount);

// 	pageContext.setAttribute("list",list);

Header header = new Header();
String css = header.getCss();
String js = header.getJs();
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
<title><%=title%></title>
<%=css%>
<link rel="stylesheet" href="/view/css/minkyu_ratio_divide.css">
<%=js%>
</head>
<body>
	<input type="hidden" id="color_class" value="minkyu" />
	<div id="wrap">
		<jsp:include page="<%=headerUrl%>" flush="true"/>
		<nav>
			<div class="base_wrap">
				<%=menu%>
			</div>
		</nav>
		<main>
				<div class="container">
					<div class="nav">
						<ul class="nav-list">
							<li class="nav-item"><a href="minkyu.jsp" class="nav-link">오늘의 증시</a></li>
							<li class="nav-item"><a href="stock_fund.jsp" class="nav-link">주식 | 펀드 차이</a></li>
							<li class="nav-item"><a href="basic_divide.jsp" class="nav-link">배당주 | 용어</a></li>
							<li class="nav-item"><a href="good_divide.jsp" class="nav-link">배당주 올바르게 투자하기</a></li>
							<li class="nav-item"><a href="ratio_divide.jsp" class="nav-link">배당수익률 | 조회</a></li>
							<li class="nav-item"><a href="finance_state.jsp" class="nav-link">재무제표 | 조회</a></li>
							<li class="nav-item"><a href="board.jsp" class="nav-link">수익 | 노하우 공유</a></li>
						</ul>
					</div>
				
			<div class="content">
				<h1>&#60;상위 배당 수익률 순위&#62;</h1>
				<table id="table">
				<tr>
					<td class="td1">종목명</td>
					<td class="td1">현재가(원)</td>
					<td class="td1">기준월(년/월)</td>
					<td class="td1"><a href="ratio_divide.jsp?search=beadang">배당금(원)</a></td>
					<td class="td1"><a href="ratio_divide.jsp?search=suik">수익률(%)</a></td>
					<td class="td1">배당성향(%)</td>
				</tr>
				<%
					ArrayList <StockDTO> list = dao.getList();
					pageContext.setAttribute("list", list);
				%>
				<c:forEach items="${list}" var="sdao">
					<tr id="tr2">
					<td>${sdao.title}</td>
					
					<td><fmt:formatNumber value="${sdao.siga}" type="number" /></td>
					<td>${sdao.gijun}</td>
					<td><fmt:formatNumber value="${sdao.beadang}" type="number" /></td>
					<td><fmt:formatNumber value="${sdao.suik}" pattern="0.00"/></td>
					<td>${sdao.beadang1}</td>
				</tr>
				</c:forEach>
				
				<tr>
					<td colspan="6" align="center" class="td3">
						<form method="post" action="ratio_divide.jsp">
							<select name="search">
								<option value="title">종목명</option>
							</select>
							<input type="text" name="sword" placeholder="검색할 종목을 입력하세요" value="${searchText}">
							<input type="submit" value="검색">
							
						</form>
					</td>
				</tr>
				<tr>
				<td colspan="6" align="center">
					<%
					String sql = "select count(*) count from stock where title like '%' || ? || '%' ";
					
					if(search != ""){
						dao.count(sql,sword);
						pageCount = dao.getCount();
					}
					
					int page_cnt = Integer.parseInt(pageCount) / Integer.parseInt(dspCount) + 1;
					if (Integer.parseInt(pageCount) % 10 == 0)
						page_cnt--;
					pageContext.setAttribute("page_cnt", page_cnt);
					
					int pstart;
					pstart = Integer.parseInt(pager) / 10;
					if (Integer.parseInt(pager) % 10 == 0) {
						pstart = pstart - 1;
					}
					pstart = Integer.parseInt(pstart + "1");
					pageContext.setAttribute("pstart", pstart);

					int pend = pstart + 9; //251 +9 =>260 총 페이지 : 255
// 					out.print(page_cnt);
					if (page_cnt < pend) {
						pend = page_cnt;
					}
					pageContext.setAttribute("pend", pend);
					%>
					
					<c:if test="${pstart != 1}">
						<a href="ratio_divide.jsp?pager=${pstart-1 }&search=${search}&sword=${sword}">◀◀</a> 
					</c:if>
					<c:if test="${pstart == 1}">
						◀◀
					</c:if>
					<c:if test="${pager != 1}">
					<a href="ratio_divide.jsp?pager=${pager-1}&search=${search}&sword=${sword}">이전</a>
					</c:if>
					<c:if test="${pager ==1}">
					이전
					</c:if>
					<c:forEach begin="${pstart}" end="${pend}" var="i">
						<c:if test="${pager == i}">
							<a href="ratio_divide.jsp?pager=${i}&search=${search}&sword=${sword}" style="color:red">${i}</a>
						</c:if>
						<c:if test="${pager != i}">
							<a href="ratio_divide.jsp?pager=${i}&search=${search}&sword=${sword}">${i}</a>
						</c:if>
						</c:forEach>
						<c:if test="${pager != page_cnt}">
							 <a href="ratio_divide.jsp?pager=${pager+1 }&search=${search}&sword=${sword}">다음</a>
						</c:if>
						<c:if test="${pager == page_cnt }">
							다음
						</c:if>
						<c:if test="${page_cnt != pend }">
							<a href="ratio_divide.jsp?pager=${pend+1 }&search=${search}&sword=${sword}">▶▶</a>
						</c:if>
						<c:if test="${page_cnt == pend }">
						 	▶▶
						</c:if>
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