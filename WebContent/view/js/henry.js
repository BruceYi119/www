function showUpdate(k) {
	document.getElementsByClassName('updateBox')[k].style.display = "inline-block";
	document.getElementsByClassName('storybox')[k].style.display = "none";
}

function mymoviedel()
{
	var del = confirm("영화를 삭제하면 스토리까지 모두 삭제됩니다. 영화를 삭제하시겠습니까?");
	if (del == true) 
	{
		return true;
	}
	else
	{
		return false;
	}
}

function mystorydel()
{
	var del = confirm("스토리를 삭제하시겠습니까?");
	if (del == true) 
	{
		return true;
	}
	else
	{
		return false;
	}
}

function mystoryupdate()
{
	var del = confirm("스토리를 수정하시겠습니까?");
	if (del == true) 
	{
		return true;
	}
	else
	{
		return false;
	}
}


