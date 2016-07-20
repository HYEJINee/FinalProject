<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
	.login_page{
		margin-top: 100px;
	}
</style>
</head>
<body>
<%@include file="../include/header.jsp" %>
<div class="container login_page">
<spring:hasBindErrors name="memberVO" />
<form:errors name="memberVO" />
	<form method="post" action="/member/login">
		<table>
			<tr>
				<td>이메일 :</td>
				<td><input type="text" name="user_email" />
				<div style="color:red"><form:errors path="memberVO.user_email"/><!-- properties에 정의한 key 값 --></div>
				</td>
			</tr>
			<tr>
				<td>패스워드 :</td>
				<td><input type="password" name="user_pw" />
				<div style="color:red"><form:errors path="memberVO.user_pw"/></div></td>
				
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" name="로그인" />&nbsp;&nbsp;
					<input type="reset" name="취소" /></td>
					<div style="color:red"><form:errors path="memberVO"/></div>
			</tr>
		</table>
	</form>
	<a href="/WEB-INF/views/member/member_findEmail.jsp"><input type="button" name="find_email"  value="이메일 찾기"/></a>
	<input type="button" name="find_pw" value="비밀번호 찾기"/>
	</div>
</body>
</html>