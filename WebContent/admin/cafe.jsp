<%@page import="www.db.dto.CmemberDTO"%>
<%@page import="www.db.dao.CmemberDAO"%>
<%@page import="www.pagination.Pagination"%>
<%@page import="www.html.header.Header"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
int cpage = request.getParameter("cpage") != null ? Integer.parseInt(request.getParameter("cpage")) : 1;
int range = request.getParameter("range") != null ? Integer.parseInt(request.getParameter("range")) : 1;

Header h = new Header();
String css = h.getCss("admin");
String js = h.getJs("admin");

Pagination p = new Pagination();
CmemberDAO dao = new CmemberDAO();
CmemberDTO dto = new CmemberDTO();
StringBuilder sb = new StringBuilder();

// 페이징 range설정
// p.setRangeSize(5);

// 총 게시글 수 쿼리
sb.append("select count(*) total from cmember");

// 총 게시글 수 가져오기
int listCnt = dao.count(sb.toString());

// 페이징 정보 생성
p.setInfo(cpage, range, listCnt);

// 페이징 정보 json string으로 저장
String pageInfo = p.getInfo();

// sb초기화
sb.setLength(0);

// list조회 쿼리
sb.append("select ");
sb.append(dto.toString(true));
sb.append(" from (select seq, tt.* from (select rownum seq, t.* from (select * from cmember order by subday desc) t) tt where seq >= ?) where rownum <= ?");

// list조회
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
<%=js%>
<script defer src="/admin/js/pagination.js"></script>
</head>
<body>
	<div id="wrap">
		<input type="hidden" id="active" value="4" />
		<input type="hidden" name="url" value="/admin/cafe.jsp" />
		<input type="hidden" name="page" value='<%=cpage%>' />
		<input type="hidden" name="listCnt" value='<%=listCnt%>' />
		<input type="hidden" name="info" value='<%=pageInfo%>' />
		<%@ include file="/admin/layout/header.jsp"%>
		<main>
			<div class="container-fluid">
				<div class="w3-white w3-padding notranslate fix mt-3">
					<h3>애완동물카페</h3>
				</div>
				<div class="w3-padding w3-white notranslate">
					<div class="table-responsive">
						<table class="table">
							<thead class="thead-dark">
								<tr>
									<th>키값</th>
									<th>아이디</th>
									<th>닉네임</th>
									<th>가입동기</th>
									<th>가입인사</th>
									<th>회원구분</th>
									<th>탈퇴여부</th>
									<th>가입일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="dto">
									<tr>
										<td>${dto.cmno}</td>
										<td>${dto.id}</td>
										<td>${dto.nick}</td>
										<td>${dto.reason}</td>
										<td>${dto.pobu}</td>
										<td>${dto.mtype}</td>
										<td>${dto.del_yn}</td>
										<td>${dto.subday}</td>
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