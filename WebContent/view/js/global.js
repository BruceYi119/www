"use strict";
window.onload = () => {
	document.querySelector('#search').addEventListener('mouseenter', function() {
		this.classList.add('enable');
	});

	document.querySelector('#search').addEventListener('mouseleave', function() {
		this.classList.remove('enable');
	});

	document.querySelector('#btn_search').addEventListener('click', () => {
		const searchInput = document.querySelector('#search');
		const val = encodeURIComponent(searchInput.value);

		if (val.length < 1)
			return;

		location.href = `http://localhost/view/api/naver/search.jsp?search=${val}`;
	});
};