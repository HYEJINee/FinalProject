<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Mypage</title>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/main/css/main.css">
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
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

.mypage-timeline-filter {
	float: right;
	margin-bottom: 15px;
}

.mypage-timeline-row {
	margin-bottom: 7px;
}

.mypage-timeline-date {
	padding-top: 1em;
}

.mypage-timeline-all {
	padding: 1em;
	border-radius: 4px;
	border: blue 1px solid;
}

.mypage-timeline-topic {
	border-color: blue;
}

.mypage-timeline-opinion {
	border-color: red;
}

.mypage-timeline-vote {
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
							<a href="/read/read?topic_no=${notiDTO.topic_no }"
								onclick="dismissNoti(${notiDTO.noti_no })" class="alert-link">${notiDTO.other_user_nick }</a>님이  
							</c:if>

						<a href="/read/read?topic_no=${notiDTO.noti_no }"
							class="alert-link">${notiDTO.topic_title }</a>${notiDTO.noti_statement }
					</div>
				</c:forEach>

			</div>
			<div role="tabpanel" class="tab-pane" id="my-topic">
				<div class="row">
					<div class="col-md-12">
						<center>
							<h3>토론중</h3>
						</center>
						<hr />
						<c:choose>
							<c:when test="${getMyList.size() eq 0}">
								<center>
									<h3>게시물이 없습니다.</h3>
								</center>
							</c:when>
							<c:otherwise>
								<c:forEach items="${getMyList}" var="myList">
									<!-- begin="${beginPerPage}" end="${beginPerPage + numPerPage -1}" -->
									<c:choose>
										<c:when test="${myList.topic_type eq 0}">
											<div class="item list_item col-md-3 col-md-offset-1">
												<input type="hidden" name="topic_no"
													value="${myList.topic_no}" /> <label
													class="label label-primary">찬반</label><br />
												<center>
													<h3>${myList.topic_title}</h3>
												</center>
												<hr />
												<p>${myList.topic_short_cont}</p>
												<span class="glyphicon glyphicon-user">
													${myList.debate_tot_pro + myList.debate_tot_con + myList.debate_tot_neut}</span>
												<c:choose>
													<c:when test="${myList.debate_tot_pro eq 0}">
														<span id="pro"> 찬 0%</span>
													</c:when>
													<c:otherwise>
														<span id="pro"> 찬 <fmt:formatNumber
																value="${myList.debate_tot_pro/(myList.debate_tot_pro + myList.debate_tot_con + myList.debate_tot_neut)*100}"
																pattern=".0" />%
														</span>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${myList.debate_tot_con eq 0}">
														<span id="con"> 반 0%</span>
													</c:when>
													<c:otherwise>
														<span id="con"> 반 <fmt:formatNumber
																value="${myList.debate_tot_con/(myList.debate_tot_pro + myList.debate_tot_con + myList.debate_tot_neut)*100}"
																pattern=".0" />%
														</span>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${myList.debate_tot_neut eq 0}">
														<span id="neut"> 중 0%</span>
													</c:when>
													<c:otherwise>
														<span id="neut"> 중 <fmt:formatNumber
																value="${myList.debate_tot_neut/(myList.debate_tot_pro + myList.debate_tot_con + myList.debate_tot_neut)*100}"
																pattern=".0" />%
														</span>
													</c:otherwise>
												</c:choose>
											</div>
										</c:when>
										<c:when test="${myList.topic_type eq 1}">
											<div class="item list_item type1 col-md-3 col-md-offset-1">
												<input type="hidden" name="topic_no"
													value="${myList.topic_no}" /> <label
													class="label label-danger">의견</label><br />
												<center>
													<h3>${myList.topic_title}</h3>
												</center>
												<hr />
												<p>${myList.topic_short_cont}</p>
												<span class="glyphicon glyphicon-education">
													${myList.op_cnt}</span>
											</div>
										</c:when>
									</c:choose>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="board_title col-md-10">
							<h3>안건 건의</h3>
							<a href="/proposal/list">전체 안건 보기</a>
						</div>
						<div class="col-md-10">
							<c:set var="recomnd_loop" value="false" />
							<c:forEach items="${getMyRecmdList}" var="recmdList" varStatus="status">
								<c:if test="${not recomnd_loop}">
									<div class="item">
										<input type="hidden" name="topic_no"
											value="${recmdList.topic_no}" />
										<c:choose>
											<c:when test="${recmdList.topic_type eq 0}">
												<label class="label label-primary">찬반</label>
											</c:when>
											<c:when test="${recmdList.topic_type eq 1}">
												<label class="label label-danger">의견</label>
											</c:when>
										</c:choose>
										<span id="board_title"">${recmdList.topic_title}</span> <span
											id="board_icon" class="glyphicon glyphicon-star">${recmdList.recomnd_cnt}</span>
									</div>
								</c:if>
								<c:if test="${status.count eq 7}">
									<c:set var="recomnd_loop" value="true" />
								</c:if>
							</c:forEach>
						</div>
					</div>
					<div id="last" class="col-md-6"">
						<div class="board_title col-md-10">
							<h3>종료된 토론</h3>
							<a href="/finished/list">전체 토론 보기</a>
						</div>
						<div class="col-md-10">
							<c:set var="fin_loop" value="false" />
							<c:forEach items="${getMyFinishList}" var="finishList" varStatus="status">
								<c:if test="${not fin_loop}">
									<div class="item">
										<input type="hidden" name="topic_no"
											value="${finishList.topic_no}" />
										<c:choose>
											<c:when test="${finishList.topic_type eq 0}">
												<label class="label label-primary">찬반</label>
											</c:when>
											<c:when test="${finishList.topic_type eq 1}">
												<label class="label label-danger">의견</label>
											</c:when>
										</c:choose>
										<span id="board_title">${finishList.topic_title}</span>
										<c:if test="${finishList.topic_type eq 0}">
											<c:choose>
												<c:when test="${finishList.debate_tot_pro eq 0}">
													<span id="pro_board"> 찬 0%</span>
												</c:when>
												<c:otherwise>
													<span id="pro_board"> 찬 <fmt:formatNumber
															value="${finishList.debate_tot_pro/(finishList.debate_tot_pro + finishList.debate_tot_con + finishList.debate_tot_neut)*100}"
															pattern=".0" />%
													</span>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${finishList.debate_tot_con eq 0}">
													<span id="con"> 반 0%</span>
												</c:when>
												<c:otherwise>
													<span id="con"> 반 <fmt:formatNumber
															value="${finishList.debate_tot_con/(finishList.debate_tot_pro + finishList.debate_tot_con + finishList.debate_tot_neut)*100}"
															pattern=".0" />%
													</span>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${finishList.debate_tot_neut eq 0}">
													<span id="neut"> 중 0%</span>
												</c:when>
												<c:otherwise>
													<span id="neut"> 중 <fmt:formatNumber
															value="${finishList.debate_tot_neut/(finishList.debate_tot_pro + finishList.debate_tot_con + finishList.debate_tot_neut)*100}"
															pattern=".0" />%
													</span>
												</c:otherwise>
											</c:choose>
										</c:if>
										<c:if test="${finishList.topic_type eq 1}">
											<span id="board_icon" class="glyphicon glyphicon-education">
												${finishList.op_cnt}</span>
										</c:if>
									</div>
								</c:if>
								<c:if test="${status.count eq 7}">
									<c:set var="fin_loop" value="true" />
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div role="tabpanel" class="tab-pane " id="timeline">
				<div class="row">
					<div class="dropdown mypage-timeline-filter">
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
				<div class="mypage-timeline-list">
					<c:forEach items="${timeline}" var="mypageDTO">
						<div
							class="row mypage-timeline-row mypage-row-${mypageDTO.timeline_css }">
							<div class="col-md-3 mypage-timeline-date">${mypageDTO.timeline_date }</div>
							<div
								class="col-md-9 mypage-timeline-all mypage-timeline-${mypageDTO.timeline_css }">
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