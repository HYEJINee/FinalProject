<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>TAWAR</title>
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/proposal/css/read.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<!-- 커버 이미지 / 제목 / 요약문 / 건의자 -->
	<div id="divCoverImg" class="jumbotron">
		<div class="container">
			<h3>${topic.topic_title}</h3>
			<p>${topic.topic_short_cont}</p>
			<p class="text-right">건의자 : ${topic.user_nick}</p>
		</div>
	</div>	
	<!-- 커버 이미지 / 제목 / 요약문 / 건의자 -->
	
	<div class="container">
		<div class="row">

			<!-- 안건 투표 -->
			<div id=divRecommend>
				<p class="text-center">이 안건이 토론 주제가 되기 위해 필요한 표 : <span class="badge">${20-topic.recommend}</span></p>
				<div class="col-md-6 col-md-offset-3">
					<div class="progress">
  						<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="${topic.recommend/20*100}" aria-valuemin="0" aria-valuemax="100" style="min-width: 3em; width: ${topic.recommend/20*100}%;">
			    			${topic.recommend}표
  						</div>
					</div>
					<p class="text-center"><button class="btn btn-success btn-sm">투표하기</button></p>
				</div>
			</div>
			<!-- 안건 투표 -->

			<!-- 본문 내용 -->	
			<div id="divContent" class="col-md-12">
				<p>${topic.topic_long_cont}</p>
			</div>
			<!-- 본문 내용 -->	

			<!-- 참고 자료 -->			
			<div id="divRef" class="col-md-12">
				<h4>참고 자료</h4>
				<c:forEach items="${ref}" var="ref">
					<a href="${ref.topic_resource_link}">${ref.topic_resource_title}</a> 
				</c:forEach>
			</div>
			<!-- 참고 자료 -->			
			
			<!-- 찬성 반대 의견 -->
			<div id=divProCon class="col-md-12">
				<div class="col-md-6">
					<h4>찬성 의견</h4>
					<p>${topic.topic_pro}</p>
				</div>
				<div class="col-md-6">
					<h4>반대 의견</h4>
					<p>${topic.topic_con}</p>
				</div>
			</div>
			<!-- 찬성 반대 의견 -->
			
			<div class="col-md-10 col-md-offset-1">
				<h4>댓글 쓰기</h4>
				작성자 : ㅇㅇㅇ
				<textarea class="form-control" rows="5" placeholder="이 안건에 추가하고 싶은 자료가 있거나 작성자에게 하고 싶은 말이 있다면 적어주세요."></textarea>
				<button class="btn btn-primary btn-sm pull-right">등록</button>
			</div>
			
			<!-- 댓글 -->
			<c:forEach items="${replies}" var="reply">
			<div class="col-md-10 col-md-offset-1 media">
				<div class="media-left media-top">
					<img class="media-object" src="...">
				</div>
				<div class="media-body">
					<h4 class="media-heading">${reply.user_nick}</h4>
					<p>${reply.reply_content}</p>
				</div>
			</div>
			</c:forEach>
			<!-- 댓글 -->
		</div><!-- row -->
	</div><!-- container -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>