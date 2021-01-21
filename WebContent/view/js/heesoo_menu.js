$(function(){
	var menu=$('.rmenu')
	$('.rmenu').click(function(){
		var n = menu.index(this);
		var url='url(/view/heesoo/img/' + n + '.jpg)';
		$('#show').css('background-image',url);
		
	})
})
