

window.frame = (function(){
    var A = {}

        , $content = $('.content')
        , $nav = $('.left_nav')
        , $menu = $nav.find('.menu')

        ;

    $nav.mouseenter(function(){
        $nav.stop(0);
        $nav.animate({left:0},160);
    });


    $nav.mouseleave(function(){
        $nav.stop(0);
        $nav.animate({left:-220},360);
    });


	window.onresize = onResize;
	function onResize(){
	    var offset = ScollPostion()
		    , he = offset.clientHeight
		    , wi = offset.clientWidth;
		$menu.css({height:he-59});
		$content.css({height:he-59-50,width:wi-80});

	};
	onResize();

    return A;
})();