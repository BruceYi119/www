function selected() {
	var animal = $('input[name=animalv]').val();
	var writype = $('input[name=writypev]').val();
	var fname = $('input[name=fnamev]').val();
	var select_animal = $('select[name=animal] option');
	var select_writype = $('select[name=writype] option');
	var select_fname = $('select[name=fname] option');

	for (var i=0;i<select_animal.length;i++) {
		var obj = $(select_animal[i]);

		if (obj.val() === animal) {
			obj.prop('selected', true);
			break;
		}
	}

	for (var i=0;i<select_writype.length;i++) {
		var obj = $(select_writype[i]);
		
		if (obj.val() === writype) {
			obj.prop('selected', true);
			break;
		}
	}

	for (var i=0;i<select_fname.length;i++) {
		var obj = $(select_fname[i]);

		if (obj.val() === fname) {
			obj.prop('selected', true);
			break;
		}
	}
}

selected();