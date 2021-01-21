var click = true;
var likechk = new XMLHttpRequest();

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
	document.getElementById("dat_write").style.visibility="hidden";
	document.getElementById("dat_write").style.position="absolute";

}
function ddel(cdno)
{
	document.del.cdno.value=cdno;

}