function init()
{
	var cla = $('input[name=clas]').val();
	var select_cla = $('select[name=cla] option');

	for (var i=0;i<select_cla.length;i++) {
		var obj = $(select_cla[i]);

		if (obj.val() === cla) {
			obj.prop('selected', true);
			break;
		}
	}

}