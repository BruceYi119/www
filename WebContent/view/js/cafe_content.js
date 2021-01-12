var click = true;
var likechk = new XMLHttpRequest();

function view_del()
{	
	//alert(event.clientX+" "+event.clientY)
   	var x=event.clientX;
    var y=event.clientY;
	document.getElementById("del").style.visibility="visible";
    document.getElementById("del").style.left=(x-85)+"px";
    document.getElementById("del").style.top=(y-28)+"px";
}

function overClick(cno) {
	var likeCnt = $('#likeCnt');

	$.post('/view/wooram/liked.jsp', { cno: cno }, function(data){
		likeCnt.html(data);
	});
}

function update(cdno,dname,dcontent)
{
	document.up.cdno.value=cdno;
	document.up.dname.value=dname;
	document.up.dcontent.value=dcontent;
	    document.getElementById("dat_up").style.visibility="visible";
	document.getElementById("dat_up").style.position="relative";

}
function ddel(cdno)
{
	document.del.cdno.value=cdno;
   	var x=event.clientX;
	    var y=event.clientY;
	    document.getElementById("dat_del").style.visibility="visible";
    document.getElementById("dat_del").style.left=(x-10)+"px";
    document.getElementById("dat_del").style.top=(y+10)+"px";
}