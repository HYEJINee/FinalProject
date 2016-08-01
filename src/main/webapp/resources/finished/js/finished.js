/**
 * 	finished.js
 * 	작성자 : 최락휘
 * 	작성일 : 2016.07.21
 *  최종수정 : 2016.08.01
 *  내용 : 전체 헤더 탭 활성화, 카테고리 기능 
 */
// 게시물 선택시 읽기 페이지로 이동
function fnRead() {
	$(".item").click(function(){
		var topic_no = $(this).children().filter("input").val();
		location.href = "/finished/read?topic_no=" + topic_no;
	});
}
// 무한스크롤 설정
function fnInfiScroll() {
	var $grid = $('.list');
		
		$grid.isotope({
			// set itemSelector so .grid-sizer is not used in layout
			itemSelector: '.item',
			// use element for option
			masonry: {
				gutter: 80
			}
		});
				
		$grid.infinitescroll({
			navSelector : '#page_nav',
			nextSelector : '#page_nav p a',
			itemSelector : '.item',
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
	}

$(document).ready(function(){
	fnInfiScroll();
	fnRead();
	// 헤더 탭 부분 종료된 토론 활성화
	$("#proposal").removeClass("active");
	$("#ongoing").removeClass("active");
	$("#finished").addClass("active");

});