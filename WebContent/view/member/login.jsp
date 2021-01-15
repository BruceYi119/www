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
<script defer type="text/javascript" src="/view/js/login.js"></script>
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
				<form action="/view/member/login_ok.jsp">
					<fieldset>
						<legend>로그인</legend>
						<div class="field">관리자 로그인 <input type="checkbox" name="admin" /></div>
						<div class="field"><input type="text" name="id" class="login" maxlength="12" /></div>
						<div class="field" id="errId"></div>
						<div class="field"><input type="password" name="pw" class="login" maxlength="12" /></div>
						<div class="field" id="errMsg"><%=loginErr%></div>
						<div class="field"><input type="submit" value="로그인" title="로그인" alt="로그인" class="login" /></div>
					</fieldset>
				</form>
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="false"/>
	</div>
</body>
</html>