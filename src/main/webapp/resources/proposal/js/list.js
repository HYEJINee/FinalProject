/**
 * list.js 
 */

$(function() {
	var $grid = $('.grid');
		
	$grid.isotope({
		// set itemSelector so .grid-sizer is not used in layout
		itemSelector: '.grid-item',
		// use element for option
		masonry: {
			gutter: 40
		}
	});
			
	$grid.infinitescroll({
		navSelector : '#page_nav',
		nextSelector : '#page_nav p a',
		itemSelector : '.grid-item',
		loading: {
			selector: '#load',
		    finishedMsg: "<em>모든 안건을 불러왔습니다.</em>",
		                img: 'http://i.imgur.com/qkKy8.gif',
		    msgText: "<em>안건을 불러오는 중...</em>"
		}
	},
		function(newElements) {
			$grid.isotope('appended', $(newElements));
		}
	);

	$('.nav-pills').on('click', 'li', function() {
		var filterValue = $(this).attr('data-filter');
		$grid.isotope({filter: filterValue});
	})
	// 상단 이동 Btn 생성
	$(window).scroll(function(){
		if($(this).scrollTop() > 200)
			$("#topBtn").fadeIn();
		else
			$("#topBtn").fadeOut();
	});
	
	$("#topBtn").click(function(){
		$('html, body').animate( { scrollTop : 0 }, 400 );
	});
});
		
$('.btn-write').on('click', function() {
	location.href='/proposal/write.do';
});
    	
function toTopic(card) {
	var topic_no = $(card).attr("topic-no");
	location.href="read?topic_no=" + topic_no;
}