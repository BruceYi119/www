<%@page import="www.db.dao.StockBoardDAO"%>
<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
<%-- <%@ include file="/include/top.jsp" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
String sbno = request.getParameter("sbno");
StockBoardDAO dao = new StockBoardDAO();
String sql = "select * from stockboard where sbno="+sbno;
dao.select(sql);
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
<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
<script type="text/javascript">

function main(){
		frm=document.frm;
		if(frm.pwd.value!=frm.pwd2.value){
			alert("비밀번호가 다릅니다");
			return false;
		}
	}

function aaa(my) {
	if(my.pwd.value !=my.pwd2.value){
		document.getElementById("pwc").innerText="비번이 틀립니다";
		document.getElementById("pwc").style.color="blue";
	}else{
		document.getElementById("pwc").innerText="비번이 일치합니다";
		document.getElementById("pwc").style.color="red";
	}
}
$(document).ready(function init() {
document.frm.sung.value="<%=dao.getDto().getSung()%>"
document.frm.kind.value="<%=dao.getDto().getKind()%>"
});
</script>

<%=css%>
<link rel="stylesheet" href="/view/css/minkyu_board_update.css">
<%=js%>
<!-- <script defer src="/view/js/minkyu_board_update.js"></script> -->
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
				<h2>작성글 수정하기</h2>
<form method="post" action="board_update_ok.jsp" enctype="multipart/form-data" onsubmit="return main()" name="frm">
	<input type="hidden" name="sbno" value="<%=sbno %>">
	<table id="board">
		<tr>
			<td>카테고리</td>
			<td><select name="kind" id="kindSelect">
					<option value="수익자랑">수익자랑				
					<option value="노하우공유">노하우공유			
				</select>
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" value="<%=dao.getDto().getTitle()%>"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="name" value="<%=dao.getDto().getName()%>"></td>
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
			<td><textarea rows="9" cols="60" name="content"><%=dao.getDto().getContent()%></textarea></td>
		</tr>
		<tr>
			<td>이미지</td>
			<td><input type="file" name="fname"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pwd" >
			<%
			if(request.getParameter("chk") != null){
			%>
           <span id="fail">비번이 틀렸습니다</span></td>
			<%
			}
			%>
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