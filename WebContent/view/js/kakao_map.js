'use strict';

let map;
let ps;

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
const placesSearchCB = (data, status, pagination)  => {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        const bounds = new kakao.maps.LatLngBounds();

        for (let i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
const displayMarker = (place) => {

    // 마커를 생성하고 지도에 표시합니다
    const marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    const infowindow = new kakao.maps.InfoWindow({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x),
        content: place.place_name
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}

const setMap = () => {
	//지도를 담을 영역의 DOM 레퍼런스
	const container = document.querySelector('#map');
	const control = new kakao.maps.ZoomControl();
	const mapTypeControl = new kakao.maps.MapTypeControl();

	//지도를 생성할 때 필요한 기본 옵션
	const options = {
		center: new kakao.maps.LatLng(37.5009337185365, 126.884692406561),	//지도의 중심좌표.
		level: 3												//지도의 레벨(확대, 축소 정도)
	};

	map = new kakao.maps.Map(container, options);	//지도 생성 및 객체 리턴
	map.addControl(control, kakao.maps.ControlPosition.TOPRIGHT);
	// 지도 오른쪽 위에 지도 타입 컨트롤이 표시되도록 지도에 컨트롤을 추가한다.
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	//장소 검색 객체를 생성합니다
	ps = new kakao.maps.services.Places(); 

	// 키워드로 장소를 검색합니다
	ps.keywordSearch('경영기술개발원', placesSearchCB);
};

const setKakaoColor = () => {
	document.querySelector('#menu').classList.add('kakaoMap');
};

setMap();
setKakaoColor();