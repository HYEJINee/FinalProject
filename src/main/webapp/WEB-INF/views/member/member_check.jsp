<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>TAWAR - 메일 인증</title>

<%@include file="../include/header.jsp"%>
<link rel="stylesheet" href="/resources/member/css/member.css">
<script>
	$(document).ready(function() {
		alert("인증이 완료되었습니다. 로그인페이지로 이동합니다.");
		var url = "/member/member_login";
		$(location).attr('href', url);
	});
</script>
</head>
<body>
	<div class="col-sm-12 notice"></div>
	<script src="/resources/member/js/member.js"></script>

</body>
</html>