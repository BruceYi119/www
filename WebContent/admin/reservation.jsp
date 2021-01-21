<%@page import="www.html.header.Header"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="www.db.dao.ReservationDAO"%>
<%@page import="www.db.dto.ReservationDTO"%>
<%@page import="www.pagination.Pagination"%>
<%
request.setCharacterEncoding("utf-8");
int cpage = request.getParameter("cpage") != null ? Integer.parseInt(request.getParameter("cpage")) : 1;
int range = request.getParameter("range") != null ? Integer.parseInt(request.getParameter("range")) : 1;

Header h = new Header();
String css = h.getCss("admin");
String js = h.getJs("admin");

Pagination p = new Pagination();
ReservationDAO dao = new ReservationDAO();
ReservationDTO dto = new ReservationDTO();
StringBuilder sb = new StringBuilder();

//총 게시글 수 쿼리
sb.append("select count(*) total from reservation");

//총 게시글 수 가져오기
int listCnt = dao.count(sb.toString());

//페이징 정보 생성
p.setInfo(cpage, range, listCnt);

//페이징 정보 json string으로 저장
String pageInfo = p.getInfo();

//sb초기화
sb.setLength(0);

//list조회 쿼리
sb.append("select ");
sb.append(dto.toString(true));
sb.append(" from (select seq, tt.* from (select rownum seq, t.* from (select * from reservation order by rwritedate desc) t) tt where seq >= ?) where rownum <= ?");

//list조회
dao.selectAll(sb.toString(), Integer.toString(p.getStartList()), Integer.toString(p.getListSize()));

pageContext.setAttribute("list", dao.getList());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="/view/img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="/view/img/favicon.ico" type="image/x-icon" />
<title>관리자</title>
<%=css%>
<link rel="stylesheet" href="css/reservation.css">
<%=js%>
<script defer src="/admin/js/pagination.js"></script>
</head>
<body>
	<div id="wrap">
		<input type="hidden" id="active" value="3" />
		<input type="hidden" name="url" value="/admin/reservation.jsp" />
		<input type="hidden" name="page" value='<%=cpage%>' />
		<input type="hidden" name="listCnt" value='<%=listCnt%>' />
		<input type="hidden" name="info" value='<%=pageInfo%>' />
		<%@ include file="/admin/layout/header.jsp" %>
		<main>
			<div class="container-fluid">
				<div class="w3-white w3-padding notranslate fix mt-3"><h3>갈비대첩 예약정보</h3></div>
								<div class="w3-padding w3-white notranslate">
					<div class="table-responsive">
						<table class="table">
							<thead class="thead-dark">
								<tr>
									<th>키값</th>
									<th>예약현황</th>
									<th>예약일</th>
									<th>예약시간</th>
									<th>성함</th>
									<th>핸드폰번호</th>
									<th>성인</th>
									<th>아이(10세이하)</th>
									<th>매장식사/포장</th>
									<th>비고</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="dto">
								<tr>
									<td>${dto.rno}</td>
									<c:if test="${dto.rchk==0 }"><td><button type="button" class="btn btn-secondary btn-sm">예약 취소</button></td></c:if>
									<c:if test="${dto.rchk==1 }"><td><button type="button" class="btn btn-success btn-sm">예약</button></td></c:if>
									<c:if test="${dto.rchk==2 }"><td><button type="button" class="btn btn-warning btn-sm">예약 수정</button></td></c:if>
									<c:set var="rdate" value="${ dto.rdate} "/>
									<td>${fn:substring(rdate,0,10) }</td>
									<c:set var="rtime" value="${ dto.rtime} "/>
									<td>${fn:substring(rtime,0,2) } : ${fn:substring(rtime,2,4) }</td>
									<td>${dto.rname}</td>
									<td>${dto.rphone}</td>
									<td>${dto.radult_cnt}</td>
									<td>${dto.rchild_cnt}</td>
									<c:if test="${dto.reat=='s'}"><td>매장식사</td></c:if>
									<c:if test="${dto.reat=='p'}"><td>포장</td></c:if>
									<td>${dto.rbigo}</td>
									<td>${dto.rwritedate}</td>
								</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="11">
										<ul class="pagination justify-content-center" id="pageWrap">
											<!-- 페이징 영역 -->
										</ul>
									</td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</main>
	</div>
</body>
</html>