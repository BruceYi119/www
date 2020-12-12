<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
<%-- <%@ include file="/include/top.jsp" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Header header = new Header();
String css = header.getCss();
String js = header.getJs();
String title = header.getTitle();
String headerUrl = header.getHeaderUrl();

Nav nav = new Nav();
String menu = nav.getMenu();

Footer footer = new Footer();
String footerUrl = footer.getFooterUrl();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title><%=title%></title>
<%=css%>
<%=js%>
<style>
body {
	margin: 0;
}

.base_wrap #container {
	width: 100%;
	height: 800px;
	padding: 10px;
	/*background:blue;*/
}

.base_wrap #all {
	width: 890px;
	height: 800px;
	margin: auto;
	position: relative;
}

.base_wrap #one {
	width: 400px;
	height: 600px;
	/*background:red;*/
	float: left;
}

.base_wrap textarea {
	width: 382px;
	height: 305px;
	resize: none;
	margin: 8px 6px;
	border: 2px solid black;
}

.base_wrap #one #one1 {
	width: 400px;
	text-align: center;
}

.base_wrap #ct {
	float: left;
	margin: 5px;
	padding-top: 140px;
	/*background:green;*/
	width: 80px;
}

.base_wrap #btn1, #btn2 {
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-left: 5px;
	margin-bottom: 10px;
}

.base_wrap #two {
	width: 400px;
	height: 600px;
	/*background:orange;*/
	float: left;
}

.base_wrap #two #two1 {
	width: 400px;
	text-align: center;
}

.base_wrap #outp {
	width: 382px;
	height: 305px;
	margin: 8px;
	background: white;
	border: 2px solid black;
}

.base_wrap .clearBoth {
	clear: both;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script>
	var inp = '';
	var slang = '';
	var tlang = '';
	var slan = '';
	var tlan = '';
	var tl = '';

	$(function() {
		slang = $("#language1 option:selected").val();
		tlang = $("#language2 option:selected").val();

		$('#inp')
				.keyup(
						function() {
							inp = $(this).val();
							slang = $("#language1 option:selected").val();
							tlang = $("#language2 option:selected").val();

							if (inp.length == 0)
								return false;

							else {
								$
										.ajax(
												{
													type : "GET",
													url : "https://dapi.kakao.com/v3/translation/language/detect",
													headers : {
														"Authorization" : "KakaoAK dde51d95a66537ba6dbcec464d38cea3"
													},
													data : {
														"query" : inp
													}
												})
										.done(
												function(msg) {

													console
															.log(msg.language_info[0].code);
													if (inp == '')
														$(this).val('');
													slan = msg.language_info[0].code;
													if (slan == "kr"
															|| slan == "en"
															|| slan == "cn"
															|| slan == "jp"
															|| slan == "fr"
															|| slan == "de"
															|| slan == "es")
														slang = $("#language1")
																.val(slan);
													else {
														slan = "kr";
														slang = $("#language1")
																.val(slan);
													}
													if (tlang == "kr"
															|| tlang == "en") {
														if (slan != "kr") {
															tlan = "kr"
														} else if (slan == "kr"
																&& tlan == "kr") {
															tlan = "en";
														}
														tlang = $("#language2")
																.val(tlan);
													}

													console.log(slan, tlan)
												});
							}
						});

		$('#language1').change(function() {
			slang = $("#language1 option:selected").val();
		})

		$('#language2').change(function() {
			tlang = $("#language2 option:selected").val();
		})

		$('#btn1')
				.click(
						function() {
							if (slang == tlang)
								return false;

							if (inp == "")
								return false;
							else {

								slang = $("#language1 option:selected").val();
								tlang = $("#language2 option:selected").val();

								$
										.ajax(
												{
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
												})
										.done(
												function(msg) {
													$("#outp").empty();
													console
															.log(msg.translated_text[0][0]);
													$("#outp")
															.append(
																	"<strong>"
																			+ msg.translated_text[0][0]
																			+ "</strong>");
												});
							}
						})
		$("#btn2").click(function() {
			$("#inp").val('');
			$("#outp").empty();
			slang = $("#language1").val("en");
			tlang = $("#language2").val("kr");
		})

	});
</script>
</head>
<body>
	<input type="hidden" id="color_class" value="wooram" />
	<div id="wrap">
		<jsp:include page="<%=headerUrl%>" flush="true" />
		<nav>
			<div class="base_wrap">
				<%=menu%>
			</div>
		</nav>
		<main>
			<div class="base_wrap">
				<!-- 			여기 h2부터 table까지 입력하는 곳 -->
				<h2 align="center">우람 번역기</h2>
				<div id="container" method="get">
					<div id="all">
						<div id="one">
							<div id="one1">
								<span id="f11">원본언어</span> <select id="language1"
									name="language1">
									<option value="kr">한국어</option>
									<option value="en" selected>영어</option>
									<option value="cn">중국어</option>
									<option value="jp">일본어</option>
									<option value="fr">프랑스어</option>
									<option value="de">독일어</option>
									<option value="es">스페인어</option>
								</select>
							</div>
							<div class="clearBoth"></div>
							<textarea id="inp" name="inp" placeholder="번역할 내용을 입력하세요"></textarea>

						</div>
						<div id="ct">
							<div class="clearBoth"></div>
							<input type="button" id="btn1" value="번역하기"> <input
								type="button" id="btn2" value="새로고침">
						</div>
						<div id="two">
							<div id="two1">
								<span id="f22">번역언어</span> <select id="language2"
									name="language2">
									<option value="kr" selected>한국어</option>
									<option value="en">영어</option>
									<option value="cn">중국어</option>
									<option value="jp">일본어</option>
									<option value="fr">프랑스어</option>
									<option value="de">독일어</option>
									<option value="es">스페인어</option>
								</select>
							</div>
							<div class="clearBoth"></div>
							<div id="outp"></div>
							<div class="clearBoth"></div>
						</div>
					</div>
				</div>
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="true" />
	</div>
</body>
</html>