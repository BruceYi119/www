'use strict';

const activeMenu = () => {
	const menus = $('#menu > li');
	const index = parseInt($('#active').val());

	menus.eq(index).find('a').addClass('active');
};

$(function() {
	activeMenu();
});