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
    $.datepicker.setDefaults( $.datepicker.regional["fr"]);
    $( ".datepicker" ).datepicker({ dateFormat: "dd/mm/yy" });
    $( ".heurepicker" ).timeEntry({show24Hours: true});
    $( "input[type=submit], nav a,.button, input[type=button]" ).button();
    $(".panier").click(function(){
    	input=$(this);
    	$.post("/IN56Project/Panier",{'id':$(this).attr('id')} ,function(data) {
        	if(input.val()=="Supprimer du panier"){
        		input.val("Ajouter au panier");
        	}else{
        		input.val("Supprimer du panier");
        	}
        })
        .fail(function(){
        	alert("Problème de connexion ou de Paramètre");
        });
    });
    
});