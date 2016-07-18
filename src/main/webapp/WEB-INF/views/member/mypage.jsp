<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Mypage</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
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
	<div class="container">
		<div class="row">
			<div class="mypage-header-container">
				<div class="mypage-header-profile">
					<img class="center round-profile-150" src="${USER_KEY.user_profile }" />
				</div>
				<div class="mypage-header-user"><h3>${USER_KEY.user_nick }의 페이지</h3></div>
			</div>
		</div>
		<div class="nav-container">
			<ul class="center nav nav-pills">
				<li role="presentation" class="active">
					<a href="#alarm" aria-controls="alarm" role="tab" data-toggle="tab">알림</a>
				</li>
				<li role="presentation">
					<a href="#activity" aria-controls="acitivty" role="tab" data-toggle="tab">활동</a>
				</li>
				<li role="presentation">
					<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">프로필</a>
				</li>
			</ul>
		</div>
		<hr/>
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="alarm">
				<div class="alert alert-warning alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<a href="#" class="alert-link">정치권 철새현상에 대한 의견</a> 안건에 총 11명이 참여했습니다.
				</div>
				<div class="alert alert-danger" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<a href="#" class="alert-link">Spartan1</a>님이 <a href="#" class="alert-link">자살은 개인의 선택이다</a>에 대한 의견에 답글을 달았습니다.
				</div>
				<div class="alert alert-info" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<a href="#" class="alert-link">정치권 철새현상에 대한 의견</a> 안건이 통과되어 토론중입니다.
				</div>
				
			</div>
			<div role="tabpanel" class="tab-pane " id="activity">
				<div class="row">
				<div class="dropdown mypage-activity-filter">
					<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
						필터
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
						<li><a href="#">모두보기</a></li>
						<li><a href="#">안건</a></li>
						<li><a href="#">의견</a></li>
						<li><a href="#">투표</a></li>
					</ul>
				</div>
				</div>
				<div class="mypage-activity-list">
					<div class="row mypage-activity-row">
						<div class="col-md-3 mypage-activity-date">2016. 5. 10</div>
						<div class="col-md-9 mypage-activity-all mypage-activity-opinion"><a href="#">자살은 개인의 선택이다</a> 에 <strong>찬성</strong>의견을 달았습니다.</div>
					</div>
					<div class="row mypage-activity-row">
						<div class="col-md-3 mypage-activity-date">2016. 5. 5</div>
						<div class="col-md-9 mypage-activity-all mypage-activity-topic"><a href="#" class="alert-link">정치권 철새현상에 대한 의견</a> 안건의 상태가 토론중으로 바뀌었습니다.</div>
					</div>
					<div class="row mypage-activity-row">
						<div class="col-md-3 mypage-activity-date">2016. 4. 23</div>
						<div class="col-md-9 mypage-activity-all mypage-activity-topic"><a href="#" class="alert-link">정치권 철새현상에 대한 의견</a> 안건을 등록했습니다.</div>
					</div>
					<div class="row mypage-activity-row">
						<div class="col-md-3 mypage-activity-date">2016. 4. 22</div>
						<div class="col-md-9 mypage-activity-all mypage-activity-vote"><a href="#" class="alert-link">자살은 개인의 선택이다</a> 에 <strong>찬성</strong>투표를 하였습니다.</div>
					</div>
				</div>
			</div>
			<div role="tabpanel" class="tab-pane" id="profile">
				<div class="row">
				<div class="col-md-3 mypage-profile-picture">
					<img class="round-profile-150" src="${USER_KEY.user_profile }" />
					<button type="button" class="btn btn-default btn-sm">프로필 사진 수정</button>
				</div>
				<div class="col-md-8 mypage-profile-details">
					<button type="button" class="btn btn-default">프로필 수정</button>
					<table width="100%">
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

					<tr>
						<td>비밀번호 분실 질문</td>
						<td class="align-right">친한 친구의 이름은?</td>
					</tr>
					<tr>
						<td>비밀번호 분실 답변</td>
						<td class="align-right">***</td>
					</tr>
				</table>
				</div>
				</div>
			</div>

		</div>
		
	</body>
	</html>