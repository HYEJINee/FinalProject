<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>TAWAR - 회원 가입</title>

<%@include file="../include/header.jsp" %>
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">

<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/member/css/member.css">

<script>
	var email_check = "email_none";
	var nick_check = "nick_none";
	var before_email = " ";
	var before_nick = " ";
	//회원 가입 시 유효성 검사

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
	function RegCheckIt() {
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

		if (email_check == "email_none") {
			alert("이메일 중복체크를 확인해주세요.");
			before_email = document.form.user_email.value;
			return false;
		} else if (email_check == "email_fail"
				&& before_email != document.form.user_email.value) {
			alert("이메일 중복 체크를 다시 확인해주세요.");
			before_email = document.form.user_email.value;
			return false;
		}

		else if (email_check == "email_fail") {
			alert("중복된 아이디입니다.");
			userinput.user_email.focus();
			before_email = document.form.user_email.value;
			return false;
		}

		if (nick_check == "nick_none") {
			alert("닉네임 중복체크를 확인해주세요.");
			before_nick = document.form.user_nick.value;
			return false;
		} else if (nick_check == "nick_fail"
				&& before_nick !== document.form.user_nick.value) {
			alert("닉네임 중복 체크를 다시 확인해주세요.");
			before_nick = document.form.user_nick.value;
			return false;

		} else if (nick_check == "nick_fail") {
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


	<div class="container body " style="margin-top:0px;">
		<form class="col s12" method="post" action="/member/member_regist"
			name="form">
			<h4 style="text-align: center">회원가입</h4>
			<hr />
			<div class="row"  style="margin-top:40px;">
				<div class="input-field col s4 offset-s3">
				<i class="small material-icons prefix">email</i>
					<input id="user_email" type="text"><label for="user_email">이메일
						주소</label>
				</div>
				<div class="col s1">
					<input type="button" class="btn waves-effect waves-light"
						value="중복확인" onclick="return chkUser_email()" />
				</div>
			</div>
			<div class="row">
				<div class="input-field col s4 offset-s3">
				<i class="small material-icons prefix">vpn_key</i>
					<input placeholder="영문과 숫자 조합 8자리 이상 입력하세요." id="user_pw"
						type="password" onkeyup="checkPwd()"> <label for="user_pw">비밀번호</label>
				</div>
				<div class="col s3" id="checkPwd"></div>
			</div>
			<div class="row">
				<div class="input-field col s4 offset-s3">	<i class="small material-icons prefix">vpn_key</i>
					<input id="user_pw2" type="password" onkeyup="checkPwd2()">
					<label for="user_pw2">비밀번호 확인</label>
				</div>

				<div class="col s3" id="checkPwd2"></div>
			</div>
			<div class="row">
				<div class="input-field col s4 offset-s3">	<i class="small material-icons prefix">perm_identity</i>
					<input id="user_nick" type="text"> <label for="user_nick">닉네임</label>
				</div>
				<div class="col s1">
					<input type="button" class="btn waves-effect waves-light"
						value="중복확인" onclick="return chkUser_nick()" />
				</div>
			</div>
			<hr/>
			<div class="row" style="margin-top:40px;">
				<div class="col s4 offset-s10">
					<button class="btn waves-effect waves-light blue accent-3" type="submit"
						onclick="return RegCheckIt()">가입하기  <i class="material-icons right">send</i></button>
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>

</body>
</html>