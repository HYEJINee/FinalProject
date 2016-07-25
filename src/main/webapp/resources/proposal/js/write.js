/**
 * write.js
 */

	$(function() {
		$('#btnDebateType').dropdown();
	});
	
	$('#btnCoverImg').on('click', function(event) {
		$('#coverImgUp').trigger('click');
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
		$('#references').append('<div class="reference bs-callout bs-callout-primary"><input type="text" class="form-control" name="topic_resource_title" placeholder="참고자료 제목 - 예) [한겨레] 자살, 개인 선택인가 사회문제인가" /><br><input type="text" class="form-control" name="topic_resource_link" placeholder="참고자료 링크 - 예) http://www.hani.co.kr/arti/society/schooling/288194.html" /></div>')
	});
	
	$('#btnRemoveRef').on('click', function() {
		var numberOfRef = $('.reference').size();
		
		if(numberOfRef > 1) {
			$('.reference').eq(numberOfRef-1).remove();
		}
	});

	$('#btnSubmit').on('click', function( event ) {
		event.preventDefault();
		var topic_type = $('#hid_topic_type').val();
		var title = $('#prop-title').val().trim();
		var short_cont = $('#prop-lead').val().trim();
		var long_cont = $('#prop-body').val().trim();
		var pro = $('#prop-pro').val().trim();
		var con = $('#prop-con').val().trim();
		
		if(topic_type.length == 0) {
			alert('토론 형식');
		} else if(title.length == 0) {
			alert('제목');
		} else if(short_cont.length == 0) {
			alert('요약');
		} else if(long_cont.length == 0) {
			alert('본문');
		} else if(pro.length == 0 || con.length == 0) {
			alert('찬반');
		} else {
			$('#formCoverImg').submit();
		}
	});
	
	/*$('#coverImgUp').on('change', function() {
		$('#formCoverImg').submit();
	})*/