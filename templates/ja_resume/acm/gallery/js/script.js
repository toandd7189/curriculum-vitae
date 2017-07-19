(function($){
	$(document).ready(function(){
		
		// Popup Gallery Images
		if ($('.isotope-layout').length > 0) {
			$(document).delegate('*[data-toggle="lightbox"]', 'click', function(event) {
				event.preventDefault();
				return $(this).ekkoLightbox();
			});	
		}
	});
 })(jQuery);