'use strict';

const resizeWindow = (f) => {
	const flag = f || false;
	const imgView = document.querySelector('#imageView');

	if (imgView.classList.value === 'view' || flag) {
		const height = window.innerHeight;

		if (height < 600) {
			imgView.style.top = '0';
		} else {
			const cssHeight = (height - 600) / 2;
			imgView.style.top = `${cssHeight}px`;
		}
	}
};

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
		const html = `<img src="${link}" /><span>X</span><div>test</div>`;

		imgViewObj.classList.remove('hide');
		imgViewObj.classList.add('view');
		imgViewObj.innerHTML = html;
	});

	document.querySelector('#more').addEventListener('click', (e) => {
		e.preventDefault();

		const page = parseInt(document.querySelector('input[name=page]').value) + 1;
		const searchTxt = document.querySelector('input[name=searchTxt]').value;
		const searchType = document.querySelector('input[name=searchType]').value;
		const display = document.querySelector('input[name=display]').value;
	});
};

$('#imageView').on('click', 'span',function() {
	const wrap = document.querySelector('#imageView');
	
	wrap.classList.remove('view');
	wrap.classList.add('hide')
});

$(window).resize(resizeWindow);

setSearch();
resizeWindow(true);