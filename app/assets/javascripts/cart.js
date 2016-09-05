// Click event for cart trigger
$(document).on('click', '.trigger', function(){
  
  	if ($("#cart .foot").hasClass("open")) { // If the cart is open
  		$("#cart .foot").toggleClass("open"); // Remove rounded corners straight away
  		$(".order").slideToggle(500);
  	}
  	else{	// Cart is closed	
  		$(".order").slideToggle(500, function(){
	  		$("#cart .foot").toggleClass("open");	// Remove rounded corners after slide
	  	});			
  	}
});