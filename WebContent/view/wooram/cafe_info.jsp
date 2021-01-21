<%@page import="www.db.dto.CmemberDTO"%>
<%@page import="www.db.dao.CmemberDAO"%>
<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	//여기부터
	CmemberDAO cdao = new CmemberDAO();
	CmemberDTO cdto = new CmemberDTO();
	String sql = "";

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
<script defer src="/view/js/cafe_nav.js"></script>
</head>
<body>
	<input type="hidden" id="color_class" value="wooram" />
	<div id="wrap">
		<jsp:include page="<%=headerUrl%>" flush="true" />
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
					<h1 align="center">애완동물 카페</h1>
					<table align="center">
						<tr>
							<td><h3>소개</h3></td>
						</tr>
						<tr>
							<td><h5>
									반려동물이란 사람이 정서적으로 의지하기 위해 집에서 기르는 동물을 뜻하는 용어입니다.
									<p>동물이 장난감 같은 존재가 아니라 사람과 더불어 살아가는 반려자라는 인식이 확산되면서 반려동물이라고
										주로 불리고 있습니다.</p>
									저희 애완 동물 카페는 반려동물을 사랑하는 사람들끼리 정보 및 지식을 공유하며 소통하는 모임입니다.
									<p>정보공유를 위한 글은 상관 없으나, 과도한 영업목적이 홍보글은 카페 회원들의 불편을 사기때문에, 강퇴
										조치하고 있으니 자제 부탁드립니다. 감사합니다.</p>
								</h5></td>
						</tr>
						<tr>
							<td><h3>회원등급</h3></td>
						</tr>
						<tr>
							<td><h5>🥚 계란(신규회원) > 🐤 병아리(게시글 3개이상) 🐔 닭(게시글 10개이상)
									으로 나누어져 있으며, 기준요건 달성시 자동 등업됩니다.</h5></td>
						</tr>
						<tr align="center">
							<td><input type="button" value="확인"
								onclick="location.href='list.jsp'" /></td>
						</tr>
					</table>
					</form>
				</div>
			</div>
		</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="true" />
	</div>
</body>
</html>