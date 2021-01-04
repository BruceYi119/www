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

		console.log(form);
//		form.submit();
	});

	document.querySelector('#addrUpdateCancel').addEventListener('click', () => {
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
	});
};

setMemberInfo();