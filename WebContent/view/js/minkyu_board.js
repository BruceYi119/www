'use strict';

function setKindSelect() {
	var kind = $('#kind').val();

	$('#kindSelect').bind('change', function(){
		var obj = $(this);
		var kind = obj.val();
		var pager = $('#pager').val();
		var url = '/view/minkyu/board.jsp?pager=' + pager;

		url += '&kind=' + kind;
		location.href = url;
	});

	$('#kindSelect option').each(function(i, v){
		var option = $(v);

		if (option.val() === kind)
			option.prop('selected', true);
	});
};

setKindSelect();