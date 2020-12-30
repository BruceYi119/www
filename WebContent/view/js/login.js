'use strict';

const bindButton = () => {
	document.querySelector('input[type=submit]').addEventListener('click', (e) => {
		e.preventDefault();

		const form = document.querySelector('form');
		const id = document.querySelector('input[name=id]');
		const pw = document.querySelector('input[name=pw]');
		const errId = document.querySelector('#errId');
		const errMsg = document.querySelector('#errMsg');

		errId.innerHTML = '';
		errMsg.innerHTML = '';

		if (id.value === '') {
			errId.innerHTML = '아이디를 입력하세요';
			id.focus();
			return false;
		}
		if (pw.value === '') {
			errMsg.innerHTML = '비빌번호를 입력하세요';
			pw.focus();
			return false;
		}

		form.submit();
	});
};

bindButton();