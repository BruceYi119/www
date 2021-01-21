
$('#cafe_info_click').click(function(){
	$('.cafe_info').css('visibility','visible');
	$('.cafe_info').css('position','relative');
	$('.my_info').css('visibility','hidden');
	$('.my_info').css('position','absolute');
})

$('#my_info_click').click(function(){
	$('.my_info').css('visibility','visible');
	$('.my_info').css('position','relative');
	$('.cafe_info').css('visibility','hidden');
	$('.cafe_info').css('position','absolute');
})

