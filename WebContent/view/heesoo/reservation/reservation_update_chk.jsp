<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="www.db.dto.ReservationDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="/view/img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="/view/img/favicon.ico" type="image/x-icon" />
<title>갈비대첩</title>
<%
	String chk=request.getParameter("chk");
	pageContext.setAttribute("TimeBtn",ReservationDTO.getTimebtn());
	pageContext.setAttribute("chk",chk);
%>
<link rel="stylesheet" href="/view/css/heesoo_layout.css">
<link rel="stylesheet" href="/view/css/heesoo_reservation_update_layout.css">
<script defer src="/core/jquery-3.5.1/jquery-3.5.1.min.js"></script>
<script defer src="/core/bootstrap-4.5.3/js/bootstrap.bundle.js"></script>
<script defer src="/view/js/reservation_write_cal.js"></script>
</head>
<body>
	<jsp:include page="/view/heesoo/top.jsp" flush="false" />
	<main>
	<div id="submenu" class="item" >
		<button type="button" class="subitem" onclick="location.href='reservation_write_cal.jsp'">예약하기</button>
		<hr>
		<button type="button" class="subitem" onclick="location.href='reservation_update_chk.jsp'"> 예약수정 / 취소</button>
		<hr>
	</div>
	<section>
		<div class="item">
		<div id="title">
			<h2>예약수정 / 취소</h2>
		</div>
		<hr>
		<div id="container">
		<form method="post" action="reservation_update_chk_ok.jsp">
			<label for="rname"><b>성함<b/></label>
			<div id="rname"><input type="text" name="rname"></div>
			<label for="rphone"><b>핸드폰 번호<b/></label>
			<div id="rphone"><input type="text" name="rphone"></div>
			<c:if test="${chk==1 }">
				<div id="chk">예약정보가 없습니다.</div>
			</c:if>
			<div id="submit"><input type="submit" value="확인"></div>
		</form>
		</div>
	</section>
	</main>
	<jsp:include page="/view/heesoo/bottom.jsp" flush="false" />
	<a href="../../../index.jsp"><div id="home">
			홈페이지
		</div></a>
</body>
</html>