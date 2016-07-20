/**
 * write.js
 */

var topic_type = null;

$(function() {
	/*$('#formCoverImg').on('change', function() {
		$('#formCoverImg').trigger('submit');
	})*/
});
	
	
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
	
	$('#btn_topic_type li').on('click', function() {
		var topic_type_name = $(this).text().trim(); 
		if(topic_type_name == '찬반 토론') {
			$('#hid_topic_type').val(0);
		} else if(topic_type_name == '자유 토론') {
			$('#hid_topic_type').val(1);
		};
	})
	
	$('#btnAddRef').on('click', function() {
		$('#references').append('<div class="reference bs-callout bs-callout-primary"><input type="text" class="form-control" placeholder="참고자료 제목 - 예) [한겨레] 자살, 개인 선택인가 사회문제인가" /><br><input type="text" class="form-control" placeholder="참고자료 링크 - 예) http://www.hani.co.kr/arti/society/schooling/288194.html" /></div>')
	});
	
	$('#btnRemoveRef').on('click', function() {
		var numberOfRef = $('.reference').size();
		
		if(numberOfRef > 1) {
			$('.reference').eq(numberOfRef-1).remove();
		}
	});

/*	$('#btnSubmit').on('click', function() {
		$.post('/proposal/write.do', {
			topic_type : topic_type
		}).done(function() {
			location.href='/proposal/list'
		})
	});*/