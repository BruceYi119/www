'use strict';

//const inputTxt = [
//	'input[name=id]',
//	'input[name=pw]',
//	'input[name=pw2]',
//	'input[name=name]',
//	'input[name=phone]',
//	'input[name=birth]',
//	'input[name=zipcode]',
//	'input[name=addr]',
//	'input[name=addr_detail]',
//	'input[name=email]'
//];

let errMsgs = null;
let id_check = false;

const jusoPopup = () => {
	const pop = window.open("/view/member/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
};

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo) {
	const zipcode = document.querySelector('input[name=zipcode]');
	const addr = document.querySelector('input[name=addr]');
	const addr_detail = document.querySelector('input[name=addr_detail]');

	addr.value = roadAddrPart1;
	addr_detail.value = addrDetail;
	zipcode.value = zipNo;
};

const setJoinBtn = () => {
	errMsgs = document.querySelectorAll('.errMsg');
	const inputs = document.querySelectorAll('input.input');
	const jusoInputs = document.querySelectorAll('input[name=addr], input[name=addr_detail], input[name=zipcode]');
	
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

		if (id.value === '' || id.value.length < 4 || id.value.length > 12) {
			errMsgs[0].innerHTML = '아이디는 4자이상 12자 이하로 입력하세요';
			id.focus();
			return false;
		}

		if (id_check) {			
			errMsgs[0].innerHTML = '사용중인 아이디 입니다';
			id.focus();
			return false;
		}

		if (pw.value === '' || pw.value.length < 4 || id.value.length > 12) {
			errMsgs[1].innerHTML = '비밀번호는 4자이상 12자 이하로 입력하세요';
			pw.focus();
			return false;
		}

		if (pw2.value === '' || pw2.value.length < 4 || pw2.value.length > 12) {
			errMsgs[2].innerHTML = '비밀번호는 4자이상 12자 이하로 입력하세요';
			pw2.focus();
			return false;
		}

		if (pw.value !== pw2.value) {
			errMsgs[2].innerHTML = '비밀번호와 비밀번호 확인이 일치하지 않습니다';
			pw2.focus();
			return false;
		}

		if (name.value === '') {
			errMsgs[3].innerHTML = '이름을 입력하세요';
			name.focus();
			return false;
		}

		if (phone.value === '') {
			errMsgs[4].innerHTML = '연락처를 입력하세요';
			phone.focus();
			return false;
		}

		if (birth.value === '') {
			errMsgs[5].innerHTML = '생일을 입력하세요';
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
			birth[8].innerHTML = '주소를 검색하여 입력하세요';
			return false;
		}

		if (email.value === '') {
			errMsgs[9].innerHTML = '주소를 검색하여 입력하세요';
			email.focus();
			return false;
		}

		form.submit();
	});

	for (let i = 0;i < jusoInputs.length;i++) {
		jusoInputs[i].addEventListener('click', () => {
			jusoPopup();
		});
	}

	for (let i = 0;i < inputs.length;i++) {
		inputs[i].addEventListener('focusout', function() {
			const obj = this;
			
			if (obj.value === '') {
				if (!(i === 6 || i === 7 || i === 8))
					obj.focus();

				errMsgs[i].innerHTML = '필수 정보 입니다';
			} else {
				if (i === 0) {
					const params = {
						params: {
							id: obj.value,
						}
					};
					const ajax = axios.get('/view/member/id_check.jsp', params);

					ajax.then((res) => {
						if (res.data.check === true) {
							id_check = true;
							obj.focus();
							errMsgs[i].innerHTML = '사용중인 아이디 입니다';
						} else {
							id_check = false;
						}
					}).catch(err => console.log(err));
				}
			}
		});		
	}

//	document.querySelector(inputs.join()).addEventListener('focusout', function() {
//		const obj = this;
//	});
};

setJoinBtn();