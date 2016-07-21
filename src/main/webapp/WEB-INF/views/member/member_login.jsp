<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
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
<script>
		function checkIt(){    
		    var userinput=document.form;
		    if(!userinput.user_email.value){
		        alert("이메일 주소를 입력하세요.");
		        userinput.user_email.focus();
		        return false;
		    }
		    if(!userinput.user_pw.value){
		        alert("비밀번호를 입력하세요.");
		        userinput.user_pw.focus();
		        return false;
		    }
		    return true;
		}
		
</script>
<style>
.login{
margin-top:200px;
}
 a:link { color: red; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: blue; text-decoration: underline;}
</style>
</head>
<body>

<%@include file="../include/header.jsp" %>
<div class="container body login ">

		<form class="form-horizontal" method="post" action="/member/member_login" name="form" >
			<input type="hidden" name="param" value="login"/>
			<h2 class="text-center">로그인</h2>
			<hr/>
			
			<div class="form-group">
				<label class="col-md-3 control-label" for="user_email">이메일 주소</label>
				<div class="col-md-6">
					<input type="text" class="form-control" id="user_email" name="user_email" placeholder="이메일 주소를 입력하세요." />
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label" for="user_pw">비밀번호</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="비밀번호를 입력하세요." />
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-3">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" class="btn btn-primary" value="로그인" onclick="return checkIt()"/>
					<a href="/member/member_regist"><input type="button" class="btn btn-default col-sm-offset-3" id="registbtn" value="회원가입"/></a>
					<a href="member/member_findPw"><input type="button" class="btn btn-default" id="losebtn" value="비밀번호 찾기"/></a>
				
				</div>
			</div>	
		</form>

		</div>
</body>
</html>