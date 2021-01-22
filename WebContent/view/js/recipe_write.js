
function check(){
	var cate=$('select option:selected').val(); 
	var title=document.getElementsById("title")
	var intro=document.getElementsByName("intro")
	var ingre=document.getElementsByClassName("ingredients")
	var step=document.getElementsById("step")[0]
	
	if(cate=='0') {
		$("#cateMsg").show();
	    return false;
	}
	if(title.value==''){
		$("#titMsg").show();
		alert("제목을 입력하세요");
		title.focus();
		return false;
	}else if(intro==''){
		$("#introMsg").show();
		alert("음식소개를 입력하세요");
		intro.focus();
		return false;
	}else if(ingre.value==""){
		$("#ingreMsg").show();
		alert("재료를 모두 입력하세요");
		ingre.focus();
		return false;
	}else if(cont.value==""){
		$("#stepMsg").show();
		alert("요리순서를 모두 입력하세요");
		cont.focus();
		return false;
	}else
		return true
}

/*이미지 업로드 버튼
$( ".getImg" ).click(function() {
	var obj = $(this);
	var prevObj = obj.prev();
	prevObj.click();
});
*/
/*메인재료추가*/
function addMainIngre() {
	var input = '<span class="el"><input type="text" name="ingredients" class="ingredients" placeholder="예) 돼지고기 400g" /> <input type="button" class="delIngre" value="X" /></span>';

	$(input).appendTo($('.ingre_container'));
};

/*재료삭제버튼*/
function delIngreBtn() {
	$('.ingre_container').on('click', 'input.delIngre', function(){
		var obj = $(this);
		var prevObj = obj.prev();
		var parObj = obj.parent();

		obj.remove();
		prevObj.remove();
		parObj.remove();
	});
};

/*요리순서추가*/
function addContent(){
	var input = '<div class="contInner"> <div class="imgUpload"><img class="img" width="200" height="200" alt=""> <div class="imgBtn"> <input type="file" class="addImg" required="required"  name="Imgstep[]" onchange="readImg(this)" multiple/></div></div>';
	input += '<div class="contText"><textarea cols="50" rows="8" name="content"  class="content" placeholder="레시피를 순서대로 작성해주세요."></textarea></div>';
	input += '<div class="BtnBox"><input type="button" class="delContent" value="X" /></div></div>';

	$(input).appendTo($('.cont_container'));
};

function delContentBtn() {
	$('.cont_container').on('click', 'input.delContent', function(){
		var obj = $(this);
		var parObj = obj.parent().parent();
		
		
		obj.remove();
		parObj.remove();
		
	});
};

function readMainImg(input){
	
	if(input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
        	$('.mainimg').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
function readImg(input){
	var obj = $(this);
	var img = obj.parents('.imgUpload')
	if(input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
			img.find('img').attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

delIngreBtn();
delContentBtn();
