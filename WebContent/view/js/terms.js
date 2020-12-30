'use strict';

const setTermsBtn = () => {
	document.querySelector('#temsBtn').addEventListener('click', (e) => {
		e.preventDefault();

		const form = document.querySelector('form');
		const checks = document.querySelectorAll('input[name=terms]');
		const errMsg = document.querySelector('#errMsg');
		let check = true;

		for (let i = 0;i<2;i++) {
			if (checks[i].checked === false) {
				check = false;
			}
		}

		if (!check) {
			errMsg.innerHTML = '필수 약관에 모두 동의해 주세요';
			return false;
		}

		form.submit();
	});
};

setTermsBtn();