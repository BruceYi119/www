'use strict';

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo) {
	const spanZipcode = document.querySelector('#zipcode');
	const spanAddr = document.querySelector('#addr');
	const spanAddr_detail = document.querySelector('#addr_detail');
	const addrUpdateBtn = document.querySelector('#addrUpdateBtn');
	const addrUpdateCancel = document.querySelector('#addrUpdateCancel');

	spanZipcode.innerHTML = roadAddrPart1;
	spanAddr.innerHTML = addrDetail;
	spanAddr_detail.innerHTML = zipNo;

	addrUpdateBtn.classList.remove('hide');
	addrUpdateCancel.classList.remove('hide');
};

const jusoPopup = () => {
	const popupWidth = 570;
	const popupHeight = 420;
    const left = Math.ceil((window.screen.width - popupWidth) / 2);
    const top = Math.ceil((window.screen.height - popupHeight) / 2);

	const pop = window.open('/view/member/jusoPopup.jsp','pop',`width=${popupWidth},height=${popupHeight}, scrollbars=yes, resizable=yes, left=${left}, top=${top}`); 
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
	const addrUpdateBtn = document.querySelector('#addrUpdateBtn');
	const addrUpdateCancel = document.querySelector('#addrUpdateCancel');

	spanZipcode.innerHTML = zipcode.value;
	spanAddr.innerHTML = addr.value;
	spanAddr_detail.innerHTML = addr_detail.value;

	addrUpdateBtn.classList.add('hide');
	addrUpdateCancel.classList.add('hide');
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
};

const setFormData = (info) => {
	const infoName = document.querySelector('#infoName');
	const infoPhone = document.querySelector('#infoPhone');
	const infoBirth = document.querySelector('#infoBirth');
	const infoEmail = document.querySelector('#infoEmail');

	infoName.value = info.name; 
	infoPhone.value = info.phone; 
	infoBirth.value = info.birth; 
	infoEmail.value = info.email; 
};

const setMemberInfo = () => {
	document.querySelector('#searAddrBtn').addEventListener('click', () => {
		jusoPopup();
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
		const errMsg = document.querySelector('.errMsg');

		zipcode.value = spanAddr_detail.innerHTML;
		addr.value = spanZipcode.innerHTML;
		addr_detail.value = spanAddr.innerHTML;

		addrUpdateBtn.classList.add('hide');
		addrUpdateCancel.classList.add('hide');

		if (zipcode.value === '') {
			errMsg.innerHTML = '상세주소를 입력하세요';
			return false;
		}

		const r = sendAjax();

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
		const birth = document.querySelector('input[name=email]');
		const email = document.querySelector('input[name=email]');
		const updateName = document.querySelector('#updateName');
		const updatePhone = document.querySelector('#updatePhone');
		const updateBirth = document.querySelector('#updateBirth');
		const updateEmail = document.querySelector('#updateEmail');

		if (infoUpdateBtn.getAttribute("click") && infoUpdateBtn.getAttribute("click") === 'true') {
			name.value = updateName.value;
			phone.value = updatePhone.value;
			email.value = updateBirth.value;
			email.value = updateEmail.value;

			const r = sendAjax();

			r.then((res) => {
				if (res.data.update === true) {
					updateInfoCancel();
					setFormData(res.data.info);
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