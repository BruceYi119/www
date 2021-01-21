
function main(){
		frm=document.frm;
		if(frm.name.value ==""){
			document.getElementById("name").innerText="이름은 필수 입력 입니다.";
			document.getElementById("name").style.color="red";
			return false;
		}
		if(frm.title.value ==""){
			document.getElementById("title").innerText="제목은 필수 입력 입니다.";
			document.getElementById("title").style.color="red";
			return false;
		}
		if(frm.pwd.value!=frm.pwd2.value){
			alert("비밀번호가 다릅니다");
			return false;
		}
		if(frm.pwd.value ==""){
			alert("비밀번호를 입력하세요")
			return false;
		}
	}


function aaa(my) {
	if(my.pwd.value !=my.pwd2.value){
		document.getElementById("pwc").innerText="비번이 틀립니다";
		document.getElementById("pwc").style.color="blue";
	}else{
		document.getElementById("pwc").innerText="비번이 일치합니다";
		document.getElementById("pwc").style.color="red";
	}
	
}
