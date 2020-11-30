'use strict';

const setSearchType = () => {
	const select = document.querySelector('#searchType');

	for (let i=0;i<select.options.length;i++) {
		const option = select.children[i];
		const searchType = document.querySelector('input[name=searchType]').value;

		if (option.value === searchType)
			select.selectedIndex = i;
	}
};

setSearchType();