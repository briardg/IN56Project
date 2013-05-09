$(document).ready(function(){
    setInterval(function(){
        $.get("pub.jsp", function(data) {
        	$('.advert').fadeToggle(1000);
        	setTimeout(function(){
        		$('.advert').html(data);
        	},1000);
        	$('.advert').fadeToggle(1000);
        });
    }, 5000);
});