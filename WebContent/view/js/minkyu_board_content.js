function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

var sbno = getParameterByName("sbno");

function goodbutton() {
 	alert("공감하셨습니다");
 	location.href="board_good.jsp?sbno="+sbno;
}
 function badbutton() {
 	alert("비공감하셨습니다");
 	location.href="board_bad.jsp?sbno="+sbno;
}
 function link() {
 	location.href="sss.jsp";
}
function view_del(){
	   var x=event.clientX;
	   var y=event.clientY;
	   document.getElementById("del").style.visibility="visible";
	   document.getElementById("del").style.left=(x-30)+"px";//좌표주기
	   document.getElementById("del").style.top=(y+30)+"px";//좌표주기
	}
function fail(){
	alert("비밀번호가 틀렸습니다")
}

function list1() {
	location="board.jsp";
}
function update1() {
	location="board_update.jsp?sbno="+sbno;

}

function check(my) {
	
	if(my.name.value.length == 0){
		alert("이름이 비였네요");
		return false;
	}
	if(my.content.value.length == 0){
		alert("내용이 비였네요");
		return false;
	}
}