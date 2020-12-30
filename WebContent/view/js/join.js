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

const setJoinBtn = () => {
	errMsgs = document.querySelectorAll('.errMsg');
	const inputs = document.querySelectorAll('input.input');
	
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
			return false;
		}

		form.submit();
	});

	for (let i = 0;i < inputs.length;i++) {
		inputs[i].addEventListener('focusout', function() {
			const obj = this;
			
			if (obj.value === '') {
				obj.focus();
				errMsgs[i].innerHTML = '필수 정보 입니다';
			}
		});		
	}

//	document.querySelector(inputs.join()).addEventListener('focusout', function() {
//		const obj = this;
//		
//		if (obj.value === '') {
//			obj.focus();
//			errMsgs[0].innerHTML = '필수 정보 입니다';
//		}
//	});
};

setJoinBtn();