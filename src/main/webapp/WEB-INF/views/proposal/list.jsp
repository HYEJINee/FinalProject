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
	<div id="content" class="container">
		<div class="row">
		
			<h3 class="col-md-9">안건 건의</h3>
			
			<div role="tabpanel">
				<ul id="topic-tab" class="nav nav-pills" role="tablist">
					<li role="presentation" class="active"><a href="#whole" aria-controls="whole" role="tab" data-toggle="pill">모든 안건</a></li>
  					<li role="presentation"><a href="#proCon" aria-controls="proCon" role="tab" data-toggle="pill">찬반 토론</a></li>
					<li role="presentation"><a href="#free" aria-controls="free" role="tab" data-toggle="pill">자유 토론</a></li>
				</ul>
				<hr>
				
				<c:if test="${empty USER_KEY != true}">
					<div id="divWrite">
						<p class="text-center">
							<button class="customBtn btn-write customBtn-lg">안건 건의 글 작성하기</button>
						</p>
						<p id="login_needed" class="text-center"></p>
					</div>
				</c:if>
			
				<div class="tab-content">
				<!-- 모든 토론 탭 -->
					<div role="tabpanel" class="tab-pane active" id="whole">
						<c:forEach items="${topicList}" var="topic">
							<div class="col-md-4">
								<div class="card" topic-no="${topic.topic_no}">
									<c:choose>
										<c:when test="${topic.img_file_name != '' && topic.img_file_name != null}">
											<div class="card-header">
												<c:choose>
													<c:when test="${topic.topic_type == 0}">찬반 토론</c:when>
													<c:when test="${topic.topic_type == 1}">자유 토론</c:when>
												</c:choose><br>
												<h4>${topic.topic_title}</h4>
												<img src="/resources/proposal/img/${topic.img_file_name}.${topic.img_ext_name}" style="position: absolute; left:0; top:-50%; width:100%; height:auto; opacity:0.5;z-index:-1;">
											</div>
										</c:when>
										<c:otherwise>
											<div class="card-header" style="background-color: rgba(230, 230, 230, 0.5);">
												<c:choose>
													<c:when test="${topic.topic_type == 0}">찬반 토론</c:when>
													<c:when test="${topic.topic_type == 1}">자유 토론</c:when>
												</c:choose><br>
												<h4>${topic.topic_title}</h4>
											</div>
										</c:otherwise>
									</c:choose>
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
									<c:choose>
										<c:when test="${topic.img_file_name != '' && topic.img_file_name != null}">
											<%-- <div class="card-header" style="background: rgba(0, 0, 0, 0.3) url('/resources/proposal/img/${topic.img_file_name}.${topic.img_ext_name}') center center no-repeat; background-size: cover;"> --%>
											<div class="card-header">
												찬반 토론
												<h4>${topic.topic_title}</h4>
												<img src="/resources/proposal/img/${topic.img_file_name}.${topic.img_ext_name}" style="position: absolute; left:0; top:-50%; width:100%; height:auto; opacity:0.5;z-index:-1;">
											</div>
										</c:when>
										<c:otherwise>
											<div class="card-header" style="background-color: rgba(230, 230, 230, 0.5);">
												찬반 토론
												<h4>${topic.topic_title}</h4>
											</div>
										</c:otherwise>
									</c:choose>
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

									<c:choose>
									<c:when test="${topic.img_file_name != '' && topic.img_file_name != null}">

									<div class="card-header">
										자유 토론
										<h4>${topic.topic_title}</h4>
										<img src="/resources/proposal/img/${topic.img_file_name}.${topic.img_ext_name}" style="position: absolute; left:0; top:-50%; width:100%; height:auto; opacity:0.5;z-index:-1;">
									</div>

									</c:when>
									<c:otherwise>

									<div class="card-header" style="background-color: rgba(230, 230, 230, 0.5);">
										자유 토론
										<h4>${topic.topic_title}</h4>
									</div>

									</c:otherwise>
									</c:choose>
	
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
    	$('.btn-write').on('click', function() {
	    	location.href='/proposal/write.do';
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