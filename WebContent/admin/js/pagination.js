'use strict';

class Pagination {

	constructor(listSize = 10, rangeSize = 10) {
		this.listSize = listSize;
		this.rangeSize = rangeSize;
		this.page;
		this.range;
		this.listCnt;
		this.pageCnt;
		this.startPage;
		this.startList;
		this.endPage;
		this.prev;
		this.next;
		this.info = {};		
	}

	setInfo(page = 1, range = 1, listCnt = 0) {
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;

		// 전체 페이지수
		this.pageCnt = Math.ceil(this.listCnt / this.listSize);

		// 시작 페이지
		this.startPage = page == 1 ? 1 : (this.range - 1) * this.rangeSize + 1;

		// 끝 페이지
		this.endPage = this.range * this.rangeSize;

		// 게시판 시작번호
		this.startList = this.page == 1 ? 1 : (this.page - 1) * this.listSize + 1;

		// 이전 버튼 상태
		this.prev = this.range == 1 ? false : true;

		// 다음 버튼 상태
		this.next = this.endPage > this.pageCnt ? false : true;

		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;

			this.next = false;
		}

		this.info.listSize = this.listSize;
		this.info.rangeSize = this.rangeSize;
		this.info.page = this.page;
		this.info.range = this.range;
		this.info.pageCnt = this.pageCnt;
		this.info.startPage = this.startPage;
		this.info.startList = this.startList;
		this.info.endPage = this.endPage;
		this.info.prev = this.prev;
		this.info.next = this.next;
	}

}

const setpagination = () => {
	const info = JSON.parse($('input[name=info]').val());
	const pageWrap = $('#pageWrap');
	const url = $('input[name=url]').val();
	const page = parseInt($('input[name=page]').val());
	const range = parseInt(info.range);
	const rangeSize = parseInt(info.rangeSize);
	const listCnt = parseInt($('input[name=listCnt]').val());
	const pagination = new Pagination();
	let prevBtn = `<li class="page-item disabled"><a class="page-link" href="#">Prev</a></li>`;
	let nextBtn = `<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>`;
	let html = ``;

	info.prev = Boolean(info.prev);
	info.next = Boolean(info.next);

	// 페이징 range설정
//	pagination.rangeSize = 5;

	if (info.prev === true) {
		pagination.setInfo(page - rangeSize, range - 1, listCnt);
		prevBtn = `<li class="page-item"><a class="page-link" href="${url}?cpage=${pagination.startPage}&range=${pagination.info.range}">Prev</a></li>`;
	}

	html += prevBtn;
	
	for (let i = parseInt(info.startPage);i <= parseInt(info.endPage);i++)
		html += parseInt(info.page) === i ? `<li class="page-item active"><a class="page-link" href="${url}?cpage=${i}&range=${range}">${i}</a></li>` : `<li class="page-item"><a class="page-link" href="${url}?cpage=${i}&range=${range}">${i}</a></li>`;

	if (info.next === true) {
		pagination.setInfo(page + rangeSize, range + 1, listCnt);
		nextBtn = `<li class="page-item"><a class="page-link" href="${url}?cpage=${pagination.startPage}&range=${pagination.info.range}">Next</a></li>`;
	}

	html += nextBtn;

	pageWrap.html(html);
};

setpagination();