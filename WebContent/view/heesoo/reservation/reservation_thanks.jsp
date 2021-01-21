<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="/view/img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="/view/img/favicon.ico" type="image/x-icon" />
<title>갈비대첩</title>
<%
	String rchk=request.getParameter("rchk");
	pageContext.setAttribute("rchk",rchk);
%>
<link rel="stylesheet" href="/view/css/heesoo_layout.css">
<link rel="stylesheet" href="/view/css/heesoo_reservation_thanks.css">
<script defer src="/core/jquery-3.5.1/jquery-3.5.1.min.js"></script>
<script defer src="/core/bootstrap-4.5.3/js/bootstrap.bundle.js"></script>
<script defer src="/view/js/reservation_write_cal.js"></script>
</head>
<body>
	<jsp:include page="/view/heesoo/top.jsp" flush="false" />
	<main>
	<div id="container">
		<c:if test="${rchk==0}">
			<div class="item">예약이 취소되었습니다.</div> 
		</c:if>
		<c:if test="${rchk==1}">
			<div class="item">예약해 주셔서 감사합니다.</div>
		</c:if>
		<c:if test="${rchk==2}">
			<div class="item">예약이 변경되었습니다.</div>
		</c:if>
		
		<button id="go_index" onclick="location.href='../main/index.jsp'">main으로</button>
	</div>
	</main>
	<jsp:include page="/view/heesoo/bottom.jsp" flush="false" />
	<a href="../../../index.jsp"><div id="home">
			홈페이지
		</div></a>
</body>
</html>