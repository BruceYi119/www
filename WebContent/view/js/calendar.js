'use strict';

const calData = {
	y: { min: 1900, max: 2037 },
	m: 12,
	d: 31,
	tr: 6,
	td: 7
};

const getToday = (y, m) => {
	const now = new Date();
	const date = new Date(y, m, 1);

	if (now.getFullYear() === date.getFullYear() && now.getMonth() === date.getMonth())
		return now.getDate();
	else
		return 1;
};

const setSelect = (date = new Date()) => {
	const year = $('#year');
	const month = $('#month');
	const y = date.getFullYear();
	const m = date.getMonth() + 1;
	let yHtml = ``;
	let mHtml = ``;

	for (let i = calData.y.min;i <= calData.y.max;i++)
		yHtml += `<option value="${i}">${i}</option>`;

	for (let i = 1;i <= calData.m;i++)		
		mHtml += `<option value="${i}">${i}</option>`;

	year.html(yHtml);
	month.html(mHtml);

	year.find(`option[value=${y}]`).prop('selected', true);
	month.find(`option[value=${m}]`).prop('selected', true);
};

const drawCalendar = (date = new Date()) => {
	const tbody = $('#calendar tbody');
	const y = date.getFullYear();
	const m = date.getMonth();
	const w = new Date(y, m, 1).getDay();
	const today = getToday(y, m);
	const lastDate = new Date(y, m + 1, 0).getDate();
	let html = ``;
	let day = 1;
	let count = 0;

	for (let i = 1;i <= calData.tr;i++) {
		html += `<tr>`;

		for (let j = 1;j <= calData.td;j++) {
			if (count >= w && count < (lastDate + w)) {
				if (j === 1) {
					if (day === today)
						html += `<td class="sun sel">${day}</td>`;
					else
						html += `<td class="sun">${day}</td>`;
				} else {					
					if (day === today)
						html += `<td class="sel">${day}</td>`;
					else
						html += `<td>${day}</td>`;
				}

				if (day < lastDate)
					day++;
			} else {
				html += `<td>&nbsp;</td>`;				
			}

			count++;				
		}

		html += `</tr>`;
	}

	tbody.html(html);
};

const setDate = (oper = 1) => {
	const year = $('#year');
	const month = $('#month');
	const now = new Date();
	const date = new Date(parseInt(year.val()), parseInt(month.val()) - 1, 1);
	const nextDate = now.getMonth() === date.getMonth() ? new Date(date.getFullYear(), date.getMonth() + oper, now.getDate()) : new Date(date.getFullYear(), date.getMonth() + oper, 1);

	year.find(`option[value=${nextDate.getFullYear()}]`).prop('selected', true);
	month.find(`option[value=${nextDate.getMonth() + 1}]`).prop('selected', true);

	drawCalendar(nextDate);
};

$(function() {

	setSelect();
	drawCalendar();

	$('#prev').bind('click', () => {
		setDate(-1);
	});

	$('#next').bind('click', () => {
		setDate();
	});

	$('#year, #month').bind('change', () => {
		const y = $('#year').val();
		const m = $('#month').val();
		const today = getToday(y, m - 1); 
		const date = new Date(y, m - 1, today);

		drawCalendar(date);
	});

	$('#today').bind('click', () => {
		const year = $('#year');
		const month = $('#month');
		const date = new Date();
		const y = date.getFullYear();
		const m = date.getMonth() + 1;

		year.find(`option[value=${y}]`).prop('selected', true);
		month.find(`option[value=${m}]`).prop('selected', true);
		
		drawCalendar(date);
	});

});