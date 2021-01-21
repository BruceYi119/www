	function formCheck(my) {

		if (my.title.value.length == 0) { // null인지 비교한 뒤
			alert('제목을 입력하세요'); // 경고창을 띄우고
			//title.focus();    // 해당태그에 포커스를 준뒤
			return false; // false를 리턴합니다.
		}
		if (my.name.value.length == 0) {
			alert('닉네임을 입력하세요');
			//writer.focus();            
			return false;
		}

		// 글작성폼에 내용을 추가하였습니다. 게시판에 글내용은 당연히 있어야겠죠?
		// 추가할 html코드 : content : <textarea rows="10" cols="20" name="content"></textarea><br>

		if (my.content.value.length == 0) {
			alert('내용을 입력하세요');
			//content.focus();
			return false;
		}

		if (my.pwd.value.length == 0) {
			alert('비밀번호를 입력하세요');
			//pwd.focus();
			return false;
		}
		if (my.writype.value.length == 0) {
			alert('글종류를 선택하세요');
			//writype.focus();
			return false;
		}
		if (my.animal.value.length == 0) {
			alert('동물종류를 선택하세요');
			//animal.focus();
			return false;
		}
	}