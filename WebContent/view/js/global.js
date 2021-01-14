'use strict';

const selectTxt = {
	NEWS: '뉴스',
	BLOG: '블로그',
	BOOK: '책',
	ENCYC: '백과사전',
	MOVIE: '영화',
	CAFE: '카페글',
	KIN: '지식iN',
	LOCAL: '지역',
	ERRATA: '오타변환',
	WEBKR: '웹문서',
	IMAGE: '이미지',
	SHOP: '쇼핑',
	DOC: '전문자료'
};

const memberErrTxt = {
	id: '아이디는 알파벳으로 시작 4자이상 12자 이하로 입력하세요',
	pw: '비밀번호는 숫자/특문/영문 포함 4자이상 12자이하',
	pw2: '비밀번호와 비밀번호 확인이 일치하지 않습니다',
	name: '이름은 한글2~4자 영문2~10자 혼용X',
	phone: '연락처 형식에 맞지 않습니다',
	birth: '생일형식에 맞지 않습니다 ex)2021-01-01',
	addr: '주소를 검색하여 입력하세요',
	email: '이메일 형식에 맞지 않습니다'
};

const naverSearch = () => {
	const search = document.querySelector('#search');
	const searchType = document.querySelector('#searchType').value;
	const searchVal = encodeURIComponent(search.value);
	const searchTitle = selectTxt[searchType];

	if (searchVal.length < 1)
		return false;

	location.href = `http://localhost/view/api/naver/search.jsp?search=${searchVal}&searchType=${searchType}&searchTitle=${searchTitle}`;
};

const setColor = () => {
	if (document.querySelector('#color_class')) {
		const color = document.querySelector('#color_class').value;
		
		document.querySelector('header').classList.add(color);
		document.querySelector('nav').classList.add(color);
		document.querySelector('footer').classList.add(color);
	}
};

const jusoPopup = (func = null) => {
	const popupWidth = 570;
	const popupHeight = 420;
    const left = Math.ceil((window.screen.width - popupWidth) / 2);
    const top = Math.ceil((window.screen.height - popupHeight) / 2);

    if (func === 'showUpdateAddrBtns')
    	window.open(`/view/member/jusoPopup.jsp?func=${func}`,'pop',`width=${popupWidth},height=${popupHeight}, scrollbars=yes, resizable=yes, left=${left}, top=${top}`); 
    else
    	window.open('/view/member/jusoPopup.jsp','pop',`width=${popupWidth},height=${popupHeight}, scrollbars=yes, resizable=yes, left=${left}, top=${top}`); 
};

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo,func = null) {
	if (func !== null && func === 'showUpdateAddrBtns') {
		const spanZipcode = document.querySelector('#zipcode');
		const spanAddr = document.querySelector('#addr');
		const spanAddr_detail = document.querySelector('#addr_detail');

		spanAddr_detail.innerHTML = addrDetail;
		spanZipcode.innerHTML = zipNo;
		spanAddr.innerHTML = roadAddrPart1;

		showUpdateAddrBtns();		
	} else {
		const zipcode = document.querySelector('input[name=zipcode]');
		const addr = document.querySelector('input[name=addr]');
		const addr_detail = document.querySelector('input[name=addr_detail]');

		addr.value = roadAddrPart1;
		addr_detail.value = addrDetail;
		zipcode.value = zipNo;		
	}
};

const isId = (value) => {
	const reg = /^[a-z]+[a-z0-9]{3,12}$/g;

	return reg.test(value);
};

const isDuplicateId = (value) => {
	const id = document.querySelector('input[name=id]');
	const params = {
		params: {
			id: id.value,
		}
	};
	const ajax = axios.get('/view/member/id_check.jsp', params);

	ajax.then((res) => {
		if (res.data.check === true) {
			id_check = true;
			id.focus();
			errMsgs[0].innerHTML = '사용중인 아이디 입니다';
		} else {
			id_check = false;
		}
	}).catch(err => console.log(err));
};

const isName = (value) => {
	const reg = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/g;

	return reg.test(value);
};

const isEmail = (value) => {
	const reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

	return reg.test(value);	
};

const isCelluar = (value) => {
	const reg = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/g;

	return reg.test(value);
};

const isPassword = (value) => {
	const reg = /^.*(?=^.{4,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/g;

	return reg.test(value);
};

const isBirth = (value) => { 
	const reg = /^(19|20){1}\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/g;

	return reg.test(value);
};

window.onload = () => {
	window.addEventListener('click', () => {
		if (document.activeElement !== document.querySelector('.search_event_wrap') && document.activeElement !== document.querySelector('#searchType') && document.activeElement !== document.querySelector('#search') && document.activeElement !== document.querySelector('#btn_search'))
			document.querySelector('#searchType').classList.add('hide');
	});

	document.querySelector('#search').addEventListener('keydown', (e) => {
		if (e.keyCode === 13) {
			naverSearch();
		}
	});

	document.querySelector('.search_event_wrap').addEventListener('mouseenter', () => {
		document.querySelector('#search').classList.add('enable');
		document.querySelector('#searchType').classList.remove('hide');
	});

	document.querySelector('.search_event_wrap').addEventListener('mouseleave', () => {
		document.querySelector('#search').classList.remove('enable');
		
		if (document.activeElement !== document.querySelector('.search_event_wrap') && document.activeElement !== document.querySelector('#searchType') && document.activeElement !== document.querySelector('#search') && document.activeElement !== document.querySelector('#btn_search'))
			document.querySelector('#searchType').classList.add('hide');
	});

	document.querySelector('#btn_search').addEventListener('click', naverSearch);

	document.querySelector('#darkMode > button').addEventListener('click', function() {
		const o = this;
		const main = document.querySelector('main')

		if (o.getAttribute('flag') === null) {
			main.classList.add('dark_mode');
			o.textContent = '라이트 모드';
			o.classList.add('dark_mode');
			o.setAttribute('flag', 'dark')
		} else {
			o.textContent = '다크 모드';
			o.classList.remove('dark_mode');
			main.classList.remove('dark_mode');
			o.removeAttribute('flag')
		}
	});

	setColor();
};