<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
.body {
	margin-top: 50px
}
</style>
<script type="text/javascript">
	function checkIt() {
		var userinput = document.form;
		if (!userinput.user_nick.value) {
			alert("별명을 입력하세요.");
			userinput.user_nick.focus();
			return false;
		}
		if (!userinput.user_email.value) {
			alert("이메일 주소를 입력하세요.");
			userinput.user_email.focus();
			return false;
		}
		if (!userinput.user_pw.value) {
			alert("비밀번호를 입력하세요.");
			userinput.user_pw.focus();
			return false;
		}
		var upw = document.form.user_pw.value;
		if (!/^[a-zA-Z0-9]{8,20}$/.test(upw)) {
			alert("비밀번호는 숫자와 영문자 조합으로 8~20자리를 사용해야 합니다.");
			return false;
		}
		var chk_num = upw.search(/[0-9]/g);
		var chk_eng = upw.search(/[a-z]/ig);
		if (chk_num < 0 || chk_eng < 0)
		{
			alert("비밀번호는 숫자와 영문자를 혼용하여야 합니다.");
			return false;
		}
		if (!userinput.user_pw2.value) {
			alert("비밀번호 확인을 입력하세요.");
			userinput.user_pw2.focus();
			return false;
		}
		var pw1 = document.form.user_pw.value;
		var pw2 = document.form.user_pw2.value;
		if (pw1 != pw2) {
			alert("동일한 암호를 입력하세요.");
			return false;
		}
		if (!userinput.Joinanswer.value) {
			alert("질문의 답변을 입력하세요.");
			userinput.Joinanswer.focus();
			return false;
		}
		var ni = document.nickform.nick.value;
		var em = document.emailform.emi.value;
		var b = "b";
		if (ni != b) {
			alert("별명 중복체크를 확인해주세요.");
			return false;
		}
		if (em != b) {
			alert("이메일 중복체크를 확인해주세요.");
			return false;
		}
		return true;
	}

	function checkPwd() {
		var upw = document.form.user_pw.value;
		if (!/^[a-zA-Z0-9]{8,20}$/.test(upw)) {
			document.getElementById('checkPwd').style.color = "red";
			document.getElementById('checkPwd').innerHTML = "비밀번호는 숫자와 영문자 조합으로 8~20자리를 사용해야 합니다.";
			return false;
		}
		var chk_num = upw.search(/[0-9]/g);
		var chk_eng = upw.search(/[a-z]/ig);
		if (chk_num < 0 || chk_eng < 0)
		{
			document.getElementById('checkPwd').style.color = "red";
			document.getElementById('checkPwd').innerHTML = "비밀번호는 숫자와 영문자를 혼용하여야 합니다.";
			return false;
		}
		document.getElementById('checkPwd').style.color = "green";
		document.getElementById('checkPwd').innerHTML = "안전한 비밀번호 입니다.";
		return true;
	}

	function checkPwd2() {
		var pw1 = document.form.user_pw.value;
		var pw2 = document.form.user_pw2.value;
		if (pw1 != pw2) {
			document.getElementById('checkPwd2').style.color = "red";
			document.getElementById('checkPwd2').innerHTML = "동일한 암호를 입력하세요.";
		} else {
			document.getElementById('checkPwd2').style.color = "green";
			document.getElementById('checkPwd2').innerHTML = "암호가 확인 되었습니다.";
		}
	}
	function nicknamechk() {
		var chk = document.form.user_nick.value;
		window.open("user_nickchk.jsp?chk=" + chk, "",
					"width=350, height=200, toolbar=no, location=no,status=no,menubar=no, scrollbars=no, resizable=no,fullscreen=no");
	}
	function eamilchk() {
		var chk = document.form.user_email.value;
		window.open("user_emailchk.jsp?chk=" + chk,"",
					"width=350, height=200, toolbar=no, location=no,status=no,menubar=no, scrollbars=no, resizable=no,fullscreen=no");
	}
	
</script>
</head>
<body>
	<div class="container body">

		<form class="form-horizontal" method="post" action="/member/member_regist"
			name="form">
			<input type="hidden" name="param" value="join" />
			<h2 class="text-center">회원가입</h2>
			<hr />
		<div class="form-group">
				<label for="user_email" class="col-sm-3 control-label">이메일 주소</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="user_email"
						id="user_email" placeholder="이메일" />
				</div>
				<div class="col-sm-1">
					<input type="button" class="btn btn-default" value="중복확인"
						onclick="eamilchk()" />
				</div>
			</div>

			<div class="form-group">
				<label for="user_pw" class="col-sm-3 control-label">비밀번호</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" name="user_pw"
						id="user_pw" placeholder="영문과 숫자 조합 8자리 이상 입력하세요."
						onkeyup="checkPwd()" />
				</div>
				<div class="col-sm-3" id="checkPwd"></div>
			</div>

			<div class="form-group">
				<label for="user_pw2" class="col-sm-3 control-label">비밀번호 확인</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" name="user_pw2"
						placeholder="비밀번호 확인" onkeyup="checkPwd2()" />
				</div>
				<div class="col-sm-3" id="checkPwd2"></div>
			</div>
	
			<div class="form-group">
				<label for="user_nick" class="col-sm-3 control-label">별명
				</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="user_nick"
						id="user_nick" placeholder="별명" />
				</div>
				<div class="col-sm-1">
					<input type="button" class="btn btn-default" value="중복확인"
						onclick="nicknamechk()" />
				</div>
			</div>

	
		
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-2">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
						type="submit" class="btn btn-primary" value="가입하기"
						onclick="return checkIt()" />
				</div>
			</div>
		</form>
		<form name="nickform">
			<input type="hidden" id="nick" />
		</form>
		<form name="emailform">
			<input type="hidden" id="emi" />
		</form>
		
	</div>
</body>
</html>