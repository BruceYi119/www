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

const naverSearch = () => {
	const search = document.querySelector('#search');
	const searchType = document.querySelector('#searchType').value;
	const searchVal = encodeURIComponent(search.value);
	const searchTitle = selectTxt[searchType];

	if (searchVal.length < 1)
		return false;

	location.href = `http://localhost/view/api/naver/search.jsp?search=${searchVal}&searchType=${searchType}&searchTitle=${searchTitle}`;
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
};