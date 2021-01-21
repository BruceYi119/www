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