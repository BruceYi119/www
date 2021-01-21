'use strict';

const getCovid19 = () => {
	const ajax = axios.get('/view/api/data/covid19.jsp');
	let covidData = {};
	let html = ``;

	ajax.then((res) => {
		const todayInfo = res.data.response.body.items.item.decideCnt ? res.data.response.body.items.item : res.data.response.body.items.item[0];

		covidData.decideCnt = Number(todayInfo.decideCnt);
		covidData.decideClass = '';
		covidData.examCnt = Number(todayInfo.examCnt);
		covidData.examAddClass = '';
		covidData.clearCnt = Number(todayInfo.clearCnt);
		covidData.clearAddClass = '';
		covidData.deathCnt = Number(todayInfo.deathCnt);
		covidData.deathAddClass = '';

		if (res.data.response.body.items.item.decideCnt) {
			covidData.incDecideCnt = 0;
			covidData.incExamCnt = 0;
			covidData.incClearCnt = 0;
			covidData.incDeathCnt = 0;
		} else {
			const prevDayInfo = res.data.response.body.items.item[1];

			covidData.incDecideCnt = covidData.decideCnt - Number(prevDayInfo.decideCnt);
			covidData.incExamCnt = covidData.examCnt - Number(prevDayInfo.examCnt);
			covidData.incClearCnt = covidData.clearCnt - Number(prevDayInfo.clearCnt);
			covidData.incDeathCnt = covidData.deathCnt - Number(prevDayInfo.deathCnt);
		}

		covidData.decideCnt = new Intl.NumberFormat({ maximumSignificantDigits: 3 }).format(covidData.decideCnt);
		covidData.examCnt = new Intl.NumberFormat({ maximumSignificantDigits: 3 }).format(covidData.examCnt);
		covidData.clearCnt = new Intl.NumberFormat({ maximumSignificantDigits: 3 }).format(covidData.clearCnt);
		covidData.deathCnt = new Intl.NumberFormat({ maximumSignificantDigits: 3 }).format(covidData.deathCnt);

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

		$('#covidLoding').remove();
		$(html).appendTo('.covidWrrap');
	}).catch(err => console.log(err));
};

const getWeather = () => {
	const key = 'a6025c131a3a3595993d16f7b10cb158';																						// default
	const city = '서울특별시';
	const url = `http://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${key}&lang=kr`;										// Current Weather Data
//	const url = `https://api.openweathermap.org/data/2.5/onecall?lat=37.5667&lon=126.9783&exclude=current&appid=${key}&lang=kr`;		// One Call API
//	const url = `http://maps.openweathermap.org/maps/2.0/weather/op/1/37.5667/126.9783&appid=${key}`;									// Weather maps 2.0
	const ajax = axios.get(url);
	let html = `<ul class="weatherInfo">`;

	ajax.then((res) => {
		const info = res.data;

		for (let i = 0;i < 8;i++) {
			let data = `<img src="//openweathermap.org/img/wn/${info.weather[0].icon}@2x.png" /><span>${info.weather[0].description}</span>`;

			if (i === 1)
				data = `체감온도 : ${info.main.feels_like} °C`;
			if (i === 2)
				data = `습도 : ${info.main.humidity} %`;
			if (i === 3)
				data = `기압 : ${info.main.pressure} hPa`;
			if (i === 4)
				data = `풍속 : ${info.wind.speed} m/s`;
			if (i === 5)
				data = `풍향 : <div class="wind"><svg data-v-47880d39="" viewBox="0 0 1000 1000" enable-background="new 0 0 1000 1000" xml:space="preserve" class="icon-wind-direction" style="transform: rotate(${info.wind.deg}deg);"><g data-v-47880d39="" fill="#48484a"><path data-v-47880d39="" d="M510.5,749.6c-14.9-9.9-38.1-9.9-53.1,1.7l-262,207.3c-14.9,11.6-21.6,6.6-14.9-11.6L474,48.1c5-16.6,14.9-18.2,21.6,0l325,898.7c6.6,16.6-1.7,23.2-14.9,11.6L510.5,749.6z"></path><path data-v-47880d39="" d="M817.2,990c-8.3,0-16.6-3.3-26.5-9.9L497.2,769.5c-5-3.3-18.2-3.3-23.2,0L210.3,976.7c-19.9,16.6-41.5,14.9-51.4,0c-6.6-9.9-8.3-21.6-3.3-38.1L449.1,39.8C459,13.3,477.3,10,483.9,10c6.6,0,24.9,3.3,34.8,29.8l325,898.7c5,14.9,5,28.2-1.7,38.1C837.1,985,827.2,990,817.2,990z M485.6,716.4c14.9,0,28.2,5,39.8,11.6l255.4,182.4L485.6,92.9l-267,814.2l223.9-177.4C454.1,721.4,469,716.4,485.6,716.4z"></path></g></svg></div>`;
			if (i === 6)
				data = `가시거리 : ${info.visibility} 미터`;
			if (i === 7)
				data = `구름비율 : ${info.clouds.all} %`;
	
			html += `<li>${data}</li>`;
		};

		html += `</ul>`;

		$('#weatherLoding').remove();
		$(html).appendTo('.weatherWrap');
		$('div.wind > svg').css('tranfrom', info.wind.deg);

	}).catch(err => console.log(err));
};

setTimeout(getCovid19, 1000);
setTimeout(getWeather, 500);