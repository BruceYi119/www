<%@page import="java.sql.Statement"%>
<%@page import="www.db.dto.CafeDTO"%>
<%@page import="www.db.dao.CafeDAO"%>
<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
<%-- <%@ include file="/include/top.jsp" %> --%>
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

CafeDAO dao = new CafeDAO();
//String sql = "select rownum, t.* from cafe t where rownum <= 10 order by cno desc "; 
//select rownum, tno, txt from (select seq, tno, txt from (select rownum seq, tno, txt from (select * from test order by tno desc)) where seq >= 295) where rownum <= 10;

request.setCharacterEncoding("utf-8");
int index; // limit에 전달할 index값
int pager; // 현재 나타내고자 하는 페이지 값을 저장 //page는 변수명으로 사용 불가
if (request.getParameter("pager") == null) {
	pager = 1;
} else {
	pager = Integer.parseInt(request.getParameter("pager"));
}

String sql = "";
String cla = request.getParameter("cla") == null ? "" : request.getParameter("cla");
String sword =  request.getParameter("sword") == null ? "" : request.getParameter("sword");
String addsql = "";
String addsql2 = "";

//index 만들기			2 - 1 * 10 + 1 = 11
index = pager == 1 ? 1 : ((pager - 1) * 10) + 1;
// 1페이지 일경우index = 1 1~10
// 10개씩 보여지니가 
// 2페이지일경우 index 11 11~21
// 3페이지 일경우 index 22 22~31
//String sql = "select rownum, t.* from (select row_number() over(order by cno desc) as rnum, cno, name, title, writype, animal, readnum, liked, writeday from cafe ) t where rnum > "+index+" and ROWNUM <=10";
if(sword=="") {
	sql = "select rownum, cno, name, title, pwd, writype, animal, readnum, liked, content, fname, readnum, liked, fimsi, writeday from (select seq, t2.* from ( select rownum seq, t1.* from (select * from cafe order by cno desc) t1) t2 where seq >= ?  ) where ROWNUM <=10";
	dao.selectAll(sql , index + "");
} else {
	if (cla.equals("name")) {
		sql = "select rownum, cno, name, title, pwd, writype, animal, readnum, liked, content, fname, readnum, liked, fimsi, writeday from (select seq, t2.* from ( select rownum seq, t1.* from (select * from cafe where name like '%'||?||'%' order by cno desc) t1) t2 where seq >= ?  ) where ROWNUM <=10";
		addsql =" where name like ";
		dao.selectAll(sql, ""+sword+"" , index + "");
	} else if (cla.equals("title")) {
		sql = "select rownum, cno, name, title, pwd, writype, animal, readnum, liked, content, fname, readnum, liked, fimsi, writeday from (select seq, t2.* from ( select rownum seq, t1.* from (select * from cafe where title like '%'||?||'%' order by cno desc) t1) t2 where seq >= ?  ) where ROWNUM <=10";
		addsql =" where title like ";
		dao.selectAll(sql, ""+sword+"" , index + "");
		//sql,sword,index,sword
	} else {
		sql = "select rownum, cno, name, title, pwd, writype, animal, readnum, liked, content, fname, readnum, liked, fimsi, writeday from (select seq, t2.* from ( select rownum seq, t1.* from (select * from cafe where name like '%'||?||'%' or title like '%'||?||'%' order by cno desc) t1) t2 where seq >= ? ) where ROWNUM <=10";
		addsql = " where name like ";
		addsql2 = " or title like ";
		dao.selectAll(sql, ""+sword+"", ""+sword+"" , index + "");
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="/view/img/favicon.ico"
	type="image/x-icon" />
<link rel="icon" href="/view/img/favicon.ico" type="image/x-icon" />
<title><%=title%></title>
<%=css%>
<style>
#container {
	margin: auto;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: underline;
}
</style>
<%=js %>
<script defer src="/view/js/cafe_list.js"></script>
</head>
<body onload="init()">
	<input type="hidden" id="color_class" value="wooram" />
	<div id="wrap">
		<input type="hidden" value="<%=pager%>" id="pager" />
		<jsp:include page="<%=headerUrl%>" flush="false" />
		<nav>
			<div class="base_wrap">
				<%=menu%>
			</div>
		</nav>
		<main>
		<div class="base_wrap">
			<div class="container" align="center">
						<div align="center">
					<form name="se" method="post" action="list.jsp">
						<select name="cla" id="cla">
							<option value="">제목+작성자</option>
							<option value="title">제목</option>
							<option value="name">작성자</option>
						</select> <input type="text" name="sword" value="<%=sword%>"> <input
							type="submit" value="검색">
					</form>
				</div>
				<form metod="post" action="write.jsp">
					<table width="800" align="center">
						<tr>
							<td width="150">카테고리</td>
							<td width="250" align="center">제목</td>
							<td width="100">작성자</td>
							<td width="100">작성일</td>
							<td width="50">조회수</td>
							<td width="50">추천수</td>
						</tr>
						<%
							//출력
							for (CafeDTO dto : dao.getList()) {
						%>
						<tr>
							<td><%=dto.getWritype()%></td>
							<td><a href="/view/wooram/readnum.jsp?cno= <%=dto.getCno()%>&pager=<%=pager%>&cla=<%=cla%>&sword=<%=sword%>"><%=dto.getTitle()%></a></td>
							<td><%=dto.getName()%></td>
							<td><%=dto.getWriteday()%></td>
							<td align="center"><%=dto.getReadnum()%></td>
							<td align="center"><%=dto.getLiked()%></td>
						</tr>
						<%
							}
						%>
						<tr align="center">
							<td colspan="6">
								<%
									// 총페이지 값 구하기 총레코드수/페이지당 레코드수
									// select count(*) from gesipan;
									//dao.select(sql); 	 	
									//int cnt=Integer.parseInt(dao.getDto().getCnt());
									int cnt;
									if(sword==""){
									cnt= dao.getListCount1();
									}else if(cla==null){
									cnt= dao.getListCount2(addsql,sword);
									}else{
									cnt= dao.getListCount3(addsql,addsql2,sword);
									}
									int page_cnt = cnt / 10 + 1;

									if (cnt % 10 == 0)
										page_cnt--;

									int pstart;

									pstart = pager / 10;
									if (pager % 10 == 0)
										pstart = pstart - 1;

									pstart = Integer.parseInt(pstart + "1");

									int pend = pstart + 9;

									if (page_cnt < pend)
										pend = page_cnt;
								%> <!-- 이전페이지 --> <!-- 현재 페이지 기준 10페이지 이전 --> <%
 	if (pstart != 1)////(현재페이지에 출력되는 그룹이 가장 첫번재 그룹이 아니냐 => pstart=1)
 	{
 %> <a href="list.jsp?pager=<%=pstart - 1%>&cla=<%=cla%>&sword=<%=sword%>">《</a> <%
 	} else {
 %> 《 <%
 	}
 %> <!-- 현재페이지 기준 1페이지 이전 --> <%
 	if (pager != 1) {
 %> <a href="list.jsp?pager=<%=pager - 1%>&cla=<%=cla%>&sword=<%=sword%>">◀</a> <%
 	} else {
 %> ◀ <%
 	}
 	for (int i = pstart; i <= pend; i++) {
 		String str = "";
 		if (pager == i)
 			str = "style='color:red;'";
 %> <a href="list.jsp?pager=<%=i%>" <%=str%>> <%=i%>
							</a> <%
 	}
 %> <!-- 다음페이지 --> <!-- 현재페이지 기준 1페이지 이후 --> <%
 	if (pager != page_cnt) {
 %> <a href="list.jsp?pager=<%=pager + 1%>&cla=<%=cla%>&sword=<%=sword%>">▶</a> <%
 	} else {
 %> ▶ <%
 	}
 %> <!-- 현재페이지 기준 다음 그룹으로 이동 --> <%
 	if (page_cnt != pend) {
 %> <a href="list.jsp?pager=<%=pend + 1%>&cla=<%=cla%>&sword=<%=sword%>">》</a> <%
 	} else {
 %> 》 <%
 	}
 %>
							</td>
						</tr>
						<tr>
							<td colspan="6"><input type="submit" value="글쓰기"></td>
						</tr>
					</table>
				</form>
	

			</div>
		</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="false" />
	</div>
</body>
</html>