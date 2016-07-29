<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>TAWAR - 비밀번호 찾기</title>

<%@include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/member/css/member.css">
</head>
<body>
	<div class="container body">
		<div class="col-sm-12 notice  findPw">
			<h2>비밀번호 찾기입니다.</h2>
			<h5>이메일과 닉네임을 정확히 입력해주세요. 확인이 되면, 가입하신 메일주소로 메일을 보내드립니다.</h5><br/>
			<form action="member_findPw" class="form-horizontal" method="post" name="form1">
				<div class="form-group">
					<label for="user_email" class="col-sm-3 control-label">이메일
						주소</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="user_email"
							id="user_email" placeholder="이메일" />
					</div>
				</div>
				<div class="form-group">
					<label for="user_nick" class="col-sm-3 control-label">닉네임</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="user_nick"
							id="user_nick" placeholder="닉네임" />
					</div>
				</div>
				<input type="submit"  value="비밀번호 찾기"  onclick="return FindPwCheckIt()"/>
			</form>
		</div>
	</div>
	<script src="/resources/member/js/member.js"></script>
</body>
</html>