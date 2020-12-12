var inp = '';
var slang = '';
var tlang = '';
var slan = '';
var tlan = '';
var tl = '';

$(function() {
	slang = $("#language1 option:selected").val();
	tlang = $("#language2 option:selected").val();

	$('#inp').keyup(function() {
		inp = $(this).val();
		slang = $("#language1 option:selected").val();
		tlang = $("#language2 option:selected").val();

		if (inp.length == 0) {
			return false;
		} else {
			$.ajax({
				type : "GET",
				url : "https://dapi.kakao.com/v3/translation/language/detect",
				headers : {
					"Authorization" : "KakaoAK dde51d95a66537ba6dbcec464d38cea3"
				},
				data : {
					"query" : inp
				}
			}).done(function(msg) {
				console.log(msg.language_info[0].code);
				if (inp == '')
					$(this).val('');
				slan = msg.language_info[0].code;
				if (slan == "kr" || slan == "en" || slan == "cn" || slan == "jp" || slan == "fr" || slan == "de" || slan == "es") {
					slang = $("#language1").val(slan);
				} else {
					slan = "en";
					slang = $("#language1").val("en");
				}
				if (tlang == "kr" || tlang == "en") {
					if (slan != "kr") {
						tlan = "kr";
					} else if (slan == "kr" && tlan == "kr") {
						tlan = "en";
					}
					tlang = $("#language2").val(tlan);
				}

				console.log(slan, tlan);
			});
		}
	});

	$('#language1').change(function() {
		slang = $("#language1 option:selected").val();
	});

	$('#language2').change(function() {
		tlang = $("#language2 option:selected").val();
	});

	$('#btn1').click(function() {
		if (slang == tlang)
			return false;

		if (inp == "") {
			return false;
		} else {
			slang = $("#language1 option:selected").val();
			tlang = $("#language2 option:selected").val();

			$.ajax({
				type : "GET",
				url : "https://dapi.kakao.com/v2/translation/translate",
				headers : {
					"Authorization" : "KakaoAK dde51d95a66537ba6dbcec464d38cea3"
				},
				data : {
					"src_lang" : slang,
					"target_lang" : tlang,
					"query" : inp
				}
			}).done(function(msg) {
				$("#outp").empty();
				console.log(msg.translated_text[0][0]);
				$("#outp").append("<strong>" + msg.translated_text[0][0] + "</strong>");
			});
		}
	});

	$("#btn2").click(function() {
		$("#inp").val('');
		$("#outp").empty();
		slang = $("#language1").val("en");
		tlang = $("#language2").val("kr");
	});
});