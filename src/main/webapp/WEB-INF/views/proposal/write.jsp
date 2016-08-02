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
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/include/header.jsp" />
<c:choose>
	<c:when test="${empty USER_KEY == false}">
	
	<div class="container">
		<div class="row">
			<form id="formCoverImg" action="write.do" method="post" enctype="multipart/form-data">
			<!-- 커버 이미지 등록 -->
				<div id="divCoverImg" class="jumbotron col-md-12">
					<div id="divBtnCoverImg">
						<input type="file" id="coverImgUp" name="image_file_name"/>
						<button id="btnCoverImg" type="button" class="btn btn-default">커버 이미지 등록</button>
						<p class="text-center" style="font-size: 12pt">이미지 파일은 JPG, JPEG, GIF, PNG형식만 가능합니다.</p>
					</div>
				</div>
			<!-- 커버 이미지 등록 -->
		

				<div class="col-md-12">
					<h5 id="notice" class="text-center">공지 : 안건이 토론주제로 승인 받기 위해서는 글 작성시부터 10일 이내에 20표가 필요합니다.</h5>
				</div>
			
			<!-- 토론 형식 선택 -->			
				<div class="col-md-12">
					<h4>토론 형식</h4>
					<div id="debateType" class="btn-group">
						<button type="button" id="btnDebateType" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
							선택하기<span class="caret"></span>
						</button>
						<ul id="btn_topic_type" class="dropdown-menu" role="menu">
							<li><a>찬반 토론 </a></li>
							<li><a>자유 토론 </a></li>
						</ul>
						<input type="hidden" id="hid_topic_type" name="topic_type"/>
					</div>
					<hr>
				</div>
			<!-- 토론 형식 선택 -->			

			<!-- 안건 세부 사항 입력 -->
				<div class="col-md-12">
					<h4>제목</h4>
					<input type="text" id="prop-title" class="form-control" name="topic_title"
						placeholder="제목을 입력해주세요" value="${tempSaved.topic_title}"/>
						<hr>
					<h4>주제 요약</h4>
					<textarea id="prop-lead" class="form-control" rows="5" name="topic_short_cont"
						placeholder="건의하시는 안건에 대하여 간략한 정보를 입력해주세요."></textarea>
						<hr>
					<h4>주제 본문</h4>
					<textarea id="prop_body" class="form-control" name="topic_long_cont"
						placeholder="건의하시는 안건에 대한 상세한 정보를 입력해주세요."></textarea>
					<hr />
					<h4>참고자료</h4>
					<div id="references">
						<div class="reference bs-callout bs-callout-primary">
							<input type="text" class="topic_resource_title form-control" name="topic_resource_title"
								placeholder="참고자료 제목 - 예) [한겨레] 자살, 개인 선택인가 사회문제인가" /><br>
							<input type="text" class="topic_resource_link form-control" name="topic_resource_link"
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
					<div id="divProCon" class="row">
						<div class="col-md-6">
							<h4>찬성 의견</h4>
							<textarea id="prop-pro" class="form-control" rows="10" name="topic_pro"
								placeholder="이 안건에 대한 찬성 의견을 뒷받침하는 내용을 작성해주세요."></textarea>
						</div>
						<div class="col-md-6">
							<h4>반대 의견</h4>
							<textarea id="prop-con" class="form-control" rows="10" name="topic_con"
								placeholder="이 안건에 대한 반대 의견을 뒷받침하는 내용을 작성해주세요."></textarea>
						</div>
					</div>
			<!-- 안건 세부 사항 입력 -->

			<!-- 안건 등록 -->
					<div class="col-md-12">
						<p class="text-center">
							<button id="btnSubmit" type="submit" class="btn btn-lg btn-primary">등록하기</button>
						</p>
					</div>
			<!-- 안건 등록 -->
				</div>
			</form>
		</div><!-- row -->
	</div><!-- container -->
	</c:when>
	<c:otherwise>
		<c:redirect url="/proposal/list" />
	</c:otherwise>
</c:choose>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="//cdn.ckeditor.com/4.5.10/standard/ckeditor.js"></script>
	<script src="${pageContext.request.contextPath}/resources/proposal/js/write.js"></script>
</body>
</html>