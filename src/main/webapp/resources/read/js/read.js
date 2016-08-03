/**
 * read.js
 */
//무한 스크롤
$(function() {
	var $grid = $('.grid');
	
	$grid.isotope();
	
	$grid.infinitescroll({
		navSelector : '#page_nav',
		nextSelector : '#page_nav p a',
		itemSelector : '.grid-item',
		loading: {
			selector: '#bottom',
			finishedMsg: '<em>모든 의견을 불러왔습니다.<em>',
			img: 'http://i.imgur.com/qkKy8.gif',
			msgText: '<em>의견을 불러오는 중...</em>'
		}
	},
		function(newElements) {
			$grid.isotope('appended', $(newElements));
		}
	);
})
// 수정 버튼 클릭시 모달 이동 db에는 줄바꿈을 <br/> 들어가 있어서 <br/>을 변환하여 화면에 출력
function Modify(button) {
	var content = $(button).next().val();
	var opno = $(button).next().next().val();
	var recontent = $(button).next().val().replace(/<br\s*[\/]?>/gi, "\n");
	$('#myModal').modal();
	$("#upcontent").val(recontent);	
	$("#reupopno").val(opno);	
}
//의견 삭제 버튼
function Optdel(button) {
	var topicno = $(button).next().val();
	var opno = $(button).next().next().val();
	$("#delopno").val(opno);	
	$("#deltopicno").val(topicno);
	$("#delform").submit();	
}
//답글 클릭시 닉네임 가지고 의견입력 textarea로 포커스 이동
function Ref(button) {
	var id = $(button).attr('id');
	var nick = $(button).next().val();
	var op_no = $(button).next().next().val();
	$("#relid").val(nick);
	$("#rel").val(op_no);
	$("#context").focus();
}
// 의견의 좋아요 클릭 이벤트
function Opvotebtn0(button) {
	var op_like_type = $(button).next().val();
	var formid = $(button).val(); //0 , 1, 2
	if (list.length == 0) {
		$("input[name=op_like_type]").val(
				op_like_type);
		$("#" + formid).submit();
	} else {
		if (list.indexOf(formid) == -1) {
			$("input[name=op_like_type]").val(
					op_like_type);
			$("#" + formid).submit();
		} else if (list.indexOf(formid) != -1) {
			alert("이미 투표에 참여하셨습니다.");
		}
	}
}
// 의견의 싫어요 클릭 이벤트
function Opvotebtn1(button) {
	var op_like_type = $(button).next().val();
	var formid = $(button).val(); //0 , 1, 2
	if (list.length == 0) {
		$("input[name=op_like_type]").val(
				op_like_type);
		$("#" + formid).submit();
	} else {
		if (list.indexOf(formid) == -1) {
			$("input[name=op_like_type]").val(
					op_like_type);
			$("#" + formid).submit();
		} else if (list.indexOf(formid) != -1) {
			alert("이미 투표에 참여하셨습니다.");
		}
	}
}
	$(document).ready(function() {
		//찬반토론 드롭다운 사용 위해 선언
		$(function() {
			$('#btnDebateType').dropdown();
		});
		//의견 수정 버튼 - 모달창에서 의견 수정후 줄바꿈을 <br/>로 변환하여 db 저장
		$("#optupbtn").click(function() {
			var recontent = $("#upcontent").val().replace(/\n/gi, "<br/>");
			$("#reupcontent").val(recontent);
			$("#optupform").submit();
		});
		
		// 토론 주제 찬반 투표
		$("input[name=votebtn]").click(function() {
			var vote_type = $(this).attr('id'); 
			$("input[name=vote_type]").val(vote_type);
			$("#voteform").submit();
		});
		// 찬반 의견 등록
		$("#optionbtn").click( function() {
				var optiontypechk = $("#hid_topic_type").val();
				var contentchk = $("textarea[name=context]").val();
				if (optiontypechk.length == 0) {
					alert("의견의 찬성, 반대, 중립을 선택해주세요.");
				} else if (contentchk == "") {
					alert("의견을 입력해주세요.");
				} else {
					var recontent = $("textarea[name=context]").val().replace(/\n/gi, "<br/>");
					$("input[name=recontent]").val(recontent);
					$("#optionform").submit();
				}
		});
		// 자유 토론 의견 등록
		$("#freebtn").click(
				function() { //id test1 이라는 a태그 클릭시 발생
					var contentchk = $("textarea[name=context]").val();
					if (contentchk == "") {
						alert("의견을 입력해주세요.");
					} else {
						var recontent = $("textarea[name=context]").val().replace(/\n/gi, "<br/>");
						$("input[name=recontent]").val(recontent);
						$("#optionform").submit();
					}
		});
		// 찬반 토론 의견 선택시 의견 타입 hidden 저장
		$('#btn_topic_type li').on('click', function() {
			var topic_type_name = $(this).text().trim(); 
			if(topic_type_name == '찬성') {
				$('#hid_topic_type').val(0);
			} else if(topic_type_name == '반대') {
				$('#hid_topic_type').val(1);
			} else if(topic_type_name == '중립') {
				$('#hid_topic_type').val(2);
			};
		});
		// 찬반 투표 의견 선택 드롭다운 선택시 버튼 색상 변경
		$('#debateType li').on('click', function() {
			var type = $(this).text();			
			if ($.trim(type) == '찬성') {
				$('#debateType button').removeClass('btn-default')
				.removeClass('btn-danger').removeClass('btn-success')
				.addClass('btn-primary')
				.html(type + '<span class="caret"></span>');
			} 
			else if ($.trim(type) == '반대') {
				$('#debateType button').removeClass('btn-default')
				.removeClass('btn-primary').removeClass('btn-success').addClass('btn-danger')
				.html(type + '<span class="caret"></span>');
			}
			else if ($.trim(type) == '중립') {
				$('#debateType button').removeClass('btn-default')
				.removeClass('btn-primary').removeClass('btn-danger').addClass('btn-success')
				.html(type + '<span class="caret"></span>');
			}
		});
					
	});