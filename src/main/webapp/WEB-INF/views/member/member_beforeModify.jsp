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

		<form class="form-horizontal" method="post" action="/member/member_beforeModify" name="form" >
			<h2 class="text-center">회원정보 수정</h2>
			<hr/>
			
		
			<div class="form-group">
				<label class="col-sm-3 control-label" for="user_pw">비밀번호</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="수정을 위해 비밀번호를 입력하세요." />
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-3">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" class="btn btn-primary" value="확인" onclick="return checkIt()"/>
				</div>
			</div>	
		</form>

		</div>
</body>
</html>