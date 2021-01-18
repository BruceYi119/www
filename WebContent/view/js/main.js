'use strict';

const getCovid19 = () => {
	const ajax = axios.get('/view/api/data/covid19.jsp');
	let covidData = {};
	let html = ``;

	ajax.then((res) => {
		const todayInfo = res.data.response.body.items.item[0];
		const prevDayInfo = res.data.response.body.items.item[1];

		covidData.decideCnt = Number(todayInfo.decideCnt);
		covidData.incDecideCnt = covidData.decideCnt - Number(prevDayInfo.decideCnt);
		covidData.decideCnt = new Intl.NumberFormat({ maximumSignificantDigits: 3 }).format(covidData.decideCnt);
		covidData.decideClass = '';
		covidData.examCnt = Number(todayInfo.examCnt);
		covidData.incExamCnt = covidData.examCnt - Number(prevDayInfo.examCnt);
		covidData.examCnt = new Intl.NumberFormat({ maximumSignificantDigits: 3 }).format(covidData.examCnt);
		covidData.examAddClass = '';
		covidData.clearCnt = Number(todayInfo.clearCnt);
		covidData.incClearCnt = covidData.clearCnt - Number(prevDayInfo.clearCnt);
		covidData.clearCnt = new Intl.NumberFormat({ maximumSignificantDigits: 3 }).format(covidData.clearCnt);
		covidData.clearAddClass = '';
		covidData.deathCnt = Number(todayInfo.deathCnt);
		covidData.incDeathCnt = covidData.deathCnt - Number(prevDayInfo.deathCnt);
		covidData.deathCnt = new Intl.NumberFormat({ maximumSignificantDigits: 3 }).format(covidData.deathCnt);
		covidData.deathAddClass = '';

		if (covidData.incDecideCnt < 0) {
			covidData.decideClass = ' down';
			covidData.incDecideCnt = String(covidData.incDecideCnt).replace('-','');
		}
		if (covidData.incExamCnt < 0) {
			covidData.examAddClass = ' down';
			covidData.incExamCnt = String(covidData.incExamCnt).replace('-','');
		}
		if (covidData.incClearCnt < 0) {
			covidData.clearAddClass = ' down';
			covidData.incClearCnt = String(covidData.incClearCnt).replace('-','');
		}
		if (covidData.incDeathCnt < 0) {
			covidData.addClass = ' down';
			covidData.deathAddClass = String(covidData.incDeathCnt).replace('-','');
		}

		html += `
			<ul class="covidInfo">
				<li class="info_01">
					<strong class="info_title">확진환자</strong>
					<p class="info_num">${covidData.decideCnt}</p>
					<em class="info_variation${covidData.decideClass}">${covidData.incDecideCnt}</em>
				</li>
				<li class="info_02">
					<strong class="info_title">검사중</strong>
					<p class="info_num">${covidData.examCnt}</p>
					<em class="info_variation${covidData.examAddClass}">${covidData.incExamCnt}</em>
				</li>
				<li class="info_03">
					<strong class="info_title">격리해제</strong>
					<p class="info_num">${covidData.clearCnt}</p>
					<em class="info_variation${covidData.clearAddClass}">${covidData.incClearCnt}</em>
				</li>
				<li class="info_04">
					<strong class="info_title">사망자</strong>
					<p class="info_num">${covidData.deathCnt}</p>
					<em class="info_variation${covidData.deathAddClass}">${covidData.incDeathCnt}</em>
				</li>
			</ul>
		`;

		$('.lodingWrap').remove();
		$(html).appendTo('.covidWrrap');
	}).catch(err => console.log(err));
};

setTimeout(getCovid19, 1000);