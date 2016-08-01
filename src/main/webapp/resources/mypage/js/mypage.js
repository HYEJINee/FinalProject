/**
 * mypage.js
 */


var _URL = window.URL || window.webkitURL;

$('#profile-img-btn').on('click', function(event) {
	$('#profile-img-up').trigger('click');
});
$('#profile-img-up').on('change',
		function(e) {
			var image, file;
			var _height;
			var _width;
			var ex;
			var authorizedTypes = ['jpg', 'jpeg', 'png', 'gif'];
			if ((file = this.files[0])) {
				ex = this.value.substring(this.value.lastIndexOf('.') + 1);
				
				result = authorizedTypes.find(function(type) {
					return type == ex;
				});
				
				if(result) {
					image = new Image();

					image.src = _URL.createObjectURL(file);

					image.onload = function() {
						_width = this.width;
						_height = this.height;

						/*$('#profile-img-div').css('background',
								'url(' + image.src + ') no-repeat center center')
								.css('height', _height + "px")*/
						$("#profile-test").attr("src", image.src);
					};
				
				} else {
					alert('파일 유형이 올바르지 않습니다.');
					return false;
				}
			}
		});



$(function() {
	$(".dropdown-menu li a").click(
			function() {
				$(this).parents(".dropdown").find('.btn').html(
						$(this).data('value')
								+ ' <span class="caret"></span>');
				$(this).parents(".dropdown").find('.btn').val(
						$(this).text());
			});
});

function filterAll() {
	$(".mypage-timeline-row").show();
}
function filterTopic() {
	$(".mypage-timeline-row").hide();
	$(".mypage-row-topic").show();
}
function filterOpinion() {
	$(".mypage-timeline-row").hide();
	$(".mypage-row-opinion").show();
}
function filterVote() {
	$(".mypage-timeline-row").hide();
	$(".mypage-row-vote").show();
}
function dismissNoti(noti_no) {
      $.ajax({
         type : "POST",
         url : "dismissNoti",
         data : {"noti_no" : noti_no}    
      });
  };
  function uploadProfile(user_no) {
      $.ajax({
         type : "POST",
         url : "uploadProfile",
         data : {"user_no" : user_no}    
      });
  };