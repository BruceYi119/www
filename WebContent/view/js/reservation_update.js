'use strict';
// 달력을 만들기 위한 최대치 설정한 변수
const calData = {
	y: { min: 1900, max: 2037 },
	m: 12,
	d: 31,
	tr: 6,
	td: 7
};
//	오늘 날짜를 표시하는 함수
const getToday = (y, m) => {			// 현재 년,월의 일을 얻어오는 함수
	const now = new Date();				// 현재 년,월,일,시,분,초
	const date = new Date(y, m, 1);		// 지정한 년,월,1일

	if (now.getFullYear() === date.getFullYear() && now.getMonth() === date.getMonth()) // 지정한 년,월이 현재 년,월과 같다면...
		return now.getDate();															// 현재 일을 반환
	else
		return 1;																		// 아니면 1일 반환				
};
// 달력의 년,월을 셋팅하는 함수
const setSelect = (date = new Date()) => {		// 사용자가 설정한
	const year = $('#year');					// 달력에서 사용자가 설정한 년도
	const month = $('#month');					// 달력에서 사용자가 설정한 월
	const y = date.getFullYear();				// 0000년 부터 시작
	const m = date.getMonth() + 1;				//  ,0~11 반환 +1	
	let yHtml = ``;								// html을 넣기 위한 변수 생성
	let mHtml = ``;								// html을 넣기 위한 변수 생성

//	for (let i = calData.y.min;i <= calData.y.max;i++)			// option에 년도 뽑아내기
//		yHtml += `<option value="${i}">${i}</option>`;
		yHtml = y ;

//	for (let i = 1;i <= calData.m;i++)							// option에 월 뽑아내기
//		mHtml += `<option value="${i}">${i}</option>`;
		mHtml = m ;
	
	year.html(yHtml);											// year 태그에 html넣기
	month.html(mHtml);											// month 태그에 html넣기
	
};
// 달력을 그리는 함수
const drawCalendar = (date = new Date()) => {
	const tbody = $('#cal tbody');								// 달력 그려지는 태그
	const y = date.getFullYear();									
	const m = date.getMonth();
	const w = new Date(y, m, 1).getDay();						// 이번 년,월의 1일
	const today = getToday(y, m);								// 오늘 날짜
	const lastDate = new Date(y, m+1 , 0).getDate();
	let tdate = new Date();
	const adate = new Date(tdate.getFullYear(), tdate.getMonth() + 1, tdate.getDate());
	let html = ``;
	let day = 1;
	let count = 0;

	// new Date()하면 오늘 날짜 현제시간 까지 체크되서 비교시 문제가되서 다시한번 new Date()로 년,월, 일 만지정하00:00:00이에요 그럼 문제가안되죠
//	tdate = new Date(tdate.getFullYear(), tdate.getMonth(), tdate.getDate());

	for (let i = 1;i <= calData.tr;i++) {
		html += `<tr>`;
		
		for (let j = 1;j <= calData.td;j++) {	
			if (count >= w && count < (lastDate + w)) {
//				let cDate =  new Date(date.getFullYear(), date.getMonth(), day, tdate.getHours(), tdate.getMinutes(), tdate.getSeconds());
				let cDate =  new Date(date.getFullYear(), date.getMonth(), day, 23, 59, 59);

				// 해당일이 오늘보다 크거나 같고 오늘의 한달 후 보다 작거나 같으면
//				if(tdate.getTime() <= cDate.getTime() && cDate.getTime() <= adate.getTime()){				// 오늘이 달력의 날보다 작거나 같으면 클릭 할 수 있게 한다.
				if(tdate <= cDate && cDate <= adate){				// 오늘이 달력의 날보다 작거나 같으면 클릭 할 수 있게 한다.
					if (j === 1) {								// 일요일(j==1)이면 빨간색
						html += `<td class="sun sCan" index="${count}">${day}</td>`;
					}else if(j===7){							// 토요일(j==7)이면 파란색
						html += `<td class="sat sCan" index="${count}">${day}</td>`;
					} else {									// 월~금요일이면 검은색
						html += `<td class="sCan" index="${count}">${day}</td>`;
					}
				}else{											// 오늘이 달력의 날보다 크면 클릭 할 수 없게 한다.
					html += `<td class="noSelect" index="${count}">${day}</td>`;
				}
				
				
				if (day < lastDate)								// 달력의 날이 달력의 마지막 날보다 작을 때에만 day를 1개씩 늘린다.
					day++;
			} else {
				html += `<td index="${count}">&nbsp;</td>`;				
			}

			count++;				
		}

		html += `</tr>`;
	}
	
	tbody.html(html);
	
	setBindCalBtn();											// 달력을 다 그린 후, 이벤트 생성
//	setBindCalBtn2();
//	$('div.rtimeBtn.stime').unbind('click');
	
};

