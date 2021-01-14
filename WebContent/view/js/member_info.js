'use strict';

const validation = (type = 'info') => {
	if (type === 'addr') {
		const spanZipcode = document.querySelector('#zipcode');
		const spanAddr = document.querySelector('#addr');
		const spanAddr_detail = document.querySelector('#addr_detail');
		const errMsg = document.querySelectorAll('.errMsg');

		if (spanAddr_detail.innerHTML === '') {
			errMsg[3].innerHTML = memberErrTxt.addr;
			return false;
		}
	} else if (type === 'pw') {
		
	} else {
		const updateName = document.querySelector('#updateName');
		const updatePhone = document.querySelector('#updatePhone');
		const updateBirth = document.querySelector('#updateBirth');
		const updateEmail = document.querySelector('#updateEmail');
		const errMsg = document.querySelectorAll('.errMsg');

		if (!isName(updateName.value)) {
			errMsg[0].innerHTML = memberErrTxt.name;
			updateName.focus();
			return false;
		}
		if (!isCelluar(updatePhone.value)) {
			errMsg[1].innerHTML = memberErrTxt.phone;
			updatePhone.focus();
			return false;
		}
		if (!isBirth(updateBirth.value)) {
			errMsg[2].innerHTML = memberErrTxt.birth;
			updateBirth.focus();
			return false;
		}
		if (!isEmail(updateEmail.value)) {
			errMsg[4].innerHTML = memberErrTxt.email;
			updateEmail.focus();
			return false;
		}
	}

	return true;
};

const resetErrMsg = () => {
	const errMsg = document.querySelectorAll('.errMsg');

	errMsg.forEach((v) => {
		v.innerHTML = '';
	});
};

const sendAjax = (form = document.querySelector('form')) => {
	const ajax = axios(
		{
			method: 'post',
			url: '/view/member/update_member.jsp',
			data: new FormData(form),
			headers: {'Content-Type': 'multipart/form-data' }
		}
	);

	return ajax;
};

const updateAddrCancel = () => {
	const zipcode = document.querySelector('input[name=zipcode]');
	const addr = document.querySelector('input[name=addr]');
	const addr_detail = document.querySelector('input[name=addr_detail]');
	const spanZipcode = document.querySelector('#zipcode');
	const spanAddr = document.querySelector('#addr');
	const spanAddr_detail = document.querySelector('#addr_detail');

	spanZipcode.innerHTML = zipcode.value;
	spanAddr.innerHTML = addr.value;
	spanAddr_detail.innerHTML = addr_detail.value;

	hideUpdateAddrBtns();
};

const updateInfoCancel = () => {
	const updateName = document.querySelector('#updateName');
	const updatePhone = document.querySelector('#updatePhone');
	const updateBirth = document.querySelector('#updateBirth');
	const updateEmail = document.querySelector('#updateEmail');
	const infoUpdateBtn = document.querySelector('#infoUpdateBtn');
	const infoUpdateCancelBtn = document.querySelector('#infoUpdateCancelBtn');

	infoUpdateBtn.removeAttribute('click');

	updateName.value = '';
	updatePhone.value = '';
	updateBirth.value = '';
	updateEmail.value = '';

	updateName.classList.add('hide');
	updatePhone.classList.add('hide');
	updateBirth.classList.add('hide');
	updateEmail.classList.add('hide');
	infoUpdateCancelBtn.classList.add('hide');

	resetErrMsg();
};

const setFormData = (info) => {
	const infoName = document.querySelector('#infoName');
	const infoPhone = document.querySelector('#infoPhone');
	const infoBirth = document.querySelector('#infoBirth');
	const infoEmail = document.querySelector('#infoEmail');

	infoName.innerHTML = info.name;
	infoPhone.innerHTML = info.phone;
	infoBirth.innerHTML = info.birth;
	infoEmail.innerHTML = info.email;
};

const hideUpdateAddrBtns = () => {
	const addrUpdateBtn = document.querySelector('#addrUpdateBtn');
	const addrUpdateCancel = document.querySelector('#addrUpdateCancel');

	addrUpdateBtn.classList.add('hide');
	addrUpdateCancel.classList.add('hide');
};

const showUpdateAddrBtns = () => {
	const addrUpdateBtn = document.querySelector('#addrUpdateBtn');
	const addrUpdateCancel = document.querySelector('#addrUpdateCancel');
	
	addrUpdateBtn.classList.remove('hide');
	addrUpdateCancel.classList.remove('hide');
};

const setMemberInfo = () => {
	document.querySelector('#searAddrBtn').addEventListener('click', () => {
		jusoPopup('showUpdateAddrBtns');
	});

	document.querySelector('#addrUpdateBtn').addEventListener('click', (e) => {
		e.preventDefault();

		const form = document.querySelector('form');
		const zipcode = document.querySelector('input[name=zipcode]');
		const addr = document.querySelector('input[name=addr]');
		const addr_detail = document.querySelector('input[name=addr_detail]');
		const spanZipcode = document.querySelector('#zipcode');
		const spanAddr = document.querySelector('#addr');
		const spanAddr_detail = document.querySelector('#addr_detail');

		zipcode.value = spanZipcode.innerHTML;
		addr.value = spanAddr.innerHTML;
		addr_detail.value = spanAddr_detail.innerHTML;

		if (!validation('addr'))
			return false;

		const r = sendAjax(form);

		r.then((res) => {
			if (res.data.update === true) {
				setFormData(res.data.info);
				alert('주소가 수정되었습니다');
			} else {
				updateAddrCancel();
				alert('주소 수정에 실패하였습니다');
			}
		});
	});

	document.querySelector('#infoUpdateBtn').addEventListener('click', () => {
		const infoUpdateBtn = document.querySelector('#infoUpdateBtn');
		const infoUpdateCancelBtn = document.querySelector('#infoUpdateCancelBtn');
		const name = document.querySelector('input[name=name]');
		const phone = document.querySelector('input[name=phone]');
		const birth = document.querySelector('input[name=birth]');
		const email = document.querySelector('input[name=email]');
		const updateName = document.querySelector('#updateName');
		const updatePhone = document.querySelector('#updatePhone');
		const updateBirth = document.querySelector('#updateBirth');
		const updateEmail = document.querySelector('#updateEmail');

		if (infoUpdateBtn.getAttribute("click") && infoUpdateBtn.getAttribute("click") === 'true') {
			name.value = updateName.value;
			phone.value = updatePhone.value;
			birth.value = updateBirth.value;
			email.value = updateEmail.value;

			if (!validation())
				return false;

			const r = sendAjax();

			r.then((res) => {
				if (res.data.update === true) {
					updateInfoCancel();
					setFormData(res.data.info);
					resetErrMsg();
					alert('회원정보가 수정되었습니다');
				} else {
					alert('회원정보 수정에 실패하였습니다');
				}
			});
		} else {
			infoUpdateBtn.setAttribute('click', true)
			infoUpdateCancelBtn.classList.remove('hide');
			updateName.classList.remove('hide');
			updatePhone.classList.remove('hide');
			updateBirth.classList.remove('hide');
			updateEmail.classList.remove('hide');
		}
	});

	document.querySelector('#addrUpdateCancel').addEventListener('click', () => {
		updateAddrCancel();
	});

	document.querySelector('#infoUpdateCancelBtn').addEventListener('click', () => {
		updateInfoCancel();
	});
};

setMemberInfo();