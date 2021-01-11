<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#com{
	color:red;
}
</style>
</head>
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
  
 <script type="text/javascript">
 $(document).ready(function(){
   $(".search").click(function () {
  	$.ajax({
	  method: "GET",
 	  url: "	https://opendart.fss.or.kr/api/fnlttSinglAcnt.json",
 	  data: { crtfc_key: "5ab4e63a83a32aebf3ccb64f65f2d7f8887d921d", corp_code: $("#stockname").val(), bsns_year: "2020", reprt_code:"11012"}
 	})
 	  .done(function( msg ) {
	    console.log(msg);
  	    var url = "http://dart.fss.or.kr/dsaf001/main.do?rcpNo=";
//  		$( "p" ).append( "<strong>"+url+msg.list[0].rcept_no+"</strong>" );
 		$( "p" ).append( "<a href="+url+msg.list[0].rcept_no+" target=_blank>"+"공시확인하기</a>" );
//   	  	location.href = "url+msg.list[0].rcept_no";
 	  });
   });
   $('#hr').trigger('click');
 });
 

</script>
 
<body>
	<%
	String code = request.getParameter("code");
	%>
	<h1>전자공시Dart</h1>
	<input id="stockname" value="<%=code %>" type="text">
	<button id="hr" class="search">검색</button></br>
	공시 결과가 없는 기업은 주식시장에 상장되어 있지 않은 기업입니다. </br>
	본 서비스는 <span id="com">주식시장에 상장되어 있는 기업</span>만 전자 공시만 확인 가능 합니다.
	<p id="hr1"></p>
	
	
	
</body>
</html>