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
<link rel="stylesheet" href="/view/css/heesoo_menu_layout.css">
<script defer src="/core/jquery-3.5.1/jquery-3.5.1.min.js"></script>
<script defer src="/core/bootstrap-4.5.3/js/bootstrap.bundle.js"></script>
<script defer src="/view/js/heesoo_menu.js"></script>
<script defer src="/view/js/jquery.backstretch.min.js"></script>
</head>
<body>
	<jsp:include page="/view/heesoo/top.jsp" flush="false" />
	<main>
	<div class="container">
		<div class="rtitle">구이류</div>
			<div class="rmenu" id="img0">돼지갈비</div>
			<div class="rmenu" id="img1">소양념갈비</div>
			<div class="rmenu" id="img2">소갈비살</div>
			<div class="rmenu" id="img3">소생갈비</div>
			<div class="rmenu" id="img4">목살구이</div>
		<div class="rtitle">식사류</div>
			<div class="rmenu" id="img5">갈비탕</div>
			<div class="rmenu" id="img6">돼지갈비찜</div>
			<div class="rmenu" id="img7">소갈비찜</div>
			<div class="rmenu" id="img8">김치전골</div>
			<div class="rmenu" id="img9">냉면</div>
			<div class="rmenu" id="img10">솥밥</div>
	</div>
	<div id="show"></div>
	</main>	
	<jsp:include page="/view/heesoo/bottom.jsp" flush="false" />
		<a href="../../../index.jsp"><div id="home">
			홈페이지
		</div></a>
</body>
</html>