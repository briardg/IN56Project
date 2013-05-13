$(document).ready(function(){
    setInterval(function(){
        $.get("/IN56Project/pub.jsp", function(data) {
        	$('.advert').fadeToggle(1000);
        	setTimeout(function(){
        		$('.advert').html(data);
        	},1000);
        	$('.advert').fadeToggle(1000);
        });
    }, 5000);
    $( "#tabs" ).tabs();
    $( ".datepicker" ).datepicker();
    $( "input[type=submit], nav a, nav button" ).button();
});