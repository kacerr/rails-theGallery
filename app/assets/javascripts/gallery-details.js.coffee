jQuery ->
  $(".gallery-image").hover(
    -> $(this).css({"border" : "2px solid grey"})
    #.animate({'borderColor': 'grey'}, 500)
    -> $(this).animate(500).css({"border" : "2px solid white"})
    )


  
jQuery ->
	$(".fancybox").fancybox({
		openEffect	: 'none',
		closeEffect	: 'none'
	});

