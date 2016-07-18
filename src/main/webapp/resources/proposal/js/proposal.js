/**
 * proposal.jsp
 */

$(function() {
	$('#formCoverImg').on('change', function() {
		$('#formCoverImg').trigger('submit');
	})
	
	
	$('#btnCoverImg').on('click', function(event) {
		$('#coverImgUp').trigger('click');
//		alert($('#divCoverImg').css('background-image'));
	});
	
	
	
	$('#debateType li').on('click',
		function() {
			var type = $(this).text();
			
			if ($.trim(type) == '찬반 토론') {
				$('#debateType button').removeClass('btn-default')
				.removeClass('btn-success').addClass('btn-info')
				.html(type + '<span class="caret"></span>');
			} 
			else if ($.trim(type) == '자유 토론') {
				$('#debateType button').removeClass('btn-default')
				.removeClass('btn-info').addClass('btn-success')
				.html(type + '<span class="caret"></span>');
			}
	});
	
	
	
	$('#btnAddRef').on('click', function() {
		$('#references').append('<div class="reference bs-callout bs-callout-primary"><input type="text" class="form-control" placeholder="참고자료 제목 - 예) [한겨레] 자살, 개인 선택인가 사회문제인가" /><br><input type="text" class="form-control" placeholder="참고자료 링크 - 예) http://www.hani.co.kr/arti/society/schooling/288194.html" /></div>')
	});
	
	$('#btnRemoveRef').on('click', function() {
		var numberOfRef = $('.reference').size();
		
		if(numberOfRef > 1) {
			$('.reference').eq(numberOfRef-1).remove();
		}
	});

	
	
	$('#btnSubmit').on('click', function(event) {
		event.preventDefault();
	});
});