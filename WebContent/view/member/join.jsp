<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String loginErr = request.getParameter("login") != null && request.getParameter("login").equals("false") ? "아이디 또는 비밀번호를 확인하세요" : "";

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
<link rel="shortcut icon" href="/view/img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="/view/img/favicon.ico" type="image/x-icon" />
<title><%=title%></title>
<%=css%>
<link rel="stylesheet" href="/view/css/member.css">
<%=js%>
<script defer type="text/javascript" src="/view/js/join.js"></script>
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
				<div class="title"><h1><a href="/"><%=title%></a></h1></div>
				<form action="/view/member/join_ok.jsp">
					<fieldset class="join">
						<legend>회원가입</legend>
						<h3><label for="id">아이디</label></h3>
						<div class="field"><input type="text" name="id" maxlength="12" placeholder="아이디" class="input" /></div>
						<div class="field errMsg"></div>
						<h3><label for="pw">비밀번호</label></h3>
						<div class="field"><input type="password" name="pw" maxlength="12" placeholder="비밀번호" class="input" /></div>
						<div class="field errMsg"></div>
						<h3><label for="pw2">비밀번호 확인</label></h3>
						<div class="field"><input type="password" name="pw2" maxlength="12" placeholder="비밀번호확인" class="input" /></div>
						<div class="field errMsg"></div>
						<h3><label for="name">이름</label></h3>
						<div class="field"><input type="text" name="name" placeholder="이름" class="input" /></div>
						<div class="field errMsg"></div>
						<h3><label for="phone">연락처</label></h3>
						<div class="field"><input type="text" name="phone" placeholder="연락처" class="input" /></div>
						<div class="field errMsg"></div>
						<h3><label for="birth">생년월일</label></h3>
						<div class="field"><input type="text" name="birth" placeholder="생년월일 2021-01-01" class="input" /></div>
						<div class="field errMsg"></div>
						<h3><label for="zipcode">우편번호</label> <button type="button" class="btn btn-info" id="searAddrBtn">주소검색</button></h3>
						<div class="field"><input type="text" name="zipcode" placeholder="우편번호" class="input" disabled="disabled" /></div>
						<div class="field errMsg"></div>
						<h3><label for="addr">주소</label></h3>
						<div class="field"><input type="text" name="addr" placeholder="주소" class="input" disabled="disabled" /></div>
						<div class="field errMsg"></div>
						<h3><label for="addr_detail">상세주소</label></h3>
						<div class="field"><input type="text" name="addr_detail" placeholder="상세주소" class="input" disabled="disabled" /></div>
						<div class="field errMsg"></div>
						<h3><label for="email">이메일</label></h3>
						<div class="field"><input type="text" name="email" placeholder="이메일" class="input" /></div>
						<div class="field errMsg"></div>
						<div class="field mt20"><input type="submit" value="가입하기" title="가입하기" alt="가입하기" /></div>
					</fieldset>
				</form>
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="false"/>
	</div>
</body>
</html>