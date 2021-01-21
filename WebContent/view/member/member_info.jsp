<%@page import="www.db.dto.MemberDTO"%>
<%@page import="www.member.Member"%>
<%@page import="www.db.dao.MemberDAO"%>
<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Member m = new Member();
boolean login = m.isLogin(session);

if (!login)
	response.sendRedirect("/view/member/login.jsp");

Header header = new Header();
String css = header.getCss();
String js = header.getJs();
String title = header.getTitle();
String headerUrl = header.getHeaderUrl();

Nav nav = new Nav();
String menu = nav.getMenu();

Footer footer = new Footer();
String footerUrl = footer.getFooterUrl();

MemberDAO dao = new MemberDAO();
String sql = "select rownum, t.* from member t where id = ?";
String id = session.getAttribute("id") != null ? session.getAttribute("id").toString() : "";
dao.select(sql, id);

pageContext.setAttribute("dto", dao.getDto());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="/view/img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="/view/img/favicon.ico" type="image/x-icon" />
<title><%=title%></title>
<%=css%>
<link rel="stylesheet" href="/view/css/member.css">
<%=js%>
<script defer type="text/javascript" src="/view/js/member_info.js"></script>
</head>
<body>
	<div id="wrap">
		<jsp:include page="<%=headerUrl%>" flush="false"/>
		<nav>
			<div class="base_wrap">
				<%=menu%>
			</div>
		</nav>
		<main>
			<div class="base_wrap">
				<form action="/view/member/update_member.jsp" method="post" enctype="multipart/form-data">
					<input type="hidden" name="mno" value="${dto.mno}" />
					<input type="hidden" name="id" value="${dto.id}" />
					<input type="hidden" name="name" value="${dto.name}" />
					<input type="hidden" name="phone" value="${dto.phone}" />
					<input type="hidden" name="birth" value="${dto.birth}" />
					<input type="hidden" name="zipcode" value="${dto.zipcode}" />
					<input type="hidden" name="addr" value="${dto.addr}" />
					<input type="hidden" name="addr_detail" value="${dto.addr_detail}" />
					<input type="hidden" name="email" value="${dto.email}" />
				</form>
				<table class="memberInfo">
					<tr><th colspan="2">회원정보</th></tr>
					<tr>
						<th>아이디</th>
						<td>${dto.id}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
							<span id="infoName">${dto.name}</span>
							<span class="errMsg"></span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="text" id="updateName" class="hide" />
							<button type="button" class="btn btn-success" id="infoUpdateBtn">회원정보수정</button>
							<button type="button" class="btn btn-danger hide" id="infoUpdateCancelBtn">취소</button>
						</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>
							<span id="infoPhone">${dto.phone}</span>
							<span class="errMsg"></span>
							<input type="text" id="updatePhone" class="hide" />
						</td>
					</tr>
					<tr>
						<th>생일</th>
						<td>
							<span id="infoBirth">${dto.birth}</span>
							<span class="errMsg"></span>
							<input type="text" id="updateBirth" class="hide" />
						</td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td>
							<span id="zipcode">${dto.zipcode}</span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-info" id="searAddrBtn">주소검색</button>
							<button type="button" class="btn btn-success hide" id="addrUpdateBtn">수정</button>
							<button type="button" class="btn btn-danger hide" id="addrUpdateCancel">취소</button>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td><span id="addr">${dto.addr}</span></td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td>
							<span id="addr_detail">${dto.addr_detail}</span>
							<span class="errMsg"></span>
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<span id="infoEmail">${dto.email}</span>
							<span class="errMsg"></span>
							<input type="text" id="updateEmail" class="hide" />
						</td>
					</tr>
					<tr>
						<th>가입일</th>
						<td>${dto.writedate}</td>
					</tr>
				</table>
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="false"/>
	</div>
</body>
</html>