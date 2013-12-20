

window.frame = (function(){
    var A = {}

        , $content = $('.content')
        , $nav = $('.left_nav')
        , $menu = $nav.find('.menu')
        , $select = $('.top_logo .version select')

        ;

    $nav.mouseenter(function(){
        $nav.stop(0);
        $nav.animate({left:0},160);
    });


    $nav.mouseleave(function(){
        $nav.stop(0);
        $nav.animate({left:-234},360);
    });


	window.onresize = onResize;
	function onResize(){
	    var offset = ScollPostion()
		    , he = offset.clientHeight
		    , wi = offset.clientWidth;
		$menu.css({height:he-59});
		$content.css({height:he-59,width:wi-80-5});

	};
	onResize();



	$select.change(function(){
	   var num = $select.val();
	   cookie.set('version_num',num,60*60*24);
       location.href = '/';
	});



    return A;
})();