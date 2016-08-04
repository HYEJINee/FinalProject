/**
 * 	
 */

function goToRead(card) {
	var topic_no = $(card).attr("topic_no");
	location.href = "/read/read?topic_no=" + topic_no;
}

$(document).ready(function(){
	$('#topic-tab a').click(function(e) {
		e.preventDefault()
		$(this).tab('show')
	})
});