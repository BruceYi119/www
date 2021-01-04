'use strict';

let errMsgs = null;
let id_check = false;

const jusoPopup = () => {
	const popupWidth = 570;
	const popupHeight = 420;
    const left = Math.ceil((window.screen.width - popupWidth) / 2);
    const top = Math.ceil((window.screen.height - popupHeight) / 2);

	const pop = window.open('/view/member/jusoPopup.jsp','pop',`width=${popupWidth},height=${popupHeight}, scrollbars=yes, resizable=yes, left=${left}, top=${top}`); 
};

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo) {
	const zipcode = document.querySelector('input[name=zipcode]');
	const addr = document.querySelector('input[name=addr]');
	const addr_detail = document.querySelector('input[name=addr_detail]');

	addr.value = roadAddrPart1;
	addr_detail.value = addrDetail;
	zipcode.value = zipNo;
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

const setJoinBtn = () => {
	errMsgs = document.querySelectorAll('.errMsg');

	document.querySelector('input[type=submit]').addEventListener('click', (e) => {
		e.preventDefault();

		const form = document.querySelector('form');
		const id = document.querySelector('input[name=id]');
		const pw = document.querySelector('input[name=pw]');
		const pw2 = document.querySelector('input[name=pw2]');
		const name = document.querySelector('input[name=name]');
		const phone = document.querySelector('input[name=phone]');
		const birth = document.querySelector('input[name=birth]');
		const zipcode = document.querySelector('input[name=zipcode]');
		const addr = document.querySelector('input[name=addr]');
		const addr_detail = document.querySelector('input[name=addr_detail]');
		const email = document.querySelector('input[name=email]');


		if (!isId(id.value)) {
			errMsgs[0].innerHTML = '아이디는 알파벳으로 시작 4자이상 12자 이하로 입력하세요';
			id.focus();
			return false;
		}

		isDuplicateId();

		if (!isPassword(pw.value)) {
			errMsgs[1].innerHTML = '비밀번호는 숫자/특문/영문 포함 4자이상 12자이하';
			pw.focus();
			return false;
		}

		if (!isPassword(pw2.value) || pw.value !== pw2.value) {
			errMsgs[2].innerHTML = '비밀번호와 비밀번호 확인이 일치하지 않습니다';
			pw2.focus();
			return false;
		}

		if (!isName(name.value)) {
			errMsgs[3].innerHTML = '이름은 한글2~4자 영문2~10자 혼용X';
			name.focus();
			return false;
		}

		if (!isCelluar(phone.value)) {
			errMsgs[4].innerHTML = '연락처 형식에 맞지 않습니다';
			phone.focus();
			return false;
		}

		if (!isBirth(birth.value)) {
			errMsgs[5].innerHTML = '생일형식에 맞지 않습니다 ex)2021-01-01';
			birth.focus();
			return false;
		}

		if (zipcode.value === '') {
			errMsgs[6].innerHTML = '주소를 검색하여 입력하세요';
			return false;
		}

		if (addr.value === '') {
			errMsgs[7].innerHTML = '주소를 검색하여 입력하세요';
			return false;
		}

		if (addr_detail.value === '') {
			errMsgs[8].innerHTML = '주소를 검색하여 입력하세요';
			return false;
		}

		if (!isEmail(email.value)) {
			errMsgs[9].innerHTML = '이메일 형식에 맞지 않습니다';
			email.focus();
			return false;
		}

		zipcode.disabled = false;
		addr.disabled = false;
		addr_detail.disabled = false;

		form.submit();
	});

	document.querySelector('#searAddrBtn').addEventListener('click', () => {
		jusoPopup();
	});

	document.querySelector('input[name=id]').addEventListener('focusout', function() {
		isDuplicateId();
	});

};

setJoinBtn();