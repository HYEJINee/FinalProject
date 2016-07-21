<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입 페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<style>
.body {
	margin-top: 50px
}
.notice{
 text-align: center;
 text-size : 15pt;
}
</style>

<script type="text/javascript">
	var email_check = "none";
	var nick_check = "none";
	var before_email = " ";
	var before_nick = " ";

	function chkUser_email() {
		$.ajax({
			url : "/member/chkUser_email",
			type : "post",
			data : {
				user_email : $("#user_email").val()
			},
			dataType : "json",
			success : function(data) {

				$(
						"<div style='text-align:center;'>" + data.resultMsg
								+ "</div>").dialog({
					modal : true,
					resizable : false,
					buttons : [ {
						text : "확인",
						click : function() {
							$(this).dialog("close");
						}
					} ]
				});
				$(".ui-dialog-titlebar").hide();

				if (data.result == "success") {
					email_check = "email_success";
					return true;
				} else {
					email_check = "email_fail";
					return false;
				}
			}
		});
	}

	function chkUser_nick() {
		$.ajax({
			url : "/member/chkUser_nick",
			type : "post",
			data : {
				user_nick : $("#user_nick").val()
			},
			dataType : "json",
			success : function(data) {

				$(
						"<div style='text-align:center;'>" + data.resultMsg
								+ "</div>").dialog({
					modal : true,
					resizable : false,
					buttons : [ {
						text : "확인",
						click : function() {
							$(this).dialog("close");
						}
					} ]
				});
				$(".ui-dialog-titlebar").hide();

				if (data.result == "success") {
					nick_check = "nick_success";
					return true;
				} else {
					nick_check = "nick_fail";
					return false;
				}
			}
		});
	}
	function checkIt() {
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

		var upw = document.form.user_pw.value;
		if (!/^[a-zA-Z0-9]{8,20}$/.test(upw)) {
			alert("비밀번호는 숫자와 영문자 조합으로 8~20자리를 사용해야 합니다.");
			return false;
		}
		var chk_num = upw.search(/[0-9]/g);
		var chk_eng = upw.search(/[a-z]/ig);
		if (chk_num < 0 || chk_eng < 0) {
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
		if (!userinput.user_nick.value) {
			alert("닉네임을 입력하세요.");
			userinput.user_nick.focus();
			return false;
		}

		if (email_check == "none") {
			alert("이메일 중복체크를 확인해주세요.");
			before_email=document.form.user_email.value;
			return false;
		}
		if (before_email != document.form.user_email.value) {
			alert("이메일 중복 체크를 다시 확인해주세요.");
			before_email=document.form.user_email.value;
			return false;
		}
		if (nick_check == "none") {
			alert("닉네임 중복체크를 확인해주세요.");

			before_nick=document.form.user_nick.value;
			return false;
		}

		if (before_nick !== document.form.user_nick.value) {
			alert("닉네임 중복 체크를 다시 확인해주세요.");
			before_nick=document.form.user_nick.value;
			return false;
		}

		
		if (email_check == "email_fail") {
			alert("중복된 아이디입니다.");
			userinput.user_email.focus();
			before_email = document.form.user_email.value;
			return false;
		}

		if (nick_check == "nick_fail") {
			alert("중복된 닉네임입니다.");
			userinput.user_nick.focus();
			before_nick = document.form.user_nick.value;
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
		if (chk_num < 0 || chk_eng < 0) {
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
</script>
</head>
<body>

<%@include file="../include/header.jsp" %>
	<div class="container body ">

		<form class="form-horizontal" method="post"
			action="/member/member_regist" name="form">
			<input type="hidden" name="param" value="join" />
			<h2 class="text-center">회원가입</h2>
			<hr />
			<div class="form-group">
				<label for="user_email" class="col-sm-3 control-label">이메일
					주소</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="user_email"
						id="user_email" placeholder="이메일" />
				</div>
				<div class="col-sm-1">
					<input type="button" class="btn btn-default" value="중복확인"
						onclick="return chkUser_email()" />
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
				<label for="user_nick" class="col-sm-3 control-label">닉네임 </label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="user_nick"
						id="user_nick" placeholder="닉네임" />
				</div>
				<div class="col-sm-1">
					<input type="button" class="btn btn-default" value="중복확인"
						onclick="return chkUser_nick()" />
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