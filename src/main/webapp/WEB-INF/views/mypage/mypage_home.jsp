<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Mypage</title>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/list_item.css">
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>

</head>

<body>
	<%@include file="../include/header.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mypage/css/mypage.css">
	<div class="container">
		<div class="row ">
			<div class="mypage-header-container">
				<div class="center mypage-header-profile profile-150">
					<div class="round-profile"
						style="background-image: url(/resources/mypage/img/${USER_KEY.user_profile})">
							<img class="user-lv-45" src="${USER_KEY.user_lv_img }" />
						</div>
						
				</div>
				<div class="mypage-header-user">
					<h3>${USER_KEY.user_nick }의 페이지</h3>
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
				<%@include file="mypage_topic.jsp"%>
			</div>
			<div role="tabpanel" class="tab-pane " id="timeline">
				<%@include file="mypage_time.jsp"%>
			</div>
			<div role="tabpanel" class="tab-pane" id="profile">
				<div class="row">
					<!-- 프로필 이미지 등록 -->
					<div class="jumbotron col-md-4 mypage-profile-picture">
						<form id="formCoverImg" action="uploadProfile" method="post"
							enctype="multipart/form-data">
							<div id="profile-img-div" class="center profile-150">
								<div id="profile-img-wrapper"></div>
								<img id="profile-test" class="round-profile"
									src="/resources/mypage/img/${USER_KEY.user_profile}" />
							</div>
							<br/>
							<p class="text-center" style="font-size: 10pt">이미지 파일은 JPG,
								JPEG, GIF, <br/>PNG형식만 가능합니다.</p>
							<input type="file" id="profile-img-up" name="image_file_name" />
							<div class="center">
								<button id="profile-img-btn" type="button"
								class="btn btn-default">변경</button>
							<button id="profile-img-submit" type="submit"
								class="btn btn-primary"
								onclick="uploadProfile(${USER_KEY.user_no})">등록</button>
							</div>
							
						</form>
					</div>
					<!-- 프로필  이미지 등록 -->
					<div class="col-md-7 col-md-offset-1 mypage-profile-picture">
						<table width="100%">
							<tr>
								<td>회원 등급</td>
								<td class="align-right"><img class="user-lv-45" src="${USER_KEY.user_lv_img }" style="position: relative"/></td>
							</tr>
							<tr>
								<td>닉네임</td>
								<td class="align-right">${USER_KEY.user_nick }</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td class="align-right">${USER_KEY.user_email }</td>
							</tr>
						</table>
						<br/>
						<a href="/member/member_beforeModify"><button type="button"
								class="btn btn-default">회원정보 수정</button></a>
					</div>
				</div>
			</div>
		</div>
		<script
			src="${pageContext.request.contextPath}/resources/mypage/js/mypage.js"></script>
		<script
			src="https://npmcdn.com/masonry-layout@4.1/dist/masonry.pkgd.min.js"></script>
		<script
			src="https://npmcdn.com/isotope-layout@3.0.1/dist/isotope.pkgd.min.js"></script>
		<script src="/resources/proposal/js/jquery.infinitescroll.min.js"></script>
</body>
</html>