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
<link rel="stylesheet" href="/view/css/heesoo_location_layout.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b0455cfb06f562e4f4a1ab2afadeddac"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script defer src="/core/jquery-3.5.1/jquery-3.5.1.min.js"></script>
<script defer src="/core/bootstrap-4.5.3/js/bootstrap.bundle.js"></script>
<script defer src="/view/js/reservation_write_cal.js"></script>
<script defer src="/view/js/heesoo_map.js"></script>
</head>
<body>
	<jsp:include page="/view/heesoo/top.jsp" flush="false" />
	<main>
		<div id="come_title">오시는 길</div>
		<hr>
		<div id="map"></div>
		<dl id="location_wrap">
	<dt class="come_content">이용시간</dt>
	<div class="gap"></div>
	<dd class="come_detail">연중무휴 11:00~22:00<br/><span class="sub_detail_e"></span>단체 방문 전 예약 바랍니다.</dd>
</dl>
<dl>
	<dt class="come_content">전화번호</dt>
	<dd class="come_detail">032-000-0000</dd>
</dl>
<dl>
	<dt class="come_content">이용안내</dt>
	<div class="gap"></div>
	<dd class="come_detail use">
		<span class="iconWrap"><i class="far fa-calendar-check book"></i><span class="sub_detail">예약</span></span>&nbsp&nbsp
		<span class="iconWrap"><i class="fas fa-users group"></i><span class="sub_detail">단체석</span></span>&nbsp&nbsp
		<span class="iconWrap"><i class="fas fa-parking parking"></i><span class="sub_detail">주차</span></span>&nbsp&nbsp
		<span class="iconWrap"><i class="fas fa-male male"></i><i class="fas fa-female female"></i><span class="sub_detail">남/녀 화장실</span></span>&nbsp&nbsp
		
		<span class="iconWrap"><i class="fas fa-baby baby"></i><span class="sub_detail">아기의자</span><br></span>
		<span id="sub_detail_e">주차공간이 협소하오니 가급적 도보를 이용해 주시기 바랍니다</span>
	</dd>
</dl>
</main>
	<jsp:include page="/view/heesoo/bottom.jsp" flush="false" />
	<a href="../../../index.jsp"><div id="home">
			홈페이지
		</div></a>
</body>
</html>