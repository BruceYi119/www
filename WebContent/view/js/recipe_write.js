
function addIngre() {
	var input = '<input type="text" name="ingredients" class="ingredients" placeholder="예) 돼지고기 300g" /> <input type="button" class="delIngre" value="X" /><p>';

	$(input).appendTo($('#ingredients'));
};

function delIngreBtn() {
	$('#ingredients').on('click', 'input.delIngre', function(){
		var obj = $(this);
		var prevObj = obj.prev();

		obj.remove();
		prevObj.remove();
	});
};


function addContent(){
	var input = '<textarea cols="50" rows="4" name="content"  class="content"></textarea> <input type="file" name="img" class="img"><input type="button" class="delContent" value="X" />';
	$(input).appendTo($('#content'));
};

function delContentBtn() {
	$('#content').on('click', 'input.delContent', function(){
		var obj = $(this);
		var prevObj = obj.prev();
		var prevObj2 = prevObj.prev();
		obj.remove();
		prevObj.remove();
		prevObj2.remove();
	});
};

var imgFiles = [];
$(document).ready(function(){
	$(".img").on("change",handleImgFilesSelect);	
});

function handleImgFilesSelect(){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("업로드는 이미지 확장자만 가능합니다.");
			return;
		}
		imgFiles.push(f);
		
		var reader = new FileReader();
		reader.onload = function(e){
			var img_html = "<img src=\""+e.target.result+"\" />";
			$(".imgs_wrap").append(img_html);
		}
		reader.readAsDataURL(f);
	});
};





delIngreBtn();
delContentBtn();