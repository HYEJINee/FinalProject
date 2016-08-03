<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page pageEncoding="utf-8" contentType="text/html; charset=UTF-8"
	isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>검색 결과</title>
<link
	href="${pageContext.request.contextPath}/resources/proposal/css/list.css"
	rel="stylesheet">

<style>
.container {
	margin-top: 50px;
}
</style>
</head>
<body>
	<!-- Header -->
	<%@ include file="../include/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-6">
					<h2>검색 결과</h2>
				</div>
				<div role="tabpanel" id="category" class="col-md-offset-6"
					style="margin-top: 10px">
					<ul class="nav nav-pills" id="searchTab" role="tablist">
						<li role="presentation" class="active" data-filter="*"><a
							href="" data-toggle="pill">모든 안건</a></li>
						<li role="presentation" data-filter=".topic_3"><a href=""
							data-toggle="pill">진행 중 토론</a></li>
						<li role="presentation" data-filter=".topic_1"><a href=""
							data-toggle="pill">투표 중 안건</a></li>
						<li role="presentation" data-filter=".topic_4"><a href=""
							data-toggle="pill">종료된 토론</a></li>
					</ul>

				</div>

			</div>
		</div>
		<hr />
		<div class="row">

			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="all">
					<div id="searchList" class="col-md-12">
						<c:if test="${empty searchList}">
							<center>
								<h2>등록된 게시물이 없습니다.</h2>
							</center>
						</c:if>

						<div class="grid">
							<c:if test="${!empty searchList}">
								<c:forEach items="${searchList}" var="list">
									<div class="card grid-item topic_${list.topic_progress}">
									
								<c:choose>
								
								<c:when
											test="${list.img_file_name != '' && list.img_file_name != null}">
										<div class="card-header">
									
											<c:choose>
												<c:when test="${list.topic_type == 0}">찬반 토론</c:when>
												<c:when test="${list.topic_type == 1}">자유 토론</c:when>
											</c:choose>
										<br>
										<h4>${list.topic_title}</h4>
										<img
											src="/resources/proposal/img/${list.img_file_name}.${list.img_ext_name}"
											style="position: absolute; left: 0; top: -50%; width: 100%; height: auto; opacity: 0.5; z-index: -1;">
									</div>
									
										</c:when>
									<c:otherwise>
										<div class="card-header"
											style="background-color: rgba(230, 230, 230, 0.5);">
											<c:choose>
												<c:when test="${list.topic_type == 0}">찬반 토론</c:when>
												<c:when test="${list.topic_type == 1}">자유 토론</c:when>
											</c:choose>
											<br>
											<h4>${list.topic_title}</h4>
										</div>
									</c:otherwise>
									</c:choose>
									<div class="card-body">${list.topic_short_cont}</div>
									<div class="card-footer">
										<p class="text-right">
											<span class="glyphicon glyphicon-thumbs-up"
												aria-hidden="true"></span>
										</p>
									</div>
									</div>
								</c:forEach>
								
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<div id="load"></div>
		</div>
		<nav id="page_nav" style="display: none;">
			<p>
				<a href="/search/search_result?search_word=${search_word}&pageNo=2"></a>
			</p>
		</nav>
		<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
		<br /> <br /> <br /> <br /> <br />
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
		<script>
			$('#searchTab a').click(function(e) {
				e.preventDefault()
				$(this).tab('show')
			})
		</script>
</body>
</html>