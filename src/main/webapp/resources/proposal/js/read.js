/**
 * 	read.js
 */

$(function() {
	var $grid = $('.grid');
	
	$grid.isotope();
	
	$grid.infinitescroll({
		navSelector : '#page_nav',
		nextSelector : '#page_nav p a',
		itemSelector : '.grid-item',
		loading: {
			selector: '#bottom',
			finishedMsg: '<em>모든 댓글을 불러왔습니다.<em>',
			img: 'http://i.imgur.com/qkKy8.gif',
			msgText: '<em>안건을 불러오는 중...</em>'
		}
	},
		function(newElements) {
			$grid.isotope('appended', $(newElements));
		}
	);
})

function modSetup(button) {
	var form = $(button).parent().parent();
	var p = $(form).children("p");
	var cont = $(p).html();

	$(p).css('display', 'none').after("<textarea class='form-control' name='reply_content' rows='5' style='margin-bottom:10px;'>"+ cont.replace(/<br\s?\/?>/g,"\n") +"</textarea>");
	
	$(button).parent().html("<button type='submit' class='btn btn-primary' onclick='replyUpdate(this)'>완료</button>"
							+ "<button class='btn' onclick='cancelUpdate(this)'>취소</button>");
}

function cancelUpdate(button) {
	var form = $(button).parent().parent();
	var textarea = $(form).children("textarea");
	var p = $(form).children("p");

	$(p).css('display', 'block');

	$(textarea).remove();
	
	$(button).parent().html("<button id='btnModRep' type='button' class='btn btn-link' onclick='modSetup(this)'>수정</button>"
							+ "<button id='btnDelRep' type='button' class='btn btn-link' onclick='checkDelete(this)'>삭제</button>");
}

function checkDelete(button) {
	$(button).parent().before("<p class='text-right text-danger'>삭제한 댓글은 복원할 수 없습니다. 그래도 삭제하시겠습니까?</p>").html("<button type='button' class='btn btn-danger' onclick='delReply(this)'>삭제</button><button type='button' class='btn btn-default' onclick='cancelDelete(this)'>취소</button>");
}

function cancelDelete(button) {
	var form = $(button).parent().parent();
	var p = $(form).children("p:last-of-type");

	$(p).remove();
	$(button).parent().html("<button id='btnModRep' type='button' class='btn btn-link' onclick='modSetup(this)'>수정</button>"
			+ "<button id='btnDelRep' type='button' class='btn btn-link' onclick='checkDelete(this)'>삭제</button>");
}

function delReply(button) {
	var form = $(button).parent().parent();
	var topic_no = $(form).children("input[name='topic_no']").val();
	var reply_no = $(form).children("input[name='reply_no']").val();
	$.post('/proposal/reply.delete', {
		topic_no : topic_no,
		reply_no : reply_no
	}).done(function(data) {
		location.reload();
	});
}