<%@page import="www.member.Member"%>
<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>  
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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title><%=title%></title>
<%=css%>
<link rel="stylesheet" href="/view/css/minkyu_board_write.css">
<%=js%>
<script defer src="/view/js/minkyu_board_write.js?ver=1"></script>
</head>
<body>
	<input type="hidden" id="color_class" value="minkyu" />
	<div id="wrap">
		<jsp:include page="<%=headerUrl%>" flush="true"/>
		<nav>
			<div class="base_wrap">
				<%=menu%>
			</div>
		</nav>
		<main>
			<div class="base_wrap">
				<h2>글 쓰기</h2>
				
<form method="post" action="board_write_ok.jsp" enctype="multipart/form-data" onsubmit="return main()" id="frm" name="frm">
	<table id="board">
		<tr>
			<td>카테고리</td>
			<td><select name="kind">
					<option value="수익자랑">수익자랑				
					<option value="노하우공유">노하우공유				
				</select>
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" onkeyup="aaa(this.form)">
			<span id="title"></span></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="name" value="${name}" readonly="readonly" onkeyup="aaa(this.form)"></td>
<%-- 			<td><input type="text" name="name" value="${name}" onkeyup="aaa(this.form)"> --%>
					<span id="name"></span></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<input type="radio" name="sung" value="남자">남자
				<input type="radio" name="sung" value="여자">여자
			</td>
	
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="9" cols="60" name="content"></textarea></td>
		</tr>
		<tr>
			<td>이미지</td>
			<td><input type="file" name="fname"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pwd" ></td>
		</tr>
		<tr>
			<td>비밀번호확인</td>
			<td><input type="password" name="pwd2" onkeyup="aaa(this.form)"><br/>
			<span id="pwc"></span></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="작성하기"></td>
		</tr>
		
	</table>
</form>
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="true"/>
	</div>
</body>
</html>