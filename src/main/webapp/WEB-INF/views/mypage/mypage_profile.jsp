<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<div class="row">

	<!-- 커버 이미지 등록 -->
	<div class="jumbotron col-md-3 mypage-profile-picture">
		<div id="profile-img-div" >
			<div id="profile-img-wrapper"></div>
			<img id="profile-test" class="round-profile-150"
							src="/resources/${USER_KEY.profile_file_name}.${USER_KEY.profile_ext_name}" />
		</div>
		<p class="text-center" style="font-size: 12pt">이미지 파일은 JPG,
			JPEG,GIF, PNG형식만 가능합니다.</p>
		<form id="formCoverImg" action="uploadProfile" method="post" enctype="multipart/form-data">
			<input type="file" id="profile-img-up" name="image_file_name" />
			<button id="profile-img-btn" type="button" class="btn btn-default">변경</button>
			<button id="profile-img-submit" type="submit" class="btn btn-primary"
				onclick="uploadProfile(${USER_KEY.user_no)">등록</button>
		</form>

	</div>

	<!-- 커버 이미지 등록 -->
	<div class="col-md-7 mypage-profile-picture">
		<table width="100%">
			<tr>
				<td>
					<c:if test="${USER_KEY.user_lv==0}">
						<input type="image" src="/resources/user_lv/common.png" />
					</c:if> 
					<c:if test="${USER_KEY.user_lv==1}">
						<input type="image" src="/resources/user_lv/prestige.png" />
					</c:if> 
					<c:if test="${USER_KEY.user_lv==2}">
						<input type="image" src="/resources/user_lv/royal.png" />
					</c:if> 
					<c:if test="${USER_KEY.user_lv==3}">
						<input type="image" src="/resources/user_lv/vip.png" />
					</c:if> 
					<c:if test="${USER_KEY.user_lv==4}">
						<input type="image" src="/resources/user_lv/vvip.png" />
					</c:if>
				<td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td class="align-right">${USER_KEY.user_nick }</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td class="align-right">${USER_KEY.user_email }</td>
			</tr>

			<tr>
				<td>비밀번호</td>
				<td class="align-right">${USER_KEY.user_pw }</td>
			</tr>

		</table>
		<a href="/member/member_beforeModify"><button type="button"
				class="btn btn-default">회원정보 수정</button></a>
	</div>
</div>
</html>