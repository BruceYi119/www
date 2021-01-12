<%@page import="www.db.dao.CafeDAO"%>
<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
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

CafeDAO dao = new CafeDAO();

//request값 불러오기
String cno = request.getParameter("cno");

String sql = "select * from cafe where cno = ?";
dao.select(sql, cno);
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
<style type="text/css">
#btn {
	width: 150px;
	height: 40px;
	border: 1px solid #f15657;
	background: #f15657;
	color: white;
}

td {
	border: 1px solid #cccccc;
}

#ck {
	color: red;
}
</style>
<%=js%>
<script defer src="/view/js/cafe_update.js"></script>
</head>
<body>
	<input type="hidden" id="color_class" value="wooram" />
	<input type="hidden" name="animalv" value="<%=dao.getDto().getAnimal()%>" />
	<input type="hidden" name="writypev" value="<%=dao.getDto().getWritype()%>" />
	<input type="hidden" name="fnamev" value="<%=dao.getDto().getFname()%>" />
	<div id="wrap">
		<jsp:include page="<%=headerUrl%>" flush="true" />
		<nav>
			<div class="base_wrap">
				<%=menu%>
			</div>
		</nav>
		<main>
		<div class="base_wrap">
			<form method="post" name="frm" action="update_ok.jsp"
				enctype="multipart/form-data">
				<input type="hidden" name="cno" value="<%=cno%>"> <input
					type="hidden" name="fimsi" value="<%=dao.getDto().getFimsi()%>">
				<table width="600" align="center">
					<tr>
						<td>글종류</td>
						<td><select id="writype" name="writype">
								<option value="">--선택하기--</option>
								<option value="애완동물 소개">애완동물 소개</option>
								<option value="정보와지식 공유">정보와지식 공유</option>
						</select></td>
					</tr>
					<tr>
						<td>애완동물 종류</td>
						<td><select id="animal" name="animal">
								<option value="">--선택하기--</option>
								<option value="강아지">강아지</option>
								<option value="고양이">고양이</option>
								<option value="기타">기타</option>
						</select>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title"
							value="<%=dao.getDto().getTitle()%>"></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="name"
							value="<%=dao.getDto().getName()%>"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pwd"></td>
					</tr>
					<%
						if (request.getParameter("chk") != null) {
					%>
					<tr>
						<td colspan="2" align="center" id="ck">비밀번호를 확인해주세요</td>
					</tr>
					<%
						}
					%>
					<tr>
						<td>사진</td>
						<td><input type="file" name="fname">
							<img src="/filepath/<%=dao.getDto().getFname()%>" width="250" height="150" /></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea cols="50" rows="5" name="content"><%=dao.getDto().getContent()%></textarea></td>
					</tr>
					<tr align="center">
						<td colspan="2"><button id="btn">수정하기</button></td>
				</table>
				</form>
		</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="true" />
	</div>
</body>
</html>