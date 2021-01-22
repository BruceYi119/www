
$(function() {
	
	// 댓글 수정버튼
	$('a.commUpdate').on('click', function(e){
		e.preventDefault();
		
		var obj = $(this)
		var wrap = obj.parents('form');
		var rcontent_box = wrap.find('.rcontent_box');
		var update_box = wrap.find('.update_box');

		rcontent_box.hide();
		update_box.show();

	});

	// 댓글 수정 취소버튼
	$('a.rollback').on('click', function(e){
		e.preventDefault();
		
		var obj = $(this)
		var wrap = obj.parents('form');
		var rcontent_box = wrap.find('.rcontent_box');
		var update_box = wrap.find('.update_box');

		rcontent_box.show();
		update_box.hide();
	});
	
});
