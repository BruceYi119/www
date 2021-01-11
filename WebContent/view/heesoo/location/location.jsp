<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../top.jsp"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b0455cfb06f562e4f4a1ab2afadeddac"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style>
	main{
        width:1200px;
        height:1000px;
        margin: 10px auto;
        margin-bottom: 50px;
    }
    #come_title{
    	font-size: 50px;
    	
    }
    #map{
    	width:1200px;
    	height:600px;
    }
    #location_wrap{
    	margin-top:10px;
    }
    dl{
   	   text-align: left;
		margin: 0;
		padding: 30px 0;
		font-size: 15px;
		line-height: 22px;
		border-bottom: 1px solid #ebebeb;
    }
    dt{
    	text-align: left;
		margin: 0;
		padding: 0;
		float: left;
		width: 168px;
		padding-left: 10px;
		font-size: 20px;
    }
    dd{
		text-align: left;
		font-size: 20px;
		line-height: 22px;
		margin: 0;
		overflow:visible;
		padding: 0;
		padding-right: 10px;	
		margin-left: 60px;
		padding-left:140px;
    }
    
    main::after{
    clear: both;}
    .iconWrap{
    	position: relative;
    }
    .svg-inline--fa{
   		position:absolute;
    	top:-20px;
    }
    .book{left:10px;}
    .group{left:17px;}
    .parking{left:10px;}
    .male{left:33px;}
    .female{left:40px;}
    .baby{left:23px;}
    #sub_detail_e{
    	font-size:17px;
    	color:gray;
    }
    .use{padding-top:20px;}
   
    
    
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
<main>
	<div id="come_title">오시는 길</div>
	<hr>
	<div id="map"></div>
	<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.40287125921357, 126.90659552695378), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.40287125921357, 126.90659552695378); 
// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
   
});
// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);
var content = '<div class="wrap">' + 
'    <div class="info">' + 
'        <div class="title">' + 
'            갈비대첩' + 
'            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
'        </div>' + 
'        <div class="body">' + 
'            <div class="img">' +
'                <img src="//t1.daumcdn.net/thumb/C84x76/?fname=http://t1.daumcdn.net/localfiy/93AB374342EA40319F8BA613D2ED9418" width="73" height="70">' +
'           </div>' + 
'            <div class="desc">' + 
'                <div class="ellipsis">경기 안양시 만안구 박달로 485</div>' + 
'                <div class="jibun ellipsis">(우) 13983(지번) 박달동 105-3</div>' + 
'            </div>' + 
'        </div>' + 
'    </div>' +    
'</div>';

//마커 위에 커스텀오버레이를 표시합니다
//마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
var overlay = new kakao.maps.CustomOverlay({
content: content,
map: map,
position: marker.getPosition()       
});

//마커를 클릭했을 때 커스텀 오버레이를 표시합니다
kakao.maps.event.addListener(marker, 'click', function() {
overlay.setMap(map);
});

//커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
function closeOverlay() {
overlay.setMap(null);     
}
</script>
<dl id="location_wrap">
	<dt class="come_content">이용시간</dt>
	<div class="gap"></div>
	<dd class="come_detail">연중무휴 11:00~22:00<br/><span class="sub_detail_e"></span>방문 전 예약 바랍니다.</dd>
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
<%@include file="../bottom.jsp"%>

