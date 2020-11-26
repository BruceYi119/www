"use strict";

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
	document.querySelector('#search').addEventListener('keydown', function(e) {
		if (e.keyCode === 13) {
			naverSearch();
		}
	});

	document.querySelector('#search').addEventListener('mouseenter', function() {
		this.classList.add('enable');
		document.querySelector('#searchType').classList.remove('hide');
	});

	document.querySelector('#search').addEventListener('mouseleave', function() {
		this.classList.remove('enable');
//		document.querySelector('#searchType').classList.add('hide');
	});

	document.querySelector('#btn_search').addEventListener('click', naverSearch);
};