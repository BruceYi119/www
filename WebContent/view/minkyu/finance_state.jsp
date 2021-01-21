<%@page import="www.member.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="www.db.dao.CompanyCodeDAO"%>
<%@page import="www.db.dto.CompanyCodeDTO"%>
<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
<%@page import="java.sql.*" %>  
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String pager = request.getParameter("pager") != null ? request.getParameter("pager") : "1";
String dspCount = "20"; // 보여지는 갯수
String index = pager.equals("1") ? "1" : ((Integer.parseInt(pager) - 1) * Integer.parseInt(dspCount) + 1) + ""; // start값
String search = request.getParameter("search") != null ? request.getParameter("search") : "";
String sword = request.getParameter("sword") != null ? request.getParameter("sword") : null;
String searchText = null;

pageContext.setAttribute("searchText", searchText);
pageContext.setAttribute("pager", pager);
pageContext.setAttribute("search", search);
pageContext.setAttribute("sword", sword);

if(sword==null)
	searchText="";
else
	searchText=sword;
CompanyCodeDAO dao = new CompanyCodeDAO();
StringBuilder sb = new StringBuilder();
sb.append("select count(*) count from companycode");
dao.count(sb.toString());
String pageCount = dao.getCount();
sb.setLength(0);
sb.append("select ");
sb.append(" rownum,cno,company,code ");
sb.append(" from (select seq, t2.* from(");
sb.append(" select rownum seq, t1.* from (select * from companycode");
if (search != "")
// 	if (search.equals("company"))
	if(sword==null)
		sb.append(" where company like '%%' ");
	else
		sb.append(" where company like '%' || ? || '%' ");
else if(search == "")
	sb.append(" where company like '%%' ");
sb.append(" order by cno desc) t1");
sb.append(" ) t2 where seq >=? ) where rownum <= ? ");

// if (search != "")
// 	dao.selectAll(sb.toString(),sword,index,dspCount);
// else
if (search != "")
	dao.selectAll(sb.toString(), sword, index,dspCount);
else if(search == "")
	dao.selectAll(sb.toString(), index,dspCount);
// out.print(sb.toString());
%>
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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title><%=title%></title>
<%=css%>
<link rel="stylesheet" href="/view/css/minkyu_finance_state.css">
<%=js%>
<script defer src="/view/js/minkyu_finance.js"></script>
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
				<form method="post" action="finance_state.jsp">
				<table class="company">
					<h2 class="first">금융감독원 전자공시시스템을 활용한 상장기업 정보조회</h2>
					<div id="info">{ DART 공시서류는 공시의무자인 제출인의 책임하에 작성되었으며, 금감원은 DART 정보의 정확성 및 완전성을 보장하는 것은 아닙니다. } </div>
				<tr>
					<td colspan="2" align="center" id="td1">
					<select name="search">
						<option value="company">기업명</option>
					</select>
						<input type="text" size="45" name="sword" placeholder="검색할 종목을 입력하세요" value="${searchText}" class="hold">
						<input type="submit" value="검색">
						</td>
					
					</tr>
					<tr>
						<td align="center">기업명</td>
						<td align="center">기업코드</td>
					</tr>
					<%
						ArrayList<CompanyCodeDTO> list = dao.getList();
						pageContext.setAttribute("list", list);
							
					%>
					<c:forEach items="${list}" var="cdto">
						<tr>
						<td align="center" width="50%">${cdto.company}</td>
						<c:if test="${name != null}">
						<td align="center"><a href="#" onclick='window.open("API3.jsp?code=${cdto.code}","기업정보","width=470, height=250")'>${cdto.code}</a></td>
						</c:if>
						<c:if test="${name == null}">
						<td align="center"><a href="#" onclick='login()'>${cdto.code}</a></td>
						</c:if>
					</tr>
					</c:forEach>
					<tr> <!-- 사용자가 클릭하여 이동할 수 있는 페이지 출력 -->
				<td colspan="4" align="center">
				<%	
					String sql = "select count(*) count from companycode where company like '%' || ? || '%' ";
					dao.count(sql,sword);
					pageCount = dao.getCount();
					
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

					if (page_cnt < pend) {
						pend = page_cnt;
					}
					pageContext.setAttribute("pend", pend);
					%>

					<c:if test="${pager != 1}">
						<a href="finance_state.jsp?pager=${pager-1}&search=${search}&sword=${sword}">이전</a>
					</c:if>
					<c:forEach var="i" begin="${pstart}" end="${pend}">
						<c:if test="${pager == i}" >
							<a href="finance_state.jsp?pager=${i}&search=${search}&sword=${sword}" style="color:red">${i}</a>
						</c:if>
						<c:if test="${pager != i}" >
							<a href="finance_state.jsp?pager=${i}&search=${search}&sword=${sword}">${i}</a>
						</c:if>
					</c:forEach>
					<c:if test="${pager != page_cnt}">
						 <a href="finance_state.jsp?pager=${pager+1}&search=${search}&sword=${sword}">다음</a>
					</c:if>
					<c:if test="${pager == page_cnt }">
						다음
					</c:if>
					</table>
					</form>		
				
			</div>
		</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="true"/>
	</div>
</body>
</html>