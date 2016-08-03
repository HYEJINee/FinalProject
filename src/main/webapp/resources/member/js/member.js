
// 비밀번호 찾기 시 유효성 검사
function FindPwCheckIt() {
	var userinput = document.form1;
	if (!userinput.user_email.value) {
		alert("이메일 주소를 입력하세요.");
		userinput.user_email.focus();
		return false;
	}
	if (!userinput.user_nick.value) {
		alert("닉네임을 입력하세요.");
		userinput.user_nick.focus();
		return false;
	}
	return true;
}
// 회원정보 수정, 비밀번호 일치 실패 시
function ModifyCheckIt() {
	var userinput = document.form;

	if (!userinput.user_pw.value) {
		alert("비밀번호를 입력하세요.");
		userinput.user_pw.focus();
		return false;
	}
	return true;
}

// 로그인
function LoginCheckIt() {
	var userinput = document.form;
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
	return true;
}
