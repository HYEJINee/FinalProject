<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script>
function checkIt(){    
    var userinput=document.form;
    if(!userinput.user_email.value){
        alert("이메일 주소를 입력하세요.");
        userinput.user_email.focus();
        return false;
    }
    if(!userinput.user_nick.value){
        alert("닉네임을 입력하세요.");
        userinput.user_nick.focus();
        return false;
    }
    return true;
}
</script>
<style>
.notice {
	text-align: center;
	text-size: 15pt;
}

.formMargin {
	margin-top: 200px;
}
</style>
</head>
<body>

	<%@include file="../include/header.jsp"%>
	<div class="container body">
		<div class="col-sm-12 notice  formMargin">
			<h1>비밀번호 찾기입니다.</h1>
			이메일과 닉네임을 정확히 입력해주세요. 확인이 되면, 가입하신 메일주소로 메일을 보내드립니다.
			<form action="member_findPw" class="form-horizontal" method="post">
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
				<input type="submit" value="비밀번호 찾기"  onclick="checkIt()"/>
			</form>
		</div>
	</div>
</body>
</html>