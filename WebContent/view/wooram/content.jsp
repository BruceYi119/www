<%@page import="www.db.dto.CafeDTO"%>
<%@page import="www.db.dto.CdatDTO"%>
<%@page import="www.db.dao.CdatDAO"%>
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

//request 값
String cno = request.getParameter("cno");
CafeDAO dao = new CafeDAO();
CdatDAO datDao = new CdatDAO();

String sql = "select * from cafe t where cno = ?";//메인쿼리
dao.select(sql, cno);

String sql2 = "select * from cdat where cno=? order by cdno desc";//댓글쿼리
datDao.selectAll(sql2, cno);
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
td {
	border: 1px solid #cccccc;
}

#del {
	position: absolute;
	visibility: hidden;
	margin-top: -12px;
	margin-left: 8px;
}

#dat_del, #dat_up {
	position: absolute;
	visibility: hidden;
}

#dchk, #chk {
	color: red;
}
</style>
<%=js%>
<script defer="" src="/view/js/cafe_content.js"></script>
</head>
<body>
<input type="hidden" id="color_class" value="wooram" />
	<div id="wrap">
		<jsp:include page="<%=headerUrl%>" flush="false"/>
		<nav>
			<div class="base_wrap">
				<%=menu%>
			</div>
		</nav>
		<main>
			<div class="base_wrap">
				<table width="800" align="center" border="1">
					<input type="hidden" name="cno" id="cno" value="<%=dao.getDto().getCno()%>">
					<tr>
						<td width="70">카테고리</td>
						<td colspan="3" width="200"><%=dao.getDto().getWritype()%>(<%=dao.getDto().getAnimal()%>)</td>
						<td width="150">작성자</td>
						<td width="90">조회수</td>
						<td width="90">좋아요</td>
					</tr>
					<tr>
						<td>제목</td>
						<td colspan="3"><%=dao.getDto().getTitle()%></td>
						<td><%=dao.getDto().getName()%></td>
						<td><%=dao.getDto().getReadnum()%></td>
						<td><span id="likeCnt"><%=dao.getDto().getLiked()%></span></td>
					</tr>
					<tr height="300">
						<td colspan="7"><%=dao.getDto().getContent()%><p>
								<img src="/filepath/<%=dao.getDto().getFname()%>" width="250" height="150" /></td>
					</tr>
					<tr>
						<td>댓글수</td>
						<td colspan="3"></td>
						<td colspan="2" align="right">
							<form method="post" action="delete.jsp" id="del">
								<input type="hidden" name="cno" value="<%=cno%>"> 비번<input
									type="password" name="pwd" size="5"> <input type="submit"
									value="삭제">
							</form> <a href="update.jsp?cno=<%=dao.getDto().getCno()%>">수정</a> <a href="#"
							onclick="view_del()">삭제</a> <a href="list.jsp">목록</a>
						</td>
						<td>
							<button id="liked" name="liked"
								onclick="overClick(<%=dao.getDto().getCno()%>)">추천하기👍</button>
			
						</td>
					</tr>
					<%
						if (request.getParameter("chk") != null) {
					%>
					<tr id="chk">
						<td colspan="7" align="center">비밀번호가 틀렸습니다. 수정 및 삭제가 불가능 합니다.</td>
					</tr>
					<%
						}
					%>
				</table>
			
				<form id="dat_up" name="up" method="post" action="dat_update_ok.jsp">
					<input type="hidden" name="cno" value="<%=cno%>">
					<!-- gesipan테이블의 id -->
					<input type="hidden" name="cdno" >
					<table width="800" align="center" border="1">
						<tr>
							<td colspan="4" width="420"><input type="text" name="dcontent"
								size="52" placeholder="댓글 내용" id="dcontent"></td>
							<td width="150"><input type="text" name="dname"
								placeholder="작성자" id="dname"></td>
							<td width="150"><input type="text" name="dpwd"
								placeholder="비밀번호"></td>
							<td width="70"><input type="submit" value="댓글수정"></td>
						</tr>
					</table>
				</form>
			
				<form name="datwrite" id="datwrite" method="post"
					action="dat_write_ok.jsp">
					<input type="hidden" name="cno" value="<%=cno%>">
					<table width="800" align="center" border="1">
						<%
							if (request.getParameter("dchk") != null) {
						%>
						<tr id="dchk">
							<td colspan="7" align="center">비밀번호가 틀렸습니다. 수정 및 삭제가 불가능 합니다.</td>
						</tr>
						<%
							}
						%>
						<tr>
							<td colspan="4" width="420"><textarea rows="1" cols="48"
									name="dcontent" placeholder="내용"></textarea></td>
							<td width="100"><input type="text" name="dname"
								placeholder="작성자"></td>
							<td width="100"><input type="text" name="dpwd"
								placeholder="비밀번호"></td>
							<td width="80"><input type="submit" value="댓글저장"></td>
						</tr>
						<tr>
							<td colspan="4">댓글내용</td>
							<td>작성자</td>
							<td colspan="2">작성일</td>
						</tr>
						<%
						//레코드 출력
						for (CdatDTO dto : datDao.getList()) { // 하나의 tr에 하나의 레코드가 출력
						%>
						<tr>
							<td colspan="4" width="420"><%=dto.getDcontent()%></td>
							<!-- 내용  -->
							<td width="100"><%=dto.getDname()%></td>
							<!-- 작성자 -->
							<td colspan="2" width="180"><%=dto.getWriteday()%><a
								href="#"
								onclick="update(<%=dto.getCdno()%>,'<%=dto.getDname()%>','<%=dto.getDcontent()%>')">
									수정 </a><a href="#" onclick="ddel(<%=dto.getCdno()%>)"> 삭제
							</a></td>
							<!-- 작성일 -->
						</tr>
						<%
							}
						%>
					</table>
				</form>
			
			
				<!-- 댓글의 삭제폼 => 삭제하고자 하는 cdat테이블의 cdno,dpwd -->
				<form id="dat_del" name="del" method="post" action="dat_delete.jsp">
					<input type="hidden" name="cno" value="<%=cno%>">
					<!-- 게시판테이블의 id -->
					<input type="hidden" name="cdno">
					<!-- 댓글의 id -->
					<input type="text" name="dpwd" size="5" placeholder="비밀번호"> <input
						type="submit" value="댓글삭제">
				</form>
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="false"/>
	</div>
</body>
</html>

