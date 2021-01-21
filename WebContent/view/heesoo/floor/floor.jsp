<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="/view/img/favicon.ico" type="image/x-icon" />
<link rel="icon" href="/view/img/favicon.ico" type="image/x-icon" />
<title>갈비대첩</title>
<link rel="stylesheet" href="/view/css/heesoo_layout.css">
<link rel="stylesheet" href="/view/css/heesoo_floor_layout.css">
<script defer src="/core/jquery-3.5.1/jquery-3.5.1.min.js"></script>
<script defer src="/core/bootstrap-4.5.3/js/bootstrap.bundle.js"></script>
<script defer src="/view/js/heesoo_menu.js"></script>
<script defer src="/view/js/jquery.backstretch.min.js"></script>
</head>
<body>
	<jsp:include page="/view/heesoo/top.jsp" flush="false" />
	<main>
	<div id="title">매장소개 </div>
		<img src="../img/lobi1.jpg" class = "f">
		<img src="../img/lobi4.jpg" class = "f"><br>
		<p class="detail">2층</p>
		<p >4인석 : 9개 / 6인석 4개 / 12인석 1개</p>
		<hr>
	<div id="container">
		<img src="../img/lobi5.jpg" class = "f f3">
		<div id="item">
			<p>3층 </p>
			<span>15인 이상 단체만 가능. 최대 60명</span>
		</div>
	</div>
	</main>
	<jsp:include page="/view/heesoo/bottom.jsp" flush="false" />
		<a href="../../../index.jsp"><div id="home">
			홈페이지
		</div></a>
</body>
</html>