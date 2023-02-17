$(document).ready(function(){
	for(let i = 0; i < $('.tab_button').length; i++){
	    tabOpen(i); 
	}
	
	function tabOpen(e){
		$('.tab_button').eq(e).click(function(){
	        $('.tab_button').removeClass('tab_active');
	        $('.tab_content').removeClass('tab_show');
	        $('.tab_button').eq(e).addClass('tab_active');
	        $('.tab_content').eq(e).addClass('tab_show');
	    });
	}
});


