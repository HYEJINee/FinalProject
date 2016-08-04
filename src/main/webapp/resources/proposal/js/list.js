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
	
	// 헤더 탭 부분 종료된 토론 활성화
	$("#proposal").addClass("active");
	$("#ongoing").removeClass("active");
	$("#finished").removeClass("active");
});
		
$('.btn-write').on('click', function() {
	location.href='/proposal/write.do';
});
    	
function toTopic(card) {
	var topic_no = $(card).attr("topic-no");
	location.href="read?topic_no=" + topic_no;
}