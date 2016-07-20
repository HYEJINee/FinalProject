<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>TAWAR</title>
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/proposal/css/list.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<div class="container">
		<div class="row">
		
			<h3 class="col-md-9">안건 건의</h3>
			
			<div role="tabpanel">
				<ul id="topic-tab" class="nav nav-pills" role="tablist">
					<li role="presentation" class="active"><a href="#whole" aria-controls="whole" role="tab" data-toggle="pill">모든 안건</a></li>
  					<li role="presentation"><a href="#proCon" aria-controls="proCon" role="tab" data-toggle="pill">찬반 토론</a></li>
					<li role="presentation"><a href="#free" aria-controls="free" role="tab" data-toggle="pill">자유 토론</a></li>
				</ul>
				<hr>
				
				<div id="divWrite">
					<p class="text-center">
						<button class="customBtn btn-write customBtn-lg">안건 건의 글 작성하기</button>
					</p>
					<p id="login_needed" class="text-center"></p>
				</div>
			
				<div class="tab-content">
				<!-- 모든 토론 탭 -->
					<div role="tabpanel" class="tab-pane active" id="whole">
						<c:forEach items="${topicList}" var="topic">
							<div class="col-md-4">
								<div class="card" topic-no="${topic.topic_no}">
									<div class="card-header">
										<c:choose>
											<c:when test="${topic.topic_type == 0}">찬반 토론</c:when>
											<c:when test="${topic.topic_type == 1}">자유 토론</c:when>
										</c:choose><br>
										<h4>${topic.topic_title}</h4>
									</div>
									<div class="card-body">
										${topic.topic_short_cont}
									</div>
									<div class="card-footer">
										<p class="text-right">
											<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> ${topic.recommend}
										</p>
									</div>
								</div>
							</div>		
						</c:forEach>
					</div>
				<!-- 모든 토론 탭 -->

				<!-- 찬반 토론 탭 -->				
					<div role="tabpanel" class="tab-pane" id="proCon">
						<c:forEach items="${topicList}" var="topic">
							<c:if test="${topic.topic_type == 0}">
							<div class="col-md-4">
								<div class="card" topic-no="${topic.topic_no}">
									<div class="card-header">
										찬반 토론
										<h4>${topic.topic_title}</h4>
									</div>
									<div class="card-body">
										${topic.topic_short_cont}
									</div>
									<div class="card-footer">
										<p class="text-right">
										<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> ${topic.recommend}
										</p>
									</div>
								</div>
							</div>		
							</c:if>
						</c:forEach>
					</div>
				<!-- 찬반 토론 탭 -->				

				<!-- 자유 토론 탭 -->
					<div role="tabpanel" class="tab-pane" id="free">
						<c:forEach items="${topicList}" var="topic">
							<c:if test="${topic.topic_type == 1}">
							<div class="col-md-4">
								<div class="card" topic-no="${topic.topic_no}">
									<div class="card-header">
										자유 토론
										<h4>${topic.topic_title}</h4>
									</div>
									<div class="card-body">
										${topic.topic_short_cont}<br>
									</div>
									<div class="card-footer">
										<p class="text-right">
										<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> ${topic.recommend}
										</p>
									</div>
								</div>
							</div>		
							</c:if>
						</c:forEach>
					</div>
				<!-- 자유 토론 탭 -->
				
				
				</div><!-- tab-content -->
			</div><!-- tabpanel -->
		</div><!-- row -->
	</div><!-- container -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
    <script>
    	var USER_KEY = ${empty USER_KEY == false};
    
    	$('.btn-write').on('click', function() {
    		if(USER_KEY) {
	    		location.href='/proposal/write.do';
    		} else {
				$('#login_needed').text('로그인한 이용자만 글을 작성할 수 있습니다.');    			
    		}
    	});
    	
    	$(function () {
    		  $('[data-toggle="tooltip"]').tooltip()
    	});
    	
    	$('.card').on('click', function() {
    		var topic_no = $(this).attr("topic-no");
	   		location.href="read?topic_no=" + topic_no;
    	});
    </script>
</body>
</html>