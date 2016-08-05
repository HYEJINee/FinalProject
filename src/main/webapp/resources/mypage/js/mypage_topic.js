/**
 * 
 */
// 자신의 안건을 각 타입에 따라 읽는 페이지로 이동
function fnRead(div) {
	var topic_no = $(div).children().filter("input").val();
	
	if($(div).hasClass("progress_1")) {
		location.href = "/proposal/read?topic_no=" + topic_no;
	}
	else if($(div).hasClass("progress_2")) {
		location.href = "/proposal/read?topic_no=" + topic_no;
	}
	else if($(div).hasClass("progress_3")) {
		location.href = "/ongoing/read?topic_no=" + topic_no;
	}
	else {
		location.href = "/finished/read?topic_no=" + topic_no;
	}
  }
//무한스크롤 설정
function fnInfiScroll() {
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
	});
}

$(document).ready(function(){
	  fnInfiScroll();
});