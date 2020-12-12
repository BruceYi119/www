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

	$('li.image a').on('click', function(e) {
		e.preventDefault();

		const obj = this;
		const imgViewObj = document.querySelector('#imageView');
		const link = obj.getAttribute('link');
		const width = obj.getAttribute('sizeheight');
		const height = obj.getAttribute('sizewidth');
		const html = `<img src="${link}" /><span>X</span><div>test</div>`;

		imgViewObj.classList.remove('hide');
		imgViewObj.innerHTML = html;
	});

	$('#imageView').on('click', 'span',function() {
		const wrap = document.querySelector('#imageView');

		wrap.classList.add('hide');
	});
};

setSearch();