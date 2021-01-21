<%@page import="www.db.dto.CmemberDTO"%>
<%@page import="www.db.dao.CmemberDAO"%>
<%@page import="java.sql.Statement"%>
<%@page import="www.db.dto.CafeDTO"%>
<%@page import="www.db.dao.CafeDAO"%>
<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
<%-- <%@ include file="/include/top.jsp" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	CmemberDAO cdao = new CmemberDAO();
	CmemberDTO cdto = new CmemberDTO();
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
	String sword = request.getParameter("sword") == null ? "" : request.getParameter("sword");
	String addsql = "";
	String addsql2 = "";
	String nick = "";

	String mytype = request.getParameter("mytype") == null ? "" : request.getParameter("mytype");
	String anitype = request.getParameter("anitype") == null ? "" : request.getParameter("anitype");
	String mine = request.getParameter("mine") == null ? "" : request.getParameter("mine");

	//index 만들기			2 - 1 * 10 + 1 = 11
	index = pager == 1 ? 1 : ((pager - 1) * 10) + 1;
	// 1페이지 일경우index = 1 1~10
	// 10개씩 보여지니가 
	// 2페이지일경우 index 11 11~21
	// 3페이지 일경우 index 22 22~31
	// 기본 페이징 쿼리 : String sql = "select rownum, t.* from (select row_number() over(order by cno desc) as rnum, cno, name, title, writype, animal, readnum, liked, writeday from cafe ) t where rnum > "+index+" and ROWNUM <=10";
	//if (mytype != "")
	//{
	if (mytype != "") {
		sql = "select rownum, cno, name, title, writype, animal, readnum, liked, content, fname, readnum, liked, fimsi, writeday from (select seq, t2.* from ( select rownum seq, t1.* from (select * from cafe where writype=? order by cno desc) t1) t2 where seq >= ?  ) where ROWNUM <=10";
		addsql = " where writype = ";
		dao.selectAll(sql, mytype, index + "");
	} else if (anitype != "") {
		sql = "select rownum, cno, name, title, writype, animal, readnum, liked, content, fname, readnum, liked, fimsi, writeday from (select seq, t2.* from ( select rownum seq, t1.* from (select * from cafe where animal=? order by cno desc) t1) t2 where seq >= ?  ) where ROWNUM <=10";
		addsql = " where animal = ";
		dao.selectAll(sql, anitype, index + "");
	} else if (mine != "") {
		sql = "select rownum, cno, name, title, writype, animal, readnum, liked, content, fname, readnum, liked, fimsi, writeday from (select seq, t2.* from ( select rownum seq, t1.* from (select * from cafe where name=? order by cno desc) t1) t2 where seq >= ?  ) where ROWNUM <=10";
		addsql = " where name = ";
		nick = session.getAttribute("nick").toString();
		dao.selectAll(sql, nick, index + "");
	} else if (sword == "") {
		sql = "select rownum, cno, name, title, writype, animal, readnum, liked, content, fname, readnum, liked, fimsi, writeday from (select seq, t2.* from ( select rownum seq, t1.* from (select * from cafe order by cno desc) t1) t2 where seq >= ?  ) where ROWNUM <=10";
		dao.selectAll(sql, index + "");
	} else {
		if (cla.equals("name")) {
			sql = "select rownum, cno, name, title, writype, animal, readnum, liked, content, fname, readnum, liked, fimsi, writeday from (select seq, t2.* from ( select rownum seq, t1.* from (select * from cafe where name like '%'||?||'%' order by cno desc) t1) t2 where seq >= ?  ) where ROWNUM <=10";
			addsql = " where name like ";
			dao.selectAll(sql, "" + sword + "", index + "");
		} else if (cla.equals("title")) {
			sql = "select rownum, cno, name, title, writype, animal, readnum, liked, content, fname, readnum, liked, fimsi, writeday from (select seq, t2.* from ( select rownum seq, t1.* from (select * from cafe where title like '%'||?||'%' order by cno desc) t1) t2 where seq >= ?  ) where ROWNUM <=10";
			addsql = " where title like ";
			dao.selectAll(sql, "" + sword + "", index + "");
			//sql,sword,index,sword
		} else {
			sql = "select rownum, cno, name, title, writype, animal, readnum, liked, content, fname, readnum, liked, fimsi, writeday from (select seq, t2.* from ( select rownum seq, t1.* from (select * from cafe where name like '%'||?||'%' or title like '%'||?||'%' order by cno desc) t1) t2 where seq >= ? ) where ROWNUM <=10";
			addsql = " where name like ";
			addsql2 = " or title like ";
			dao.selectAll(sql, "" + sword + "", "" + sword + "", index + "");
		}
	}
	//여기서부터

	StringBuilder sb = new StringBuilder();

	sb.append("select count(*) total from cmember");

	// 총 멤버 수 가져오기
	int m_cnt = cdao.count(sb.toString());
	request.setAttribute("m_cnt", m_cnt);

	// sb초기화 ,전체글 보기
	sb.setLength(0);
	sb.append("select count(*) total from cafe");
	int w_cnt = cdao.count(sb.toString());
	request.setAttribute("w_cnt", w_cnt);
	// 애완동물 소개 글보기
	sb.setLength(0);
	sb.append("select count(*) total from cafe where writype='애완동물 소개'");
	int wm1_cnt = cdao.count(sb.toString());
	request.setAttribute("wm1_cnt", wm1_cnt);
	// 정보와지식 공유 글보기
	sb.setLength(0);
	sb.append("select count(*) total from cafe where writype='정보와지식 공유'");
	int wm2_cnt = cdao.count(sb.toString());
	request.setAttribute("wm2_cnt", wm2_cnt);
	// 강아지 글보기
	sb.setLength(0);
	sb.append("select count(*) total from cafe where animal='강아지'");
	int am1_cnt = cdao.count(sb.toString());
	request.setAttribute("am1_cnt", am1_cnt);
	// 고양이 글보기
	sb.setLength(0);
	sb.append("select count(*) total from cafe where animal='고양이'");
	int am2_cnt = cdao.count(sb.toString());
	request.setAttribute("am2_cnt", am2_cnt);
	// 기타 동물 공유 글보기
	sb.setLength(0);
	sb.append("select count(*) total from cafe where animal='기타'");
	int am3_cnt = cdao.count(sb.toString());
	request.setAttribute("am3_cnt", am3_cnt);

	if (session.getAttribute("nick") != null) {
		sql = "select * from cmember where nick = ? ";
		cdao.select(sql, session.getAttribute("nick").toString());
		cdto = cdao.getDto();
		String subday = cdto.getSubday().substring(0, 10);
		sb.setLength(0);
		sb.append("select count(*) total from cafe where name=?");
		int my_cnt = cdao.count(sb.toString(), session.getAttribute("nick").toString());
		request.setAttribute("my_cnt", my_cnt);
		request.setAttribute("cdto", cdto);
		request.setAttribute("subday", subday);
	}

	//여기 까지 밑에 또있음
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
<link rel="stylesheet" href="/view/css/cafe_list.css">
<link rel="stylesheet" href="/view/css/cafe_nav.css">
<%=js%>
<script defer src="/view/js/cafe_list.js"></script>
<script defer src="/view/js/cafe_nav.js"></script>
</head>
<body onload="init()">
	<input type="hidden" id="color_class" value="wooram" />
	<input type="hidden" id="chk" value="<%=request.getParameter("chk")%>" />
	<input type="hidden" id="nick" value="${nick }" />

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

			<div id="container" align="center">
				<!-- 여기서부터 -->
				<div id="navi">
					<input type="hidden" name="cmno" value="${cdto.cmno }">
					<div id="cafe_name">애완동물카페 😸🐶🐕‍🐈</div>
					<div id="in_nav">
						<div id="cafe_info_click">카페정보</div>
						<c:if test="${nick!=null }">
							<div id="my_info_click">나의정보</div>
						</c:if>
						<c:if test="${id==null }">
							<div id="my_info_notclick"
								onclick="location.href='../member/login.jsp'">나의정보</div>
						</c:if>
						<c:if test="${nick==null && id!=null }">
							<div id="my_info_notclick"
								onclick="location.href='cafe_idcheck.jsp'">나의정보</div>
						</c:if>
					</div>
					<div id="cafe_info">
						<table id="info_table">
							<tr class="cafe_info" height="40"
								style="border-bottom: 1px solid;">
								<td id="img_td"><img alt="하이" src="img/펭수8.gif"
									width="70px" height="70px" /></td>
								<td id="img_right"><span id="manager"> 매니져</span> 펭수
									<p>
										<span id="since">since : 2021-01-22 </span>
									<p>
										<span onclick="location.href='cafe_info.jsp'"
											class="choice_sql">카페소개</span></td>
							</tr>
							<tr class="cafe_info">
								<td>카페등급 : 1단계</td>
								<td>
									<div class="writetype">회원수 : ${m_cnt }</div>
								</td>
							</tr>
							<tr class="cafe_info" style="border-bottom: 1px solid;">
								<td colspan="2">주제 : 정보공유 > 애완동물</td>
							</tr>
							<tr class="my_info" height="40" style="border-bottom: 1px solid;">
								<td id="img_td"><img alt="내사진" src="img/펭수7.gif"
									width="70px" height="70px" /></td>
								<td id="img_right"><span id="manager"> 닉네임</span>${nick}
									<p>
										<span id="since">since : ${subday} </span>
									<p>
										<c:if test="${cdto.mtype == 'a'}">
											<span onclick="location.href='../../admin/cafe.jsp'"
												class="choice_sql">회원관리</span>/
										<span
												onclick="location.href='cafe_member_update.jsp?cmno=${cdto.cmno }'"
												class="choice_sql">수정</span>
										</c:if>
										<c:if test="${cdto.mtype == 'n'}">
											<span
												onclick="location.href='cafe_member_update.jsp?cmno=${cdto.cmno }'"
												class="choice_sql">회원정보 수정</span>
										</c:if></td>
							</tr>
							<c:if test="${cdto.mtype == 'n'}">
								<c:if test="${my_cnt < 3 }">
									<tr class="my_info">
										<td colspan="2">회원등급 : <span id="mem_rating"> 🥚계란
										</span>
										</td>
									</tr>
								</c:if>
								<c:if test="${my_cnt < 10 && my_cnt > 3}">
									<tr class="my_info">
										<td colspan="2">회원등급 : <span id="mem_rating">
												🐤병아리 </span></td>
									</tr>
								</c:if>
								<c:if test="${my_cnt > 10}">
									<tr class="my_info">
										<td colspan="2">회원등급 : <span id="mem_rating"> 🐔닭</span>
										</td>
									</tr>
								</c:if>
							</c:if>
							<c:if test="${cdto.mtype == 'a'}">
								<tr class="my_info">
									<td colspan="2">회원등급 : <span id="mem_rating">🐓관리자</span>
									</td>
								</tr>
							</c:if>
								<tr class="my_info choice_sql"
									onclick="location.href='list.jsp?mine=1'"
									style="border-bottom: 1px solid;">
									<td colspan="2">내가 쓴 글 보기
										<div class="writetype">${my_cnt }</div>
									</td>
								</tr>
							<tr>
							<tr class="choice_sql" onclick="location.href='list.jsp'">
								<td colspan="2">전체글 보기
									<div class="writetype">${w_cnt }</div>
								</td>
							</tr>
							<tr class="choice_sql"
								onclick="location.href='list.jsp?mytype=애완동물 소개'">
								<td colspan="2">애완동물 소개 글보기
									<div class="writetype">${wm1_cnt }</div>
								</td>
							</tr>
							<tr class="choice_sql" style="border-bottom: 1px solid;"
								onclick="location.href='list.jsp?mytype=정보와지식 공유'">
								<td colspan="2">정보와지식 공유 글보기
									<div class="writetype">${wm2_cnt }</div>
								</td>
							</tr>
							<tr class="choice_sql"
								onclick="location.href='list.jsp?anitype=강아지'">
								<td colspan="2">강아지 관련 글보기
									<div class="writetype">${am1_cnt }</div>
								</td>
							</tr>
							<tr class="choice_sql"
								onclick="location.href='list.jsp?anitype=고양이'">
								<td colspan="2">고양이 관련 글보기
									<div class="writetype">${am2_cnt }</div>
								</td>
							</tr>
							<tr class="choice_sql" style="border-bottom: 1px solid;"
								onclick="location.href='list.jsp?anitype=기타'">
								<td colspan="2">그 외 동물 글보기
									<div class="writetype">${am3_cnt }</div>
								</td>
							</tr>
						</table>
					</div>
					<div id="my_btn">
						<table>
							<c:if test="${nick != null }">
								<tr align="center">
									<td colspan="2"><input type="button"
										onclick="location.href='write.jsp'" value="글쓰기"></td>
								</tr>
							</c:if>
							<c:if test="${nick == null && id != null }">
								<tr align="center">
									<td colspan="2"><input type="button"
										onclick="location.href='cafe_idcheck.jsp'" value="회원체크"></td>
								</tr>
							</c:if>
							<c:if test="${ id == null }">
								<tr align="center">
									<td colspan="2"><input type="button"
										onclick="location.href='../member/login.jsp'" value="가입하기"></td>
								</tr>
							</c:if>
						</table>
					</div>
					<c:if test="${cdto.mtype == 'a'}">
						<div id="cafe_del">
							<a href="cafe_member_out.jsp">회원 강퇴하기</a>
						</div>
					</c:if>
					<c:if test="${nick != null && cdto.mtype == 'n'}">
						<div id="cafe_del">
							<a href="cafe_member_del.jsp?cmno=${cdto.cmno }">카페 탈퇴하기</a>
						</div>
					</c:if>
					<c:if test="${id == null   }">
						<div id="cafe_del">
							<a href="../member/login.jsp">카페 탈퇴하기</a>
						</div>
					</c:if>
					<c:if test="${id != null && nick==null  }">
						<div id="cafe_del">
							<a href="cafe_idcheck.jsp">카페 탈퇴하기</a>
						</div>
					</c:if>
				</div>
				<!-- 여기까지  -->
				<div id="in_con">
					<div id="csearch" align="center">
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
						<table align="center">
							<tr>
								<th style="width: 20%">카테고리</th>
								<th style="width: 35%">제목</th>
								<th style="width: 10%">작성자</th>
								<th style="width: 15%">작성일</th>
								<th style="width: 10%; text-align: center">조회수</th>
								<th style="width: 10%; text-align: center">추천수</th>
							</tr>
							<%
								//출력
								for (CafeDTO dto : dao.getList()) {
							%>
							<tr class="list_td"
								onclick="location.href='readnum.jsp?cno= <%=dto.getCno()%>&pager=<%=pager%>&cla=<%=cla%>&sword=<%=sword%>'">
								<td><%=dto.getWritype()%> (<%=dto.getAnimal()%>)</td>
								<td><%=dto.getTitle()%></td>
								<td><%=dto.getName()%></td>
								<td><%=dto.getWriteday()%></td>
								<td align="center" class="list_td"><%=dto.getReadnum()%></td>
								<td align="center" class="list_td"><%=dto.getLiked()%></td>
							</tr>
							<%
								}
							%>
							<tr>
								<td style="padding-right: 300px;" colspan="6">
									<ul class="pagination"
										style="width: 100px; margin: 0 auto; float: inherit;">
										<%
											// 총페이지 값 구하기 총레코드수/페이지당 레코드수
											// select count(*) from gesipan;
											//dao.select(sql); 	 	
											//int cnt=Integer.parseInt(dao.getDto().getCnt());
											int cnt;
											if (mytype != "") {
												cnt = dao.getListCount4(addsql, mytype);
											} else if (anitype != "") {
												cnt = dao.getListCount4(addsql, anitype);
											} else if (mine != "") {
												cnt = dao.getListCount4(addsql, nick);
											} else if (sword == "") {
												cnt = dao.getListCount1();
											} else if (cla == null) {
												cnt = dao.getListCount2(addsql, sword);
											} else {
												cnt = dao.getListCount3(addsql, addsql2, sword);
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
										%>
										<!-- 이전페이지 -->
										<!-- 현재 페이지 기준 10페이지 이전 -->
										<%
											if (pstart != 1)////(현재페이지에 출력되는 그룹이 가장 첫번재 그룹이 아니냐 => pstart=1)
											{
										%>

										<li class="page-item" style="margin: auto;"><a
											class="page-link"
											href="list.jsp?pager=<%=pstart - 1%>&cla=<%=cla%>&sword=<%=sword%>&mytype=<%=mytype%>&anitype=<%=anitype%>&mine=<%=mine%>"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
										<%
											} else {
										%>
										<li class="page-item" style="margin: auto;"><span
											class="page-link" aria-hidden="true">&laquo;</span></li>
										<%
											}
										%>
										<!-- 현재페이지 기준 1페이지 이전 -->
										<%
											if (pager != 1) {
										%>
										<li class="page-item" style="margin: auto;"><a
											class="page-link"
											href="list.jsp?pager=<%=pager - 1%>&cla=<%=cla%>&sword=<%=sword%>&mytype=<%=mytype%>&anitype=<%=anitype%>&mine=<%=mine%>"
											aria-label="Previous"> <span aria-hidden="true">&lt;</span>
										</a></li>
										<%
											} else {
										%>
										<li class="page-item" style="margin: auto;"><span
											class="page-link" aria-hidden="true">&lt;</span></li>
										<%
											}
											for (int i = pstart; i <= pend; i++) {
												String str = "";
												if (pager == i)
													str = "style='color:red;'";
										%>
										<li class="page-item"><a class="page-link"
											href="list.jsp?pager=<%=i%>" <%=str%>><%=i%></a></li>

										<%
											}
										%>
										<!-- 다음페이지 -->
										<!-- 현재페이지 기준 1페이지 이후 -->
										<%
											if (pager != page_cnt) {
										%>
										<li class="page-item" style="margin: auto;"><a
											class="page-link"
											href="list.jsp?pager=<%=pager + 1%>&cla=<%=cla%>&sword=<%=sword%>&mytype=<%=mytype%>&anitype=<%=anitype%>&mine=<%=mine%>"
											aria-label="Next"> <span aria-hidden="true">&gt;</span>
										</a></li>
										<%
											} else {
										%>
										<li class="page-item" style="margin: auto;"><span
											class="page-link" aria-hidden="true">&gt;</span></li>
										<%
											}
										%>
										<!-- 현재페이지 기준 다음 그룹으로 이동 -->
										<%
											if (page_cnt != pend) {
										%>
										<li class="page-item" style="margin: auto;"><a
											class="page-link"
											href="list.jsp?pager=<%=pend + 1%>&cla=<%=cla%>&sword=<%=sword%>&mytype=<%=mytype%>&anitype=<%=anitype%>&mine=<%=mine%>"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
										<%
											} else {
										%>
										<li class="page-item" style="margin: auto;"><span
											class="page-link" aria-hidden="true">&raquo;</span></li>
										<%
											}
										%>
									</ul>
								</td>


							</tr>

							<c:if test="${id==null }">
								<tr align="right">
									<td colspan="6">
										<!-- member테이블과 합치는 것도 가능 카페 가입시 업데이트로 정보 수정 --> <span>
											게시판 글 작성은 회원만 가능합니다. 로그인 후 회원체크 하시길 바랍니다. </span> <input
										type="button" value="로그인"
										onclick="location.href='../member/login.jsp'">
									</td>
								</tr>
							</c:if>
							<c:if test="${nick==null && id!=null }">
								<tr align="right">
									<td colspan="6"><span>게시판 글 작성은 회원만 가능합니다. 글쓰기 버튼이
											보이지 않는다면 회원체크 버튼을 눌러주세요. </span> <input type="button" value="회원체크"
										onclick="location.href='cafe_idcheck.jsp'"></td>
								</tr>
							</c:if>
							<c:if test="${nick!=null }">
								<tr align="right">
									<td colspan="6"><input type="submit" value="글쓰기"></td>
								</tr>
							</c:if>
						</table>
					</form>
				</div>

			</div>
		</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="false" />
	</div>
</body>
</html>