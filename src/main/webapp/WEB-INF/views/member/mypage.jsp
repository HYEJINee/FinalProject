<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Mypage</title>
<!-- link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script-->
</head>

<style>
.center {
	float: none;
	margin-left: auto;
	margin-right: auto;
}

.mypage-header {
	
}

.round-profile-150 {
	display: block;
	width: 150px;
	height: 150px;
	border-radius: 150px;
}

.mypage-header-user {
	text-align: center;
}

.mypage-activity-filter {
	float: right;
	margin-bottom: 15px;
}

.mypage-activity-row {
	margin-bottom: 7px;
}

.mypage-activity-date {
	padding-top: 1em;
}

.mypage-activity-all {
	padding: 1em;
	border-radius: 4px;
	border: blue 1px solid;
}

.mypage-activity-topic {
	border-color: blue;
}

.mypage-activity-opinion {
	border-color: red;
}

.mypage-activity-vote {
	border-color: grey;
}

.align-right {
	text-align: right;
}
</style>
<body>

	<%@include file="../include/header.jsp"%>
	<style>
.noti-reply {
	border-color: blue;
}

.noti-topic {
	border-color: red;
}
</style>
	<script>
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
			$(".mypage-activity-row").show();
		}
		function filterTopic() {
			$(".mypage-activity-row").hide();
			$(".mypage-row-topic").show();
		}
		function filterOpinion() {
			$(".mypage-activity-row").hide();
			$(".mypage-row-opinion").show();
		}
		function filterVote() {
			$(".mypage-activity-row").hide();
			$(".mypage-row-vote").show();
		}
		function dismissNoti(noti_no) {
	          $.ajax({
	             type : "POST",
	             url : "dismissNoti",
	             data : {"noti_no" : noti_no}    
	          });
	      };
	</script>
	<div class="container">
		<div class="row ">
			<div class="mypage-header-container">
				<div class="mypage-header-profile">
					<img class="center round-profile-150"
						src="/resources/${USER_KEY.user_profile }" />
				</div>
				<div class="mypage-header-user">
					<h3>${USER_KEY.user_nick }의페이지</h3>
				</div>
			</div>
		</div>
		<div class="nav-container">
			<ul class="center nav nav-pills">
				<li role="presentation" class="active"><a href="#noti"
					aria-controls="noti" role="tab" data-toggle="tab">알림</a></li>
				<li role="presentation"><a href="#my-topic"
					aria-controls="my-topic" role="tab" data-toggle="tab">내 안건</a></li>
				<li role="presentation"><a href="#timeline"
					aria-controls="timeline" role="tab" data-toggle="tab">활동</a></li>
				<li role="presentation"><a href="#profile"
					aria-controls="profile" role="tab" data-toggle="tab">프로필</a></li>
			</ul>
		</div>
		<hr />
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="noti">
				<c:forEach items="${getNoti}" var="notiDTO">
					<div id="noti-${notiDTO.noti_no }"
						class="alert noti-${notiDTO.noti_css }" role="alert">
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close" onclick="dismissNoti(${notiDTO.noti_no })">
							<span aria-hidden="true">&times;</span>
						</button>
						<c:if test="${notiDTO.noti_css eq 'reply' }">
							<a href="#" class="alert-link">${notiDTO.other_user_nick }</a>님이  
							</c:if>

						<a href="/read/read?topic_no=${notiDTO.noti_no } class="alert-link">${notiDTO.topic_title }</a>${notiDTO.noti_statement }
					</div>
				</c:forEach>

			</div>
			<div role="tabpanel" class="tab-pane" id="my-topic">my topic
				list</div>
			<div role="tabpanel" class="tab-pane " id="timeline">
				<div class="row">
					<div class="dropdown mypage-activity-filter">
						<button class="btn btn-default dropdown-toggle" type="button"
							id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="true">
							필터<span class="caret"></span>
						</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
							<li><a href="javascript:filterAll();" data-value="필터 : 모두">모두</a></li>
							<li><a href="javascript:filterTopic();" data-value="필터 : 안건">안건</a></li>
							<li><a href="javascript:filterOpinion();"
								data-value="필터 : 의견">의견</a></li>
							<li><a href="javascript:filterVote();" data-value="필터 : 투표">투표</a></li>
						</ul>
					</div>
				</div>
				<div class="mypage-activity-list">
					<c:forEach items="${timeline}" var="mypageDTO">
						<div
							class="row mypage-activity-row mypage-row-${mypageDTO.timeline_css }">
							<div class="col-md-3 mypage-activity-date">${mypageDTO.timeline_date }</div>
							<div
								class="col-md-9 mypage-activity-all mypage-activity-${mypageDTO.timeline_css }">
								<a href="/board/read?topic_no=${mypageDTO.topic_no }">${mypageDTO.topic_title }</a>${mypageDTO.timeline_statement }
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div role="tabpanel" class="tab-pane" id="profile">
				<div class="row">
					<div class="col-md-3 mypage-profile-picture">
						<img class="round-profile-150"
							src="/resources/${USER_KEY.user_profile }" />
						<button type="button" class="btn btn-default btn-sm">프로필
							사진 수정</button>
					</div>

					<div class="col-md-8 mypage-profile-details">
						<a href="/member/member_modify"><button type="button"
								class="btn btn-default">프로필 수정</button></a>


						<table width="100%">
							<tr>
								<td><c:if test="${USER_KEY.user_lv==0}">
										<input type="image" src="/resources/user_lv/common.png" />
									</c:if> <c:if test="${USER_KEY.user_lv==1}">
										<input type="image" src="/resources/user_lv/prestige.png" />
									</c:if> <c:if test="${USER_KEY.user_lv==2}">
										<input type="image" src="/resources/user_lv/royal.png" />
									</c:if> <c:if test="${USER_KEY.user_lv==3}">
										<input type="image" src="/resources/user_lv/vip.png" />
									</c:if> <c:if test="${USER_KEY.user_lv==4}">
										<input type="image" src="/resources/user_lv/vvip.png" />
									</c:if>
								<td>
							</tr>
							<tr>
								<td>닉네임</td>
								<td class="align-right">${USER_KEY.user_nick }</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td class="align-right">${USER_KEY.user_email }</td>
							</tr>

							<tr>
								<td>비밀번호</td>
								<td class="align-right">${USER_KEY.user_pw }</td>
							</tr>

						</table>
						<a href="/member/member_beforeModify"><button type="button"
								class="btn btn-default">회원정보 수정</button></a>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>