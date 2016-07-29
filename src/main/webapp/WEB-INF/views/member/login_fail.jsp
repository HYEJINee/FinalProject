<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>TAWAR - 로그인</title>
<link rel="stylesheet" href="/resources/member/css/member.css">
<script>
	$(document).ready(function() {
		alert("아이디와 비밀번호가 올바르지 않습니다.");
	});
</script>
</head>
<body>
	<%@include file="../include/header.jsp"%>
	<div class="container body login">
		<form class="form-horizontal" method="post"
			action="/member/member_login" name="form">
			<input type="hidden" name="param" value="login" />
			<h2 class="text-center">로그인</h2>
			<hr />
			<div class="form-group">
				<label class="col-md-3 control-label" for="user_email">이메일
					주소</label>
				<div class="col-md-6">
					<input type="text" class="form-control" id="user_email"
						name="user_email" placeholder="이메일 주소를 입력하세요." />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="user_pw">비밀번호</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" id="user_pw"
						name="user_pw" placeholder="비밀번호를 입력하세요." />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3">
					&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit"
						class="btn btn-primary" value="로그인"
						onclick="return LoginCheckIt()" /> <a
						href="/member/member_regist"><input type="button"
						class="btn btn-default col-sm-offset-3" id="registbtn"
						value="회원가입" /></a> <a href="member/member_findPw"><input
						type="button" class="btn btn-default" id="losebtn" value="비밀번호 찾기" /></a>
				</div>
			</div>
		</form>
	</div>
	<script src="/resources/member/js/member.js"></script>
</body>
</html>