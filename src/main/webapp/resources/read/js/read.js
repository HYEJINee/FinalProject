/**
 * read.js
 */
/*
	function fn(rel) {
       alert(rel)
       var aaa = rel+"#";
       alert(aaa)
       $("#" + aaa).focus();
    }
    */
/*
	$(function(){
		$('body').scrollspy({ target: '#scroll' })
	})
*/
/*
	$(function(){
	
    $("body").scrollspy({target : "#scrolldiv"})
   // $("body").affix({offset: {top: 150} });
   
	});*/

	$(document).ready(function() {
		$(function() {
			$('#btnDebateType').dropdown();
		});
		$("button[name=del]").click(function() { //id test1 이라는 a태그 클릭시 발생
			var topicno = $(this).next().val();
			var opno = $(this).next().next().val();
			$("#delopno").val(opno);	
			$("#deltopicno").val(topicno);
			$("#delform").submit();
			
		});
		$("button[name=Modal]").click(function() { //id test1 이라는 a태그 클릭시 발생
			var content = $(this).next().val();
			var opno = $(this).next().next().val();
			var recontent = $(this).next().val().replace(/<br\s*[\/]?>/gi, "\n");
			$('#myModal').modal();
			$("#upcontent").val(recontent);	
			$("#reupopno").val(opno);		
			
		});
		$("#optupbtn").click(function() {
			var recontent = $("#upcontent").val().replace(/\n/gi, "<br/>");
			$("#reupcontent").val(recontent);
			$("#optupform").submit();
		});
					$("input[name=rebtn]").click(function() { //id test1 이라는 a태그 클릭시 발생
						var id = $(this).attr('id');
						var nick = $(this).next().val();
						var op_no = $(this).next().next().val();
						$("#relid").val(nick);
						$("#rel").val(op_no);
						$("#context").focus();
					});
					$("input[name=chk]").click(
							function() { //id test1 이라는 a태그 클릭시 발생
								var chkval = $(this).val();
								if (chkval == "0") {
									$("#context").attr("style",
											"border-color: #46FFFF");
								} else if (chkval == "1") {
									$("#context").attr("style",
											"border-color: #FF3232");
								} else {
									$("#context").attr("style",
											"border-color: #66FF00");
								}
							});
					$("input[name=votebtn]").click(function() { //id test1 이라는 a태그 클릭시 발생
						var vote_type = $(this).attr('id'); //0 , 1, 2
						$("input[name=vote_type]").val(vote_type);
						$("#voteform").submit();
					});
					$("button[name=opvotebtn0]").click(
							function() { //id test1 이라는 a태그 클릭시 발생
								var op_like_type = $(this).next().val();
								var formid = $(this).val(); //0 , 1, 2
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
							});
					$("button[name=opvotebtn1]").click(
							function() { //id test1 이라는 a태그 클릭시 발생
								var op_like_type = $(this).next().val();
								var formid = $(this).val(); //0 , 1, 2
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
							});

					$("#optionbtn").click(
							function() { //id test1 이라는 a태그 클릭시 발생
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
					$('#debateType li').on('click',
							function() {var type = $(this).text();
								
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