'use strict';

const setSearch = () => {
	const select = document.querySelector('#searchType');
	const search = document.querySelector('#search');
	const searchTxt = document.querySelector('input[name=searchTxt]').value;
	
	search.value = searchTxt;

	for (let i=0;i<select.options.length;i++) {
		const option = select.children[i];
		const searchType = document.querySelector('input[name=searchType]').value;

		if (option.value === searchType)
			select.selectedIndex = i;
	}
};

setSearch();