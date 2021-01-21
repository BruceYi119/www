function setKindSungSelect() {
	
	var kind = $('kind').val();
	
	$('#kindSelect option').each(function(i, v){
		var option = $(v);

		if (option.val() === kind)
			option.prop('selected', true);
	});
};

setKindSungSelect();