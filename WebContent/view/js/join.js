'use strict';

let errMsgs = null;
let id_check = false;

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
			errMsgs[0].innerHTML = memberErrTxt.id;
			id.focus();
			return false;
		}

		isDuplicateId();

		if (!isPassword(pw.value)) {
			errMsgs[1].innerHTML = memberErrTxt.pw;
			pw.focus();
			return false;
		}

		if (!isPassword(pw2.value) || pw.value !== pw2.value) {
			errMsgs[2].innerHTML = memberErrTxt.pw2;
			pw2.focus();
			return false;
		}

		if (!isName(name.value)) {
			errMsgs[3].innerHTML = memberErrTxt.name;
			name.focus();
			return false;
		}

		if (!isCelluar(phone.value)) {
			errMsgs[4].innerHTML = memberErrTxt.phone;
			phone.focus();
			return false;
		}

		if (!isBirth(birth.value)) {
			errMsgs[5].innerHTML = memberErrTxt.birth;
			birth.focus();
			return false;
		}

		if (zipcode.value === '') {
			errMsgs[6].innerHTML = memberErrTxt.addr;
			return false;
		}

		if (addr.value === '') {
			errMsgs[7].innerHTML = memberErrTxt.addr;
			return false;
		}

		if (addr_detail.value === '') {
			errMsgs[8].innerHTML = memberErrTxt.addr;
			return false;
		}

		if (!isEmail(email.value)) {
			errMsgs[9].innerHTML = memberErrTxt.email;
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