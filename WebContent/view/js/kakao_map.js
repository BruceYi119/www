'use strict';

let map;

const setMap = () => {
	//지도를 담을 영역의 DOM 레퍼런스
	const container = document.querySelector('#map');
	const control = new kakao.maps.ZoomControl();
	const mapTypeControl = new kakao.maps.MapTypeControl();

	//지도를 생성할 때 필요한 기본 옵션
	const options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),	//지도의 중심좌표.
		level: 3												//지도의 레벨(확대, 축소 정도)
	};

	map = new kakao.maps.Map(container, options);	//지도 생성 및 객체 리턴
	map.addControl(control, kakao.maps.ControlPosition.TOPRIGHT);
	// 지도 오른쪽 위에 지도 타입 컨트롤이 표시되도록 지도에 컨트롤을 추가한다.
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
};

const setKakaoColor = () => {
	document.querySelector('#menu').classList.add('kakaoMap');
};

setMap();
setKakaoColor();