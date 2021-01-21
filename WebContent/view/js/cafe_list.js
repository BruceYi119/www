var chk = $('#chk').val();
var nick = $('#nick').val();

$(document).ready(function(){
	
	if(chk=="1"){
		alert( nick+"님 방문을 환영합니다."); 
	}else if(chk=="0")
		alert("회원이 아니십니다. 가입하기 버튼을 눌러주세요.");
})