const setBindCalBtn = () => {
	const btns1 = $('.sCan').bind('click',function() {
		const obj = $(this);		
		const day = obj.html();								// 달력 요일
		const sday = $('td.selColor').html();				// 달력 요일
		const today = new Date().getDate().toString();					// 오늘 요일
		const index =  obj.attr('index');					// 초기화 기준을 찾기 위한 인덱스
		const btns1 = $('#cal tbody td');					
		const time = $('div[time]');						// .rtimeBtn의 값. 1130 str형태
		const tTime =  new Date().getHours().toString().slice(-2)+new Date().getMinutes().toString().slice(-2);	 // 시간값 비교를 위한 값 1130

		// 전에 클릭한 버튼이 아닐경우 모든 버튼 초기화
		btns1.not(`:eq(${index})`).removeClass('selColor').removeData();
		
		time.removeClass('stime');
		time.removeClass('noSelect_t');

		// 클릭상태면
		if (obj.data('click') && obj.data('click') === true) {
			obj.removeData().removeClass('selColor');
			time.css('display','none');
			$('#t').css('display','inline');
		// 클릭 전이면
		} else {
			obj.data('click', true).addClass('selColor');
			$('#t').css('display','none');
			time.css('display','inline-block');
			const tdate = new Date();
			const sdate = new Date(parseInt($('#year').html()), parseInt($('#month').html() - 1), parseInt($('td.selColor').html()));
			const edate = Date.parse($('#year').html()+'-'+(parseInt($('#month').html())+1).toString()+'-'+tdate.getDate() );
			const ttime = tdate.getHours().toString().slice(-2)+tdate.getMinutes().toString().slice(-2);
			
			time.each(function(i,t) {
				// 선택날이 오늘이면, 현재 시간보다 나중 시간만 예약을 할 수 있다.
				if (tdate.getDate() === sdate.getDate() && parseInt(ttime) < parseInt($(t).attr('time'))) {
					$(t).addClass('stime');
				} else if (tdate.getDate() !== sdate.getDate() && tdate.getTime() < sdate.getTime() && edate > tdate.getTime()) { 	// 선택날이 오늘이 아니고, 오늘로부터 한 달 뒤까지만
					$(t).addClass('stime');					
				} else {
					$(t).addClass('noSelect_t');
				}
			});
			let rv='';
			if($('#month').length===1)
				rv=$('#year').html().substring(2)+'/'+(0+$('#month').html())+'/'+$('td.selColor').html();
			else
				rv=$('#year').html().substring(2)+'/'+$('#month').html().substring(-2)+'/'+$('td.selColor').html();
			$("#rdate").attr('value',rv);
			
			$('div.rtimeBtn.stime').unbind('click');
			$('div.rtimeBtn.stime').bind('click',function(){
				const obj = $(this);
				$('div.stime').removeClass('selColor').removeData();

				// 클릭상태면
				if(obj.attr('click') && obj.attr('click') === 'true'){
					$('.stime').removeAttr('click').removeClass('selColor');
				// 클릭전이면
				} else{
					obj.attr('click', 'true')
					obj.addClass('selColor');
				}
				const tv=$('div.selColor').attr('time');
				$('#rtime').attr('value',tv);
				
			});
		}
	});
//	const btns2 = $('div.stime').bind('click',function() {
//		const obj2 = $(this);		
//		
//		obj2.removeClass('selColor');
//		
//		if(obj2.data('click') && obj2.data('click')===true){
//			obj2.removeData().removeClass('selColor');
//		}else{
//			obj2.data('click',true);
//			obj2.addClass('selColor');
//		}
//	});
};


