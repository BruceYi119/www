// 기본함수
$(function(){

	var cpu = $('select[name=cpu]');
	var vga = $('select[name=vga]');
	var power = $('select[name=power]');
	var mb = $('select[name=mb]');
	var ram1 = $('select[name=ram1]');
	var ram2 = $('select[name=ram2]');
	var hdd = $('select[name=hdd]');
	var ssd = $('select[name=ssd]');
	var price = $('select[name=price]');
	
	// cpu
	// cpu 기업선택 후 세대 창 보이기	
	$('#cpu_com').bind('change', function(){
		var com = $(this);
		var value = parseInt(com.val());
		var amd_gen = $('#amd_gen');
	    var intel_gen = $('#intel_gen');

		if (value === 1) 
		{
		  amd_gen.show(0);
		  intel_gen.hide(0);
		} 
		else if (value === 2) 
		{
		  amd_gen.hide(0);
		  intel_gen.show(0);
		} 
		else 
		{
			alert("기업을 선택하시오");
		}
	});
	
	// cpu amd-세대선택 후 관련 제품창 보이기	
	$('#amd_gen').bind('change', function(){
		var a_gen = $(this);
		var value = parseInt(a_gen.val());
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
	
	// cpu intel-세대선택 후 관련 제품창 보이기	
	$('#intel_gen').bind('change', function(){
		var i_gen = $(this);
		var value = parseInt(i_gen.val());
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
	
	// mb
	// mb 기업 선택 후 제품군 보이기
	$('#mb_com').bind('change', function(){
		var m_com = $(this);
		var value = parseInt(m_com.val());
		var optionHtml = ``;

		// 0일때는 alert띄우고 종료
		if (value === 0) 
		{
			alert("기업을 선택하시오");
			return false;
		}

		else if(value === 1)
		{
			mbs.mboard[`gigabyte`].forEach(function(v,i) {
				optionHtml += `<option value='${v}'>${v}</option>`;
				console.log(optionHtml);
			});
		}
		
		else if(value === 2)
		{
			mbs.mboard[`asus`].forEach(function(v,i) {
				optionHtml += `<option value='${v}'>${v}</option>`;
				console.log(optionHtml);
			});
		}
		
		else if(value === 3)
		{
			mbs.mboard[`msi`].forEach(function(v,i) {
				optionHtml += `<option value='${v}'>${v}</option>`;
				console.log(optionHtml);
			});
		}
		
		else if(value === 4)
		{
			mbs.mboard[`asrock`].forEach(function(v,i) {
				optionHtml += `<option value='${v}'>${v}</option>`;
				console.log(optionHtml);
			});
		}
			
		mb.html(optionHtml).show();
	});
	
	// vga
	// vga 브랜드선택 후 시리즈 창 보이기	
	$('#vga_com').bind('change', function(){
		var com = $(this);
		var value = parseInt(com.val());
		var radeon_series = $('#radeon_series');
	    var nvidia_series = $('#nvidia_series');

		if (value === 1) 
		{
			radeon_series.show(0);
			nvidia_series.hide(0);
		} 
		else if (value === 2) 
		{
			radeon_series.hide(0);
			nvidia_series.show(0);
		} 
		else 
		{
			alert("브랜드를 선택하시오");
		}
	});
	
	// vga radeon-브랜드선택 후 관련 제품창 보이기	
	$('#radeon_series').bind('change', function(){
		var ra_series = $(this);
		var value = parseInt(ra_series.val());
		var optionHtml = ``;

		// 0일때는 alert띄우고 종료
		if (value === 0) {
			alert("시리즈를 선택하시오");
			return false;
		}

		// 0이아니면 해당 데이터를 option으로 만들어줌
		vgas.radeon[`ra${value}`].forEach(function(v,i) {
			optionHtml += `<option value='${v}'>${v}</option>`;
			console.log(optionHtml);
		});

		vga.html(optionHtml).show();
	});
	
	
	// vga nvidia-브랜드선택 후 관련 제품창 보이기	
	$('#nvidia_series').bind('change', function(){
		var nv_series = $(this);
		var value = parseInt(nv_series.val());
		var optionHtml = ``;

		// 0일때는 alert띄우고 종료
		if (value === 0) {
			alert("시리즈를 선택하시오");
			return false;
		}

		// 0이아니면 해당 데이터를 option으로 만들어줌
		vgas.nvidia[`nv${value}`].forEach(function(v,i) {
			optionHtml += `<option value='${v}'>${v}</option>`;
			console.log(optionHtml);
		});

		vga.html(optionHtml).show();
	});
	
	// power
	// power 브랜드 선택 후 제품군 보이기
	$('#power_com').bind('change', function(){
		var p_com = $(this);
		var value = parseInt(p_com.val());
		var optionHtml = ``;

		// 0일때는 alert띄우고 종료
		if (value === 0) 
		{
			alert("브랜드를 선택하시오");
			return false;
		}

		else if(value === 1)
		{
			powers.pw[`ssesonic`].forEach(function(v,i) {
				optionHtml += `<option value='${v}'>${v}</option>`;
				console.log(optionHtml);
			});
		}
		
		else if(value === 2)
		{
			powers.pw[`delta`].forEach(function(v,i) {
				optionHtml += `<option value='${v}'>${v}</option>`;
				console.log(optionHtml);
			});
		}
		
		else if(value === 3)
		{
			powers.pw[`antec`].forEach(function(v,i) {
				optionHtml += `<option value='${v}'>${v}</option>`;
				console.log(optionHtml);
			});
		}
				
		power.html(optionHtml).show();
	});
	
	// ram1
	// ram1 브랜드 선택 후 제품군
	$('#ram1_com').bind('change', function(){
		var r1_com = $(this);
		var value = parseInt(r1_com.val());
		var optionHtml = ``;

		// 0일때는 alert띄우고 종료
		if (value === 0) 
		{
			alert("브랜드를 선택하시오");
			return false;
		}

		else if(value === 1)
		{
			ram1s.ra1[`samsung`].forEach(function(v,i) {
				optionHtml += `<option value='${v}'>${v}</option>`;
				console.log(optionHtml);
			});
		}
		
		else if(value === 2)
		{
			ram1s.ra1[`gskill`].forEach(function(v,i) {
				optionHtml += `<option value='${v}'>${v}</option>`;
				console.log(optionHtml);
			});
		}
		
		else if(value === 3)
		{
			ram1s.ra1[`corsair`].forEach(function(v,i) {
				optionHtml += `<option value='${v}'>${v}</option>`;
				console.log(optionHtml);
			});
		}
				
		ram1.html(optionHtml).show();
	});
	
	// ram2
	// ram2 브랜드 선택 후 제품군
	$('#ram2_com').bind('change', function(){
		var r2_com = $(this);
		var value = parseInt(r2_com.val());
		var optionHtml = ``;

		// 0일때는 alert띄우고 종료
		if (value === 0) 
		{
			alert("브랜드를 선택하시오");
			return false;
		}

		else if(value === 1)
		{
			ram2s.ra2[`samsung`].forEach(function(v,i) {
				optionHtml += `<option value='${v}'>${v}</option>`;
				console.log(optionHtml);
			});
		}
		
		else if(value === 2)
		{
			ram2s.ra2[`gskill`].forEach(function(v,i) {
				optionHtml += `<option value='${v}'>${v}</option>`;
				console.log(optionHtml);
			});
		}
		
		else if(value === 3)
		{
			ram2s.ra2[`corsair`].forEach(function(v,i) {
				optionHtml += `<option value='${v}'>${v}</option>`;
				console.log(optionHtml);
			});
		}
				
		ram2.html(optionHtml).show();
	});
	
	
	// hdd
	// hdd 브랜드 선택 후 제품군
	$('#hdd_com').bind('change', function(){
		var hd_com = $(this);
		var value = parseInt(hd_com.val());
		var optionHtml = ``;

		// 0일때는 alert띄우고 종료
		if (value === 0) 
		{
			alert("브랜드를 선택하시오");
			return false;
		}

		else if(value === 1)
		{
			hdds.hd[`samsung`].forEach(function(v,i) {
				optionHtml += `<option value='${v}'>${v}</option>`;
				console.log(optionHtml);
			});
		}
		
		else if(value === 2)
		{
			hdds.hd[`toshiba`].forEach(function(v,i) {
				optionHtml += `<option value='${v}'>${v}</option>`;
				console.log(optionHtml);
			});
		}
		
		else if(value === 3)
		{
			hdds.hd[`mgtec`].forEach(function(v,i) {
				optionHtml += `<option value='${v}'>${v}</option>`;
				console.log(optionHtml);
			});
		}
		
		else if(value === 4)
		{
			hdds.hd[`seagate`].forEach(function(v,i) {
				optionHtml += `<option value='${v}'>${v}</option>`;
				console.log(optionHtml);
			});
		}
		
		else if(value === 5)
		{
			hdds.hd[`wd`].forEach(function(v,i) {
				optionHtml += `<option value='${v}'>${v}</option>`;
				console.log(optionHtml);
			});
		}
				
		hdd.html(optionHtml).show();
	});
	
	// ssd
	// ssd 기업 선택 후 제품군
	$('#ssd_com').bind('change', function(){
		var sd_com = $(this);
		var value = parseInt(sd_com.val());
		var optionHtml = ``;

		// 0일때는 alert띄우고 종료
		if (value === 0) 
		{
			alert("브랜드를 선택하시오");
			return false;
		}

		else if(value === 1)
		{
			ssds.sd[`samsung`].forEach(function(v,i) {
				optionHtml += `<option value='${v}'>${v}</option>`;
				console.log(optionHtml);
			});
		}
		
		else if(value === 2)
		{
			ssds.sd[`biostar`].forEach(function(v,i) {
				optionHtml += `<option value='${v}'>${v}</option>`;
				console.log(optionHtml);
			});
		}
		
		else if(value === 3)
		{
			ssds.sd[`micron`].forEach(function(v,i) {
				optionHtml += `<option value='${v}'>${v}</option>`;
				console.log(optionHtml);
			});
		}
				
		ssd.html(optionHtml).show();
	});
	
});//여기 까지가 기본함수


// 기업, 시리즈 선택 후 cpu 제품군 리스트
var cpus = {
	intel : {
		intel8  : ['i7-8086K','i7-8700K','i7-8700','i5-8600K','i5-8600','i5-8500','i5-8400','i3-8350K','i3-8300','i3-8100'],
		intel9  : ['i9-9900KS','i9-9900K','i9-9900','i7-9700K','i7-9700','i5-9600K','i5-9600','i5-9500','i5-9400','i3-9350K','i3-9320','i3-9300','i3-9100'],
		intel10 : ['i9-10900K','i9-10900','i9-10850K','i7-10700K','i7-10700','i5-10600K','i5-10600','i5-10500','i5-10400','i3-10320','i3-10300','i3-10100']
	},
	
	amd : {
		amd2: ['ryzen7 2700X','ryzen7 2700','ryzen5 2600X','ryzen5 2600'],
		amd3: ['ryzen9 3950X','ryzen9 3900XT','ryzen9 3900X','ryzen7 3800XT','ryzen7 3800X','ryzen7 3700X','ryzen5 3600XT','ryzen5 3600X','ryzen5 3600','ryzen5 3500X','ryzen5 3500'],
		amd4: ['ryzen9 5950X','ryzen9 5900X','ryzen7 5800X','ryzen5 5600X']
	}
};


// 기업, 시리즈 선택 후 vga 제품군 리스트
var vgas = {	
		radeon : {
			ra5000: ['rx5500xt','rx5600xt','rx5700','rx5700xt'],
			ra6000: ['rx6800','rx6800xt','rx6900xt']
		},

		nvidia : {
			nv1600 : ['gtx1660-super','gtx1650-super'],
			nv2000 : ['rtx2060','rtx2060 super','rtx2070','rtx2070 super','rtx2080','rtx2080 super','rtx2080ti'],
			nv3000 : ['rtx3060','rtx3060ti','rtx3070','rtx3070','rtx3080','rtx3090']
		}
	};

// 기업 선택 후 mb 제품군 리스트
var mbs = {	
		mboard : {
			gigabyte: ['gigabyte x370','gigabyte b350','gigabyte a320','gigabyte x470','gigabyte b450','gigabyte x570','gigabyte b550','gigabyte a520'],
			asus    : ['asus x370','asus b350','asus a320','asus x470','asus b450','asus x570','asus b550','asus a520'],
			msi     : ['msi x370','msi b350','msi a320','msi x470','msi b450','msi x570','msi b550','msi a520'],
			asrock  : ['asrock x370','asrock b350','asrock a320','asrock x470','asrock b450','asrock x570','asrock b550','asrock a520']
		}
	};

// 기업 선택 후 power 제품군 리스트
var powers = {	
		pw : {
			ssesonic: ['seasonic550w','seasonic600w','seasonic650w','seasonic700w','seasonic750w','seasonic850w'],
			delta   : ['delta550w','delta600w','delta650w','delta700w','delta750w','delta800w','delta850w'],
			antec   : ['antec550w','antec600w','antec650w','antec700w','antec750w','antec800w','antec850w']
		}
	};

// 기업 선택후 ram1 제품군 리스트
var ram1s = {
		ra1 : {
		    samsung : ['samsung-ram8gb','samsung-ram16gb'],
		    gskill :  ['g.skill-ram8gb','g.skill-ram16gb'],
		    corsair : ['corsair-ram8gb','corsair-ram16gb']
		}
};

// 기업 선택후 ram2 제품군 리스트
var ram2s = {
		ra2 : {
		    samsung : ['samsung-ram8gb','samsung-ram16gb'],
		    gskill :  ['g.skill-ram8gb','g.skill-ram16gb'],
		    corsair : ['corsair-ram8gb','corsair-ram16gb']
		}
};

// 기업 선택후 hdd 제품군 리스트
var hdds = {
		hd : {
		    samsung : ['samsung hdd 500gb','samsung hdd 1tb','samsung hdd 2tb','samsung hdd 3tb'],
		    toshiba : ['toshiba hdd 500gb','toshiba hdd 1tb','toshiba hdd 2tb','toshiba hdd 3tb'],
		    mgtec   : ['mgtec hdd 500gb','mgtec hdd 1tb','mgtec hdd 2tb','mgtec hdd 3tb'],
		    seagate : ['seagate hdd 500gb','seagate hdd 1tb','seagate hdd 2tb','seagate hdd 3tb'],
		    wd      : ['wd hdd 500gb','wd hdd 1tb','wd hdd 2tb','wd hdd 3tb']
		}
};

//기업 선택후 SSD 제품군 리스트
var ssds = {
		sd : {
		    samsung : ['samsung ssd 256gb','samsung ssd 512gb','samsung ssd 1tb','samsung ssd 2tb'],
		    biostar : ['biostar ssd 256gb','biostar ssd 512gb','biostar ssd 1tb','biostar ssd 2tb'],
		    micron :  ['micron ssd 256gb','micron ssd 512gb','micron ssd 1tb','micron ssd 2tb']
		}
};



