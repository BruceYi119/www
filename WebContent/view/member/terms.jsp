<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
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
<script defer type="text/javascript" src="/view/js/terms.js"></script>
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
				<form action="/view/member/join.jsp">
					<div class="title"><h1><a href="/"><%=title%></a></h1></div>
					<fieldset class="terms">
						<legend>약관</legend>
						<div class="field mb10 tal"><input type="checkbox" name="terms" /> 약관1에 동의(필수)</div>
						<div class="terms">
							- 약관1 -<br/>
							약관내용1<br/>
							약관내용2<br/>
							약관내용3<br/>
							약관내용4<br/>
							약관내용5<br/>
							약관내용6<br/>
							약관내용7<br/>
							약관내용8<br/>
							약관내용9
						</div>
						<div class="field mb10 mt10 tal"><input type="checkbox" name="terms" /> 약관2에 동의(필수)</div>
						<div class="terms mb10">
							- 약관1 -<br/>
							약관내용1<br/>
							약관내용2<br/>
							약관내용3<br/>
							약관내용4<br/>
							약관내용5<br/>
							약관내용6<br/>
							약관내용7<br/>
							약관내용8<br/>
							약관내용9
						</div>
						<div class="field mb10 mt10 tal"><input type="checkbox" name="terms" /> 약관3에 동의</div>
						<div class="terms mb10">
							- 약관1 -<br/>
							약관내용1<br/>
							약관내용2<br/>
							약관내용3<br/>
							약관내용4<br/>
							약관내용5<br/>
							약관내용6<br/>
							약관내용7<br/>
							약관내용8<br/>
							약관내용9
						</div>
						<div class="field mt5 mb5" id="errMsg"></div>
						<div class="field">
							<a href="/"><input type="button" value="취소" title="취소" alt="취소" class="termsBtn mr5" /></a>
							<input type="submit" value="확인" title="확인" alt="확인" class="termsBtn" id="temsBtn" />
						</div>
					</fieldset>
				</form>
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="false"/>
	</div>
</body>
</html>