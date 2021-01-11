// 기본함수
$(function(){

    var amd2_item = $('#amd2_item');
	var amd3_item = $('#amd3_item');
	var amd4_item = $('#amd4_item');
    var intel8_item = $('#intel8_item');
	var intel9_item = $('#intel9_item');
	var intel10_item = $('#intel10_item');
	var cpu = $('select[name=cpu]');


	// 기업선택 후 세대 창 보이기	
	$('#cpu_com').bind('change', function(){
		var com = $(this);
		var value = parseInt(com.val())
		var amd_gen = $('#amd_gen');
	    var intel_gen = $('#intel_gen');

		if (value === 1) 
		{
		  amd_gen.show(0)
		  intel_gen.hide(0)
		} 
		else if (value === 2) 
		{
		  amd_gen.hide(0)
		  intel_gen.show(0)
		} 
		else 
		{
			alert("기업을 선택하시오");
		}
	});
	
//	 amd-세대선택 후 관련 제품창 보이기	
	$('#amd_gen').bind('change', function(){
		var a_gen = $(this);
		var value = parseInt(a_gen.val())
		var optionHtml = ``;

		// 0일때는 alert띄우고 종료
		if (value === 0) {
			alert("세대를 선택하시오");
			return false;
		}

		// 0이아니면 해당 데이터를 option으로 만들어줌
		cpus.amd[`amd${value}`].forEach(function(v,i) {
			optionHtml += `<option value='${v}'>${v}</option>`;
			console.log(optionHtml);
		});

		cpu.html(optionHtml).show();
	});
	
	// intel-세대선택 후 관련 제품창 보이기	
	$('#intel_gen').bind('change', function(){
		var i_gen = $(this);
		var value = parseInt(i_gen.val())
		var cpu = $('select[name=cpu]');
		var optionHtml = ``;
		
	    // 0일때는 alert띄우고 종료
		if (value === 0) {
			alert("세대를 선택하시오");
			return false;
		}
		// 0이아니면 해당 데이터를 option으로 만들어줌
		cpus.intel[`intel${value}`].forEach(function(v,i) {
			optionHtml += `<option value='${v}'>${v}</option>`;
			console.log(optionHtml);
		});

		cpu.html(optionHtml).show();
	});
	
});

//세대 선택 후 cpu 제품군 리스트
var cpus = {
	intel : {
		intel8  : ['i7-8086K','i7-8700K','i7-8700','i5-8600K','i5-8600','i5-8500','i5-8400','i3-8350K','i3-8300','i3-8100'],
		intel9  : ['i9-9900KS','i9-9900K','i9-9900','i7-9700K','i7-9700','i5-9600K','i5-9600','i5-9500','i5-9400','i3-9350K','i3-9320','i3-9300','i3-9100'],
		intel10 : ['i9-10900K','i9-10900','i9-10850K','i7-10700K','i7-10700','i5-10600K','i5-10600','i5-10500','i5-10400','i3-10320','i3-10300','i3-10100']
	},
	
	amd : {
		amd2: ['2700X','2700','2600X','2600','2500X','2300X'],
		amd3: ['3990X','3970X','3960X','3950X','3900XT','3900X','3800XT','3800X','3700X','3600XT','3600X','3600','3500X','3500','3300X','3100'],
		amd4: ['5950X','5900','5800X','5600X']
	}
};

