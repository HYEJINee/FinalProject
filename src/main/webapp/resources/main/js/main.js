/**
 * 	작성자 : 최락휘
	작성일 : 2016.08.03
 */

$(document).ready(function(){
		// 메인 제목
		$(".main_title").click(function(){
			location.href = "/";
		});
		// 메인 헤더 게시물
		$(".header_item").click(function(){
			var topic_no = $(this).children().filter("input").val();
			location.href = "/read/read?topic_no=" + topic_no;
		});
		// 토론중 게시물
		$(".list_item").click(function(){
			var topic_no = $(this).children().filter("input").val();
			location.href = "/read/read?topic_no=" + topic_no;
		});
		// 안건 건의중인 게시물
		$(".on_item").click(function(){
			var topic_no = $(this).children().filter("input").val();
			location.href = "/proposal/read?topic_no=" + topic_no;
		});
		// 종료된 게시물
		$(".fin_item").click(function(){
			var topic_no = $(this).children().filter("input").val();
			location.href = "/finished/read?topic_no=" + topic_no;
		});
});
