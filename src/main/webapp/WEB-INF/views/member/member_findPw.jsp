<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h1>비밀번호 찾기입니다.</h1>
	이메일과 닉네임을 정확히 입력해주세요. 확인이 되면, 가입하신 메일주소로 메일을 보내드립니다.
	<form action="member_findPw" method="post">
	<div class="col-sm-6">
		<input type="text" class="form-control" name="user_email"
			id="user_email" placeholder="이메일" />
	</div>
	<div class="col-sm-6">
		<input type="text" class="form-control" name="user_nick"
			id="user_nick" placeholder="닉네임" />
	</div>
	
<input type="submit" value="비밀번호 찾기"/>
</form>
</body>
</html>