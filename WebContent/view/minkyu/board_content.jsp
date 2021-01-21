<%@page import="www.db.dto.StockBoarddatDTO"%>
<%@page import="www.db.dao.StockBoarddatDAO"%>
<%@page import="www.db.dao.StockBoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page import="www.html.footer.Footer"%>
<%-- <%@ include file="/include/top.jsp" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
   <% 

	String sbno = request.getParameter("sbno");
	StockBoardDAO dao = new StockBoardDAO();
	String sql = "select * from stockboard where sbno="+sbno;
	pageContext.setAttribute("sbno",sbno);
	dao.select(sql);
	pageContext.setAttribute("dto", dao.getDto());
	%>
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
<link rel="stylesheet" href="/view/css/minkyu_board_content.css">
<%=js%>
<script defer src="/view/js/minkyu_board_content.js?ver=1"></script>
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
				<table  id="board">
				<tr>	
					<td id="title" colspan="12">[${dto.kind}]
									${dto.title}</td>
				</tr>
				<tr>
					<td id="name" colspan="12">작성자
					${dto.name}&nbsp;&nbsp;&nbsp;
					날짜&nbsp;${dto.writeday}&nbsp;
					조회&nbsp;${dto.readnum}&nbsp;
					<span id="good">공감&nbsp;${dto.good}&nbsp;</span>
					<span id="bad">비공감&nbsp;${dto.bad}&nbsp;</span>
					성별&nbsp;${dto.sung}&nbsp;
				</tr>
				<tr>
					<td id="content" colspan="12">${dto.content}
					<img src="/filepath/${dto.fname}" width="550" height="400"></td>
				</tr>
				<tr>
					<td id="goodbtn" colspan="12">
					<button onclick="goodbutton();">공감</button>
					<button onclick="badbutton();">비공감</button>
					<button onclick='window.open("kakaolink.jsp","카카오톡 공유하기","width=300, height=300")'><img src="img/kakao.png" width="30" height="30"></button>
					
<%-- 					onclick='window.open("API3.jsp?code=${cdto.code}","기업정보","width=470, height=250")' --%>
					</td>
				</tr>
				</table>
				<div id="container">
				<form name="dat" method="post" action="dat_write_ok.jsp" onsubmit="return check(this)" name="frm">
				<input type="hidden" name="sbno" value="${sbno}">
				<br>
				<input id="datname" type="text" name="name" style="height:30px" value="${name}" readonly="readonly"></br>
<%-- 				<input id="datname" type="text" name="name" style="height:30px" value="${name}" ></br> --%>
				<textarea id="datcontent" rows="4" cols="50" name="content" placeholder="내용과 무관한 내용은 삭제 될 수 있습니다."></textarea></br>
				<input id="datsubmit" type="submit" value="등록">
    			</form>
				</div>
				<div id="boarddat">
				<table id="datboard">
					<%	
						StockBoarddatDAO ddao = new StockBoarddatDAO();
						String sql1 = "select * from stockboarddat where sbno="+sbno+" order by sbdno desc";
						ddao.selectAll(sql1);
						ArrayList<StockBoarddatDTO> list = ddao.getList();
						pageContext.setAttribute("list", list);
						
					%>
						<c:forEach items="${list}" var="ddto">
						<tr>
							<td id="datboardname" colspan="12">작성자&nbsp;&nbsp;${ddto.name}&nbsp;&nbsp;
							작성일&nbsp;&nbsp;${ddto.writeday}
							
						</tr>
						<tr>
							<td id="datboardcontent">${ddto.content}
							<form method="post" action="dat_delete.jsp">
							<td id="datdelbtn"><input type="submit" value="댓글삭제">	</td>
							<input type="hidden" name="sbno" value="${sbno}">
							<input type="hidden" name="sbdno" value="${ddto.sbdno}">
							</td>
							</tr>
							</form>
						</c:forEach>
				  <tr>
				  <td colspan="3" align="center" class="td1">
				  <input type="button" value="목록" onclick="list1();" class="btn1">
				  <input type="button" value="수정" onclick="update1()" class="btn1">
				  <input type="button" value="삭제" onclick="view_del();" class="btn1">
					<%
					if(request.getParameter("chk") != null){
					%>
		          	<script type="text/javascript">
		          	alert("비밀번호가 틀렸습니다");
		          	</script>
					<%
					}
// 					crud.conn_close();
					%>
				  </td>
				</tr>
					</table>
					 <form action="board_delete.jsp" method="post" id="del">
    				  <input type="hidden" name="sbno" value="${sbno}">
		     		 비밀번호<input type="password" name="pwd" size="4">
		     		 <input type="submit" value="삭제">
  				 	</form>
				</div>
				</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="true"/>
	</div>
</body>
</html>