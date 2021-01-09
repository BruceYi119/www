
function addIngre() {
	var input = '<input type="text" name="ingredients" class="ingredients" placeholder="예) 돼지고기 300g" /> <input type="button" class="delIngre" value="X" />';

	$(input).appendTo($('#ingredients'));
};

function setBindBtn() {
	$('#ingredients').on('click', 'input.delIngre', function(){
		var obj = $(this);
		var prevObj = obj.prev();

		obj.remove();
		prevObj.remove();
	});
}

setBindBtn();