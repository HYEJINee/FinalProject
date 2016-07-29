<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>TAWAR - 회원 정보 수정</title>
<link rel="stylesheet" href="/resources/member/css/member.css">
</head>
<body>
	<%@include file="../include/header.jsp"%>
	<div class="container body login ">
		<form class="form-horizontal" method="post"
			action="/member/member_beforeModify" name="form">
			<h2 class="text-center">회원정보 수정</h2>
			<hr />
			<div class="form-group">
				<label class="col-sm-3 control-label" for="user_pw">비밀번호</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" id="user_pw"
						name="user_pw" placeholder="수정을 위해 비밀번호를 입력하세요." />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3">
					&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit"
						class="btn btn-primary" value="확인"
						onclick="return ModifyCheckIt()" />
				</div>
			</div>
		</form>
	</div>
	<script src="/resources/member/js/member.js"></script>
</body>
</html>