/**
 * 
 */
function sliderInit(slider) {
    jQuery('.jcarousel-control-slider a').bind('click', function() {
		var page=jQuery.jcarousel.intval(jQuery(this).attr("id"));
		jQuery('.jcarousel-control-slider a').removeClass('active');	
		jQuery(this).addClass("active");
		slider.scroll(page);
        return false;
	});
	jQuery('.jcarousel-scroll-slider select').bind('change', function() {
		slider.options.scroll = jQuery.jcarousel.intval(this.options[this.selectedIndex].value);
		return false;
    });
	jQuery('#slide-next').bind('click', function() {
		slider.next();
		return false;
    });
	jQuery('#slider-prev').bind('click', function() {
		slider.prev();
		return false;
    });

};
// Ride the carousel...
jQuery(document).ready(function() {
    jQuery("#myslider").jcarousel({
        scroll: 1,
        initCallback: sliderInit,
        // This tells jCarousel NOT to autobuild prev/next buttons
        buttonNextHTML: null,
		animation:'slow',
		effect:'fade',
		visible:1,
        buttonPrevHTML: null
    });
});
