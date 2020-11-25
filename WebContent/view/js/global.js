"use strict";
window.onload = () => {
	document.querySelector('#search').addEventListener('mouseenter', function() {
		this.classList.add('enable');
	});

	document.querySelector('#search').addEventListener('mouseleave', function() {
		this.classList.remove('enable');
	});
};