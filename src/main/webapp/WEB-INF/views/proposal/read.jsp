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
<c:choose>
<c:when test="${topic.recommend < 20}">
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<div id="content" class="container">
		<!-- 커버 이미지 / 제목 / 요약문 / 건의자 -->
		<c:if test='${topic.img_file_name != "" && topic.img_file_name != null}'>
			<div id="divCoverImg" class="jumbotron">
				<p class="text-center" style="font-size:16pt;">${topic.topic_title}</p>
				<p id="short_cont">${topic.topic_short_cont}<br></p>
				<p id="writer" class="text-right">건의자 : ${topic.user_nick}</p>
				<img id="coverImg" alt="커버 이미지" src="/resources/proposal/img/${topic.img_file_name}.${topic.img_ext_name}">
			</div>
		</c:if>
		<!-- 커버 이미지 / 제목 / 요약문 / 건의자 -->
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
					<c:choose>
						<c:when test="${empty USER_KEY == false}">
							<c:choose>
								<c:when test="${voted != true}">
									<form action="read.vote" method="post">
										<input type="hidden" name="topic_no" value="${topic.topic_no}" />
										<input type="hidden" name="recommend" value="${topic.recommend}" />
										<p class="text-center"><button id="btnVote" class="btn btn-success btn-sm">투표하기</button></p>
									</form>
								</c:when>
								<c:otherwise>
									<p class="text-center"><button class="btn btn-success btn-sm" disabled="disabled">이미 투표에 참여하셨습니다.</button></p>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<p class="text-center"><button class="btn btn-success btn-sm" disabled="disabled">투표하려면 로그인해주세요</button></p>
						</c:otherwise>
					</c:choose>
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
			<c:if test="${topic.topic_type == 0}">
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
			</c:if>
			<!-- 찬성 반대 의견 -->
			
			<div id="divWriteRep" class="col-md-10 col-md-offset-1">
			<c:choose>
				<c:when test="${empty USER_KEY != true}">
				<form id="formReply" action="read.reply" method="post">
						<h4>댓글 쓰기</h4>
						<p>작성자 : ${USER_KEY.user_nick}</p>
						<input type="hidden" name="topic_no" value="${topic.topic_no}">
						<textarea class="form-control" name="reply_content" rows="5" placeholder="이 안건에 추가하고 싶은 자료가 있거나 작성자에게 하고 싶은 말이 있다면 적어주세요."></textarea>
						<button role="button" class="btn btn-primary pull-right">등록</button>
				</form>
				</c:when>
				<c:otherwise>
					<div class="alert alert-warning">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						댓글 작성은 로그인한 사용자만 가능합니다. <button class="btn btn-link" onclick="location.href='/member/member_login'">로그인하기</button>
					</div>
				</c:otherwise>
			</c:choose>
			</div>
			
			<!-- 댓글 -->
			<div id="divReplies" class="col-md-10 col-md-offset-1">
			<c:choose>
			<c:when test="${empty replies}">
				<p class="text-center">댓글이 없습니다.</p>
			</c:when>
			<c:otherwise>
			<c:forEach items="${replies}" var="reply" varStatus="status">
				<div id='reply${reply.reply_no}' class="media">
					<div class="media-left media-top">
						<img class="media-object" src="/resources/${reply.user_profile}">
					</div>
					<div class="media-body">
					<form action="reply.update" method="post">
						<input type="hidden" name="topic_no" value="${topic.topic_no}">
						<input type="hidden" name="reply_no" value="${reply.reply_no}">
						<h4 class="media-heading">${reply.user_nick}</h4>
						<h6 style="color:silver;">${reply.reply_regdate}</h6>
						<p>${reply.reply_content}</p>
						<c:if test="${empty USER_KEY == false}">
							<c:if test="${reply.user_no == USER_KEY.user_no}">
							<div class="btn-group pull-right">
								<button type="button" class="btn btn-link" onclick="modSetup(this)">수정</button>
								<button type="button" class="btn btn-link" onclick="checkDelete(this)">삭제</button>
							</div>
							</c:if>
						</c:if>
					</form>
					</div>
				</div>
			</c:forEach>
			</c:otherwise>
			</c:choose>
			</div>
			<!-- 댓글 -->
		</div><!-- row -->
	</div><!-- container -->
	<div id="bottom"></div>
</c:when>

<c:otherwise>
	<c:redirect url="/proposal/list"></c:redirect>
</c:otherwise>

</c:choose>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/proposal/js/read.js"></script>
</body>
</html>