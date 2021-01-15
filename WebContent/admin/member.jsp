<%@page import="www.db.dto.MemberDTO"%>
<%@page import="www.Pagination"%>
<%@page import="www.db.dao.MemberDAO"%>
<%@page import="www.html.header.Header"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int cpage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

Header h = new Header();
String css = h.getCss("admin");
String js = h.getJs("admin");

Pagination p = null;
MemberDAO dao = new MemberDAO();
MemberDTO dto = new MemberDTO();
StringBuilder sb = new StringBuilder();

// 총 게시글 수 쿼리
sb.append("select count(*) total from member");

// 총 게시글 수 가져오기
int total = dao.count(sb.toString());
p = new Pagination(total);

// sb초기화
sb.setLength(0);

// list조회 쿼리
sb.append("select ");
sb.append(dto.toString(true));
sb.append(" from (select seq, tt.* from (select rownum seq, t.* from (select * from member order by writedate desc) t) tt where seq >= ?) where rownum <= ?");

// list조회
dao.selectAll(sb.toString(), p.getStartIndex() + "", p.getPageSize() + "");

pageContext.setAttribute("list", dao.getList());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
<%=css%>
<%=js%>
</head>
<body>
	<div id="wrap">
		<input type="hidden" id="active" value="2" />
		<%@ include file="/admin/layout/header.jsp" %>
		<main>
			<input type="hidden" name="page" value="<%=cpage%>" />
			<input type="hidden" name="url" value="/admin/member.jsp" />
			<div class="container-fluid">
				<div class="w3-white w3-padding notranslate fix mt-3"><h3>회원정보</h3></div>
				<div class="w3-padding w3-white notranslate">
					<div class="table-responsive">
						<table class="table">
							<thead class="thead-dark">
								<tr>
									<th>키값</th>
									<th>아이디</th>
									<th>핸드폰</th>
									<th>생일</th>
									<th>우편번호</th>
									<th>주소</th>
									<th>상세주소</th>
									<th>이메일</th>
									<th>회원구분</th>
									<th>탈퇴여부</th>
									<th>가입일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="dto">
								<tr>
									<td>${dto.mno}</td>
									<td>${dto.id}</td>
									<td>${dto.phone}</td>
									<td>${dto.birth}</td>
									<td>${dto.zipcode}</td>
									<td>${dto.addr}</td>
									<td>${dto.addr_detail}</td>
									<td>${dto.email}</td>
									<td>${dto.mtype}</td>
									<td>${dto.del_yn}</td>
									<td>${dto.writedate}</td>
								</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="11">
										<ul class="pagination justify-content-center" id="pageWrap">
											<li class="page-item disabled"><a class="page-link" href="#">Prev</a></li>
											<li class="page-item"><a class="page-link" href="#">1</a></li>
											<li class="page-item"><a class="page-link" href="#">2</a></li>
											<li class="page-item"><a class="page-link" href="#">3</a></li>
											<li class="page-item"><a class="page-link" href="#">Next</a></li>
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