/**
 * 	ongoing.js
 * 	작성자 : 최락휘
 * 	작성일 : 2016.07.25
 *  최종수정 : 2016.07.29
 *  내용 : 전체 헤더 탭 활성화, 카테고리 기능 
 */

$(document).ready(function(){
	var $grid = $('#list');
	
	$grid.isotope({
		// set itemSelector so .grid-sizer is not used in layout
		itemSelector: '.item',
		// use element for option
		columnWidth: 358,
		masonry: {
			gutter: 30
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

	// 헤더 탭 부분 종료된 토론 활성화
	$("#proposal").removeClass("active");
	$("#ongoing").addClass("active");
	$("#finished").removeClass("active");
	// 게시글 클릭시 이동
	$(".item").click(function(){
		var topic_no = $(this).children().filter("input").val();
		location.href = "/read/read?topic_no=" + topic_no;
	});
	// 상단 카테고리 클릭시 필터링
	$(".nav-pills li").click(function(){
		// 이미 선택되있는 카테고리 일시 종료
		if($(this).hasClass("on")) {
			return;
		}
		var type = $(this).attr("class");
		// 선택된 카테고리 활성화
		if(type == "all") {
			$(this).html("<h4><strong>1.모든안건</strong></h4>").addClass("on");
			$(".pro-con").html("<h4>찬반토론</h4>").removeClass("on");
			$(".free").html("<h4>자유의견</h4>").removeClass("on");
		} 
		else if(type == "pro-con") {
			$(this).html("<h4><strong>2.찬반토론</strong></h4>").addClass("on");
			$(".all").html("<h4>모든안건</h4>").removeClass("on");
			$(".free").html("<h4>자유의견</h4>").removeClass("on");
		}
		else {
			$(this).html("<h4><strong>3.자유의견</strong></h4>").addClass("on");
			$(".pro-con").html("<h4>찬반토론</h4>").removeClass("on");
			$(".all").html("<h4>모든안건</h4>").removeClass("on");
		}
		// 선택된 카테고리를 기준으로 게시글 필터링
		$.ajax({
			url: "/ongoing/tab",
			type: "GET",
			data: {"type": type},
			success: function(data){
				var none_list = "<center><h2>등록된 게시물이 없습니다.</h2></center>";
				var html = "";
				$.each(data, function(idx){
					var list = data[idx];
					html += '<div class="item col-md-3 col-md-offset-1" style="padding-left: 0px; padding-right: 0px;">';
					html += '<input type="hidden" name="topic_no" value="' + list.topic_no + '"/>';
					if(list.topic_type == 0) {
						if(list.img_file_name != null) {
							html += '<div id="card_header">';
							html += '<h4><label class="label label-primary">찬반</label></h4>';
							html += '<center><h3>' + list.topic_title + '</h3></center>';
							html += '<img id="coverImg" src="/resources/proposal/img/' + list.img_file_name + '.' + list.img_ext_name + '">';
							html += '</div>';
						}
						else {
							html += '<div id="card_header_noneImg">';
							html += '<h4><label class="label label-primary">찬반</label></h4>';
							html += '<center><h3>' + list.topic_title + '</h3></center>';
							html += '</div>';
						}
						html += '<div id="card_body">'
						html += '<p>' + list.topic_short_cont + '</p>';
						html += '<span class="glyphicon glyphicon-user"> ' + (list.debate_tot_pro + list.debate_tot_con + list.debate_tot_neut) + '</span>';
						if(list.debate_tot_pro == 0)
							html += '<span id="pro"> 찬 0%</span>';
						else
							html += '<span id="pro"> 찬 ' + Math.round(list.debate_tot_pro/(list.debate_tot_pro + list.debate_tot_con + list.debate_tot_neut)*100) + '%</span>';
						if(list.debate_tot_con == 0)
							html += '<span id="con"> 반 0%</span>';
						else
							html += '<span id="con"> 반 ' + Math.round(list.debate_tot_con/(list.debate_tot_pro + list.debate_tot_con + list.debate_tot_neut)*100) + '%</span>';
						if(list.debate_tot_neut == 0)
							html += '<span id="neut"> 중 0%</span>';
						else
							html += '<span id="neut"> 중 ' + Math.round(list.debate_tot_neut/(list.debate_tot_pro + list.debate_tot_con + list.debate_tot_neut)*100) + '%</span>';
						html += '</div>';
					}
					else {
						if(list.img_file_name != null) {
							html += '<div id="card_header">';
							html += '<h4><label class="label label-primary">의견</label></h4>';
							html += '<center><h3>' + list.topic_title + '</h3></center>';
							html += '<img id="coverImg" src="/resources/proposal/img/' + list.img_file_name + '.' + list.img_ext_name + '">';
							html += '</div>';
						}
						else {
							html += '<div id="card_header_noneImg">';
							html += '<h4><label class="label label-primary">의견</label></h4>';
							html += '<center><h3>' + list.topic_title + '</h3></center>';
							html += '</div>';
						}
						html += '<div id="card_body">';
						html += '<p>' + list.topic_short_cont + '</p>';
						html += '<span class="glyphicon glyphicon-education"> ' + list.op_cnt + '</span>';
						html += '</div>';
					}
					html += '</div>';
				});
				if(html == "")
					$("#List").empty().append(none_list);
				else
					$("#List").empty().append(html);
			}
		});
	});
});