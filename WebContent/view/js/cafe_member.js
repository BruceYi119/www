
var chk = $('#chk').val();

$(document).ready(function(){
	
	if(chk=="0")
		alert("카페회원이 아니십니다. 회원가입을 진행해주세요.");

})


function formCheck(my)
{

	
	if(my.nick.value == '')
	{
		alert("닉네임을 적어주세요.")	
		nick.focus();
		return false;
	}
	else if(my.reason.value == '')
	{
		alert("가입동기를 적어주세요.")	
		reason.focus();
		return false;
	}
	else if(my.pobu.value == '')
	{
		alert("가입인사를 작성해주세요.")
		pobu.focus();
		return false;
	}
	else if(my.nick.value.length < 2 || my.nick.value.length > 8 )
	{
		alert("별명은 2자 이상 8자 이내로 작성해주세요")
		nick.focus();
		return false;
	}
	else if(my.n_chk.value==0)
	{
		alert("이미 사용중인 별명입니다.")
		nick.focus();
		return false;
	}
		
}
function formUpCheck(my)
{

	if(my.reason.value == '')
	{
		alert("가입동기를 적어주세요.")	
		reason.focus();
		return false;
	}
	else if(my.pobu.value == '')
	{
		alert("가입인사를 작성해주세요.")
		pobu.focus();
		return false;
	}	
}






var pkc=new XMLHttpRequest();
function nick_check(nick)
{
	
	if(nick.length<2)
	{
		document.getElementById("unick").innerHTML="<br><span style='color:red'> 2글자 이상 가능 </span>"
		document.getElementById("n_chk").value=0;
	}
	else
	{
		pkc.open("get","cafe_nickcheck.jsp?nick="+nick);
		pkc.send();
	
		pkc.onreadystatechange=function()
		{
			if(pkc.readyState==4)
			{
				//alert(pkc.responseText);
				if(pkc.responseText == 0) // 사용가능 아이디
				{
					document.getElementById("unick").innerHTML="<br><span style='color:blue'> 사용 가능 </span>";
					//document.getElementById("sub").disabled=false; //사용하려면 submit에 disabled="disabled" 넣기 disable이면 비활성화
					document.getElementById("n_chk").value=1;
				}
				else
				{
					document.getElementById("unick").innerHTML="<br><span style='color:red'> 이미 사용 중 </span>";
					//document.getElementById("sub").disabled=disabled;
					document.getElementById("n_chk").value=0;
				}
			}
		}
	}
}
