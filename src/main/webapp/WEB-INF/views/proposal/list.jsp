<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>TAWAR</title>
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/proposal/css/list.css"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/css/list_item.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<div id="content" class="container">

		<h2 class="col-md-8">안건 건의</h2>

		<ul id="topic-tab" class="nav nav-pills">
			<li role="presentation" class="active" data-filter="*"><a
				href="" data-toggle="pill">모든 안건</a></li>
			<li role="presentation" data-filter=".topic_0"><a href=""
				data-toggle="pill">찬반 토론</a></li>
			<li role="presentation" data-filter=".topic_1"><a href=""
				data-toggle="pill">자유 토론</a></li>
		</ul>
		<hr />

		<c:if test="${empty USER_KEY != true}">
			<div id="divWrite">
				<p class="text-center">
					<button class="customBtn btn-write customBtn-lg">안건 건의 글
						작성하기</button>
				</p>
				<p id="login_needed" class="text-center"></p>
			</div>
		</c:if>

		<div class="grid">
			<c:forEach items="${topicList}" var="topic">
				<div class="card card--big grid-item topic_${topic.topic_type}"
					topic-no="${topic.topic_no}" onclick="toTopic(this)">
					<c:choose>
						<c:when
							test="${topic.img_file_name != '' && topic.img_file_name != null}">
							<div class="card_header">
								<div
									style="background-image: url(/resources/proposal/img/${topic.img_file_name}.${topic.img_ext_name})"
									class="card__image" id="coverImg"
									style="position: absolute; left: 0; top: -50%; width: 100%; height: auto; opacity: 0.5; z-index: -1;"></div>
								<c:choose>
									<c:when test="${topic.topic_type == 0}">
										<h4>
											<label class="label label-primary">찬반</label>
										</h4>
									</c:when>
									<c:when test="${topic.topic_type == 1}">
										<h4>
											<label class="label label-danger">의견</label>
										</h4>
									</c:when>
								</c:choose>
									<h2 class="card__title">${topic.topic_title}</h2>

							</div>
						</c:when>
						<c:otherwise>
							<div class="card_header">
								<div class="card__image" ></div>
								<c:choose>
									<c:when test="${topic.topic_type == 0}">
										<h4>
											<label class="label label-primary">찬반</label>
										</h4>
									</c:when>
									<c:when test="${topic.topic_type == 1}">
										<h4>
											<label class="label label-danger">의견</label>
										</h4>
									</c:when>
								</c:choose>
								<h2 class="card__title">${topic.topic_title}</h2>
							</div>
						</c:otherwise>
					</c:choose>
					<div class="card_body">
						<p class="card__text">${topic.topic_short_cont}</p>
					</div>
					<div class="card-footer card__action-bar">
						<p class="text-right">
							<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
							${topic.recommend}
						</p>
					</div>
				</div>
			</c:forEach>
		</div>

	</div>
	<button id="topBtn" class="btn btn-default"><span class="glyphicon glyphicon-menu-up"></span><br/>Top</button>
	<div id="load"></div>

	<nav id="page_nav" style="display: none;">
		<p>
			<a href="/proposal/list?pageNo=2"></a>
		</p>
	</nav>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="https://npmcdn.com/masonry-layout@4.1/dist/masonry.pkgd.min.js"></script>
	<script
		src="https://npmcdn.com/isotope-layout@3.0.1/dist/isotope.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/proposal/js/jquery.infinitescroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/proposal/js/list.js"></script>
</body>
</html>