const setDate = (oper = 1) => {		// 기본값 1
	const year = $('#year');
	const month = $('#month');
	const now = new Date();								
	const date = new Date(parseInt(year.html()), parseInt(month.html()) - 1, 1);
	const nextDate = ((now.getMonth() === date.getMonth()) ? new Date(date.getFullYear(), date.getMonth() + oper, now.getDate()) : new Date(date.getFullYear(), date.getMonth() + oper, 1));

//	year.find(`option[value=${nextDate.getFullYear()}]`).prop('selected', true);
//	month.find(`option[value=${nextDate.getMonth() + 1}]`).prop('selected', true);
	year.html(nextDate.getFullYear())
	month.html(nextDate.getMonth()+1)
	drawCalendar(nextDate);
};
function check(){
	var rname=document.getElementsByName("rname")[0]
	var rphone=document.getElementsByName("rphone")[0]
	var rdate=document.getElementsByName("rdate")[0]
	var rtime=document.getElementsByName("rtime")[0]
	//var pwd=document.getElementsByName("pwd")[0]
	
	if(rname.value==''){
		alert('이름을 입력해 주세요');
		rname.value='';
		rname.focus();
		return false;
	}else if(rphone.value==''){
		alert('핸드폰 번호를 입력해주세요')
		rphone.value='';
		rphone.focus();
		return false;
	}else if(rdate.value==""){
		alert('예약일을 선택해주세요')
		return false;
	}else if(rtime.value==""){
		alert('시간을 선택해주세요')
		return false;
	}else{return true}
}


// 실제 실행시키는 곳. 페이지가 로딩 되었을 때 그려라.
$(function(){

	setSelect();
	drawCalendar();
	
	$('#prev').bind('click', () => {
		setDate(-1);
	});

	$('#next').bind('click', () => {
		setDate();
	});
	var sdate=$('#rdate').val().substring(0,10).split('-')
	if(parseInt(sdate[1])!=$('#month').html()){
		$('#next').trigger('click')
	}
	$("#rphone").keyup(function(e) {
		var reg = /[^0-9]/gi;
		var v = $(this).val();
		        if (reg.test(v)) {		
		            $(this).val(v.replace(reg, ''));
		            $(this).focus();
		        }
		});
	var sd=$('input[name=rdate]').val().split('');
	$('td.sCan').each(function(index,d){
		if((sd[8]+sd[9])===$(d).html()){
			$(d).trigger('click');
//			$(d).addClass('selColor')
//			$(d).data('click',true)
		}
	})
//	$('#t').css('display','none');
//	$('.rtimeBtn').css('display','inline-block');
	$('.rtimeBtn').each(function(index,d){
		if($('input[name=rtime]').val()===$(d).attr('time')){
			$(d).trigger('click');
//			$(d).attr('click','true')
//			$(d).addClass('selColor')
		}
	})
	$('#adult option').each(function(index,d){	
		if($('#rdault_cnt').val()===$(d).val()){ 
			$(d).attr("selected","selected");
		}
	})
	$('#child option').each(function(index,d){	
		if($('#rchild_cnt').val()===$(d).val()){ 
			$(d).attr("selected","selected");
		}
	})
	$('select[name=reat] option').each(function(index,d){	
		if($('#reat').val()===$(d).val()){ 
			$(d).attr("selected","selected");
		}
	})
//	$('input[type=submit]').bind('click', function(e){
//		e.preventDefault();
//	});
	
//	$('div.rtimeBtn.stime').bind('cilick',function(){
//		const btns2 = $('#detail td.input div');
//		
//		$(this).removeClass('selColor');
//		
//		if($(this).data('click') && $('.stime').data('click')===true){
//			$(this).removeData().removeClass('selColor');
//		}else{
//			$(this).data('click', true);
//			$(this).addClass('selColor');
//		}
//	});
	
	// 년도와 월이 바뀌면 새로 그려라
//	$('#year, #month').bind('change', () => {
//		const y = $('#year').html();
//		const m = $('#month').html();
//		const today = getToday(y, m - 1); 
//		const date = new Date(y, m - 1, today);
//
//		drawCalendar(date);
//	});

//	$('#today').bind('click', () => {
//		const year = $('#year');
//		const month = $('#month');
//		const date = new Date();
//		const y = date.getFullYear();
//		const m = date.getMonth() + 1;
//
//		year.find(`option[value=${y}]`).prop('selected', true);
//		month.find(`option[value=${m}]`).prop('selected', true);
//		
//		drawCalendar(date);
//	});
});
	