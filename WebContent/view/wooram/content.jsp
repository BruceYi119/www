<%@page import="www.db.dto.CmemberDTO"%>
<%@page import="www.db.dao.CmemberDAO"%>
<%@page import="www.db.dto.CafeDTO"%>
<%@page import="www.db.dto.CdatDTO"%>
<%@page import="www.db.dao.CdatDAO"%>
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

	//request 값
	String cno = request.getParameter("cno");
	CafeDAO dao = new CafeDAO();
	CdatDAO datDao = new CdatDAO();

	String sql = "select * from cafe t where cno = ?";//메인쿼리
	dao.select(sql, cno);

	String sql2 = "select * from cdat where cno=? order by cdno desc";//댓글쿼리
	datDao.selectAll(sql2, cno);

	String wname = dao.getDto().getName();
	request.setAttribute("wname", wname);

	//여기부터
	CmemberDAO cdao = new CmemberDAO();
	CmemberDTO cdto = new CmemberDTO();

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
<link rel="stylesheet" href="/view/css/cafe_content.css">
<link rel="stylesheet" href="/view/css/cafe_nav.css">
<%=js%>
<script defer src="/view/js/cafe_content.js"></script>
<script defer src="/view/js/cafe_nav.js"></script>
</head>
<body>
	<input type="hidden" id="color_class" value="wooram" />
	<div id="wrap">
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
					<input type="hidden" name="cno" id="cno"
						value="<%=dao.getDto().getCno()%>" /> <input type="hidden"
						name="mtype" value="${cdto.mtype}">
					<table align="center">
						<tr>
							<td width="70">카테고리</td>
							<td colspan="3" width="200"><%=dao.getDto().getWritype()%>(<%=dao.getDto().getAnimal()%>)</td>
							<td width="150">작성자</td>
							<td width="90" align="center">조회수</td>
							<td width="90" align="center">좋아요</td>
						</tr>
						<tr>
							<td>제목</td>
							<td colspan="3"><%=dao.getDto().getTitle()%></td>
							<td><%=dao.getDto().getName()%></td>
							<td align="center"><%=dao.getDto().getReadnum()%></td>
							<td align="center"><span id="likeCnt"><%=dao.getDto().getLiked()%></span></td>
						</tr>
						<%
							String fname = dao.getDto().getFname();
							request.setAttribute("fname", fname);
						%>
						<c:if test="${fname!=null }">
							<tr height="300">
								<td colspan="4"><%=dao.getDto().getContent()%></td>
								<td colspan="3"><img
									src="/upload/img/<%=dao.getDto().getFname()%>" width="350"
									height="250" /></td>
							</tr>
						</c:if>
						<c:if test="${fname==null }">
							<tr height="300">
								<td colspan="7"><%=dao.getDto().getContent()%></td>
							</tr>
						</c:if>
						<tr>
							<td colspan="3">댓글달기</td>
							<c:if test="${nick==wname }">
								<td colspan="4" align="right"><a
									href="update.jsp?cno=<%=dao.getDto().getCno()%>">수정</a> <a
									href="delete.jsp?cno=<%=dao.getDto().getCno()%>&name=<%=dao.getDto().getName()%>&mtype=${cdto.mtype}">삭제</a>
									<a href="list.jsp">목록</a>
									<button id="liked" name="liked"
										onclick="overClick(<%=dao.getDto().getCno()%>)">추천하기👍</button>
								</td>
							</c:if>
							<c:if test="${nick!=wname && cdto.mtype == 'a' }">
								<td colspan="4" align="right"><a
									href="delete.jsp?cno=<%=dao.getDto().getCno()%>&name=<%=dao.getDto().getName()%>&mtype=${cdto.mtype}">삭제</a>
									<a href="list.jsp">목록</a>
									<button id="liked" name="liked"
										onclick="overClick(<%=dao.getDto().getCno()%>)">추천하기👍</button>
								</td>
							</c:if>
							<c:if test="${nick!=wname && cdto.mtype == 'n' }">
								<td colspan="4" align="right"><a href="list.jsp">목록</a>
									<button id="liked" name="liked"
										onclick="overClick(<%=dao.getDto().getCno()%>)">추천하기👍</button></td>
							</c:if>
						</tr>
					</table>

					<form id="dat_up" name="up" method="post"
						action="dat_update_ok.jsp">
						<input type="hidden" name="cno" value="<%=cno%>">
						<!-- gesipan테이블의 id -->
						<input type="hidden" name="cdno">
						<table align="center" border="1">
							<tr>
								<td width="61%"><input type="text" name="dcontent"
									placeholder="댓글 내용" id="dcontent"
									style="width: 600px; height: 50px; resize: none; border: 0px;">
									<a href="content.jsp?cno=<%=cno%>" id="cancle"
									style="color: red; font-size: 9px;">취소</a></td>
								<td width="17%"><input type="text" name="dname" id="dname"
									value="${dname }" style="border: 0px;" readonly="readonly"></td>
								<td width="22%"><input type="submit" value="댓글수정"></td>
							</tr>
						</table>
					</form>

					<form name="dat_write" id="dat_write" method="post"
						action="dat_write_ok.jsp">
						<input type="hidden" name="cno" value="<%=cno%>"> <input
							type="hidden" name="mtype" value="${cdto.mtype}">
						<table align="center" border="1">
							<c:if test="${nick!=null }">
								<tr>
									<td colspan="4" width="61%"><textarea name="dcontent"
											placeholder="댓글내용"
											style="width: 600px; height: 50px; resize: none; border: 0px;"></textarea></td>
									<td width="17%"><input type="text" name="dname"
										style="border: 0px;" value="${nick }" readonly="readonly"></td>
									<td width="22%" colspan="2"><input type="submit"
										value="댓글저장"></td>
								</tr>
							</c:if>
							<tr>
								<td colspan="4">댓글내용</td>
								<td>작성자</td>
								<td colspan="2">작성일</td>
							</tr>
							<%
								//레코드 출력
								for (CdatDTO dto : datDao.getList()) { // 하나의 tr에 하나의 레코드가 출력
									String dname = dto.getDname();
									request.setAttribute("dname", dname);
							%>
							<tr>
								<td colspan="4" width="420"><%=dto.getDcontent()%></td>
								<!-- 내용  -->
								<td width="100"><%=dto.getDname()%></td>
								<!-- 작성자 -->
								<td colspan="2" width="180"><%=dto.getWriteday()%> <c:if
										test="${ nick==dname }">
										<a
											href="update(<%=dto.getCdno()%>,'<%=dto.getDname()%>','<%=dto.getDcontent()%>')">수정
										</a>
										<a
											href="dat_delete.jsp?cdno=<%=dto.getCdno()%>&dname=<%=dto.getDname()%>&cno=<%=cno%>">
											삭제 </a></td>
								</c:if>
								<c:if test="${nick!=dname && cdto.mtype == 'a' }">
									<a
										href="dat_delete.jsp?cdno=<%=dto.getCdno()%>&dname=<%=dto.getDname()%>&cno=<%=cno%>">
										삭제 </a>
									</td>
								</c:if>
								<!-- 작성일 -->
							</tr>
							<%
								}
							%>
						</table>
					</form>


					<!-- 댓글의 삭제폼 => 삭제하고자 하는 cdat테이블의 cdno,dpwd -->
					<form id="dat_del" name="del" method="post" action="dat_delete.jsp">
						<input type="hidden" name="cno" value="<%=cno%>" />
						<!-- 게시판테이블의 id -->
						<input type="hidden" name="cdno" />
						<!-- 댓글의 id -->
						<input type="hidden" name="dname" value="${dname }" /> <input
							type="submit" value="댓글삭제">
					</form>
				</div>
			</div>
		</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="false" />
	</div>
</body>
</html>

