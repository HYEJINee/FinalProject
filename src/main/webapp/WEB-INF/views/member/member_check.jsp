<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>

<style>
.notice{
margin-top : 300px;
 text-align: center;
 text-size : 25pt;
}
</style>
<script>
$(document).ready(function(){
	alert("인증이 완료되었습니다. 로그인페이지로 이동합니다.");
	var url = "/member/member_login";    
	$(location).attr('href',url);
});
</script>
</head>
<body>
<%@include file="../include/header.jsp" %>
<div class="col-sm-12 notice">
</div>
</body>
</html>