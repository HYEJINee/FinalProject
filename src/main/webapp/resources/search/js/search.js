/**
 * 	
 */

function goToRead(card, topic_progress) {
	var topic_no = $(card).attr("topic_no");
	if(topic_progress == 1) {
		location.href = "/proposal/read?topic_no=" + topic_no;
	} else if(topic_progress == 3) {
		location.href = "/read/read?topic_no=" + topic_no;
	} else if(topic_progress == 4) {
		location.href = "/finished/read?topic_no=" + topic_no;
	}
}

$(document).ready(function(){
	$('#topic-tab a').click(function(e) {
		e.preventDefault()
		$(this).tab('show')
	})
	// 헤더 탭 부분 종료된 토론 활성화
	$("#proposal").removeClass("active");
	$("#ongoing").removeClass("active");
	$("#finished").removeClass("active");
});