<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>TAWAR - 안건 건의</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/proposal/css/write.css" rel="stylesheet" />
</head>
<body>
<c:choose>
	<c:when test="${empty USER_KEY == false}">
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/header.jsp" />
	
	<!-- 커버 이미지 등록 -->
	<form id="formCoverImg" action="write.do" method="post" enctype="multipart/form-data">			
		<div id="divCoverImg" class="jumbotron col-md-12">
		<!-- <img alt="" src="/myapp/resources/proposal/img/example.jpg" class="img-responsive"> -->
			<p class="text-center">
				<input type="file" id="coverImgUp" name="coverImgUp" class="hidden">
				<button id="btnCoverImg" type="button" class="btn btn-default">커버 이미지 등록</button>
			</p>
		</div>
	<!-- 커버 이미지 등록 -->
	
		<div class="container">
			<div class="row">

				<div class="col-md-12">
					<h5 id="notice" class="text-center">공지 : 안건이 토론주제로 승인 받기 위해서는 글 작성시부터 10일 이내에 20표가 필요합니다.</h5>
				</div>
			
			<!-- 토론 형식 선택 -->			
				<div class="col-md-12">
					<div id="debateType" class="btn-group">
						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
							토론 형식 <span class="caret"></span>
						</button>
						<ul id="btn_topic_type" class="dropdown-menu" role="menu">
							<li><a>찬반 토론 </a></li>
							<li><a>자유 토론 </a></li>
						</ul>
						<input type="hidden" id="hid_topic_type" name="topic_type"/>
					</div>
				</div>
			<!-- 토론 형식 선택 -->			

			<!-- 안건 세부 사항 입력 -->
				<div class="col-md-12">
					<input type="text" id="prop-title" class="form-control" name="topic_title"
						placeholder="제목을 입력해주세요" />
					<textarea id="prop-lead" class="form-control" name="topic_short_cont"
						placeholder="건의하시는 안건에 대하여 간략한 정보를 입력해주세요."></textarea>
					<textarea id="prop-body" class="form-control" rows="10" name="topic_long_cont"
						placeholder="건의하시는 안건에 대한 상세한 정보를 입력해주세요."></textarea>
					<hr />
					<h4>참고자료</h4>
					<div id="references">
						<div class="reference bs-callout bs-callout-primary">
							<input type="text" class="form-control"
								placeholder="참고자료 제목 - 예) [한겨레] 자살, 개인 선택인가 사회문제인가" /><br>
							<input type="text" class="form-control"
								placeholder="참고자료 링크 - 예) http://www.hani.co.kr/arti/society/schooling/288194.html" />
						</div>
					</div>
					<p class="text-center">
						<button id="btnAddRef" type="button" class="customBtn btn-add-reference customBtn-lg">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 참고 자료 추가
						</button>
						<button id="btnRemoveRef" type="button" class="customBtn btn-remove-reference customBtn-lg">
							<span class="glyphicon glyphicon-minus"></span> 참고 자료 삭제
						</button>
					</p>
					<hr />
				</div>

				<div class="col-md-12">
					<div class="row">
						<div class="col-md-6">
							<h4>찬성 의견</h4>
							<textarea class="form-control" rows="10"
								placeholder="이 안건에 대한 찬성 의견을 뒷받침하는 내용을 작성해주세요."></textarea>
						</div>
						<div class="col-md-6">
							<h4>반대 의견</h4>
							<textarea class="form-control" rows="10"
								placeholder="이 안건에 대한 반대 의견을 뒷받침하는 내용을 작성해주세요."></textarea>
						</div>
					</div>
			<!-- 안건 세부 사항 입력 -->

					<hr>

			<!-- 안건 등록 -->
					<div class="col-md-12">
						<p class="text-center">
							<input type="hidden" name="user_no" value="${USER_KEY.user_no}">
							<button id="btnSubmit" type="submit" class="btn btn-lg btn-primary">안건 건의 글 등록하기</button>
						</p>
					</div>
			<!-- 안건 등록 -->
				</div>
			</div><!-- row -->
		</div><!-- container -->
	</form>
	</c:when>
	<c:otherwise>
		<c:redirect url="/proposal/list" />
	</c:otherwise>
</c:choose>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/proposal/js/write.js"></script>
</body>
</html>