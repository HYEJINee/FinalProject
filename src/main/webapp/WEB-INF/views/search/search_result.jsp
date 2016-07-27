<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page pageEncoding="utf-8" contentType="text/html; charset=UTF-8"
	isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>검색 결과</title>
<link rel="stylesheet" href="/resources/search/css/search.css">
<link
	href="${pageContext.request.contextPath}/resources/proposal/css/list.css"
	rel="stylesheet">
<script>
	$('#searchTab a').click(function(e) {
		e.preventDefault()
		$(this).tab('show')
	})
</script>
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
						<li class="all active" role="presentation"
							style="margin-left: 15px;"><h4>
								<strong> <a href="#all" aria-controls="all" role="tab"
									data-toggle="pill">전체 토론&nbsp;&nbsp;</a></strong>
							</h4></li>
						<li class="ongoing" role="presentation"><h4>
								<a href="#ongoing" aria-controls="ongoing" role="tab"
									data-toggle="pill"> 진행 중 토론 </a>
							</h4></li>
						<li class="proposal" role="presentation"
							style="margin-left: 15px;"><h4>
								<a href="#proposal" aria-controls="proposal" role="tab"
									data-toggle="pill">투표 중 안건</a>
							</h4></li>
						<li class="finished" role="presentation"
							style="margin-left: 15px;"><h4>
								<a href="#finished" aria-controls="finished" role="tab"
									data-toggle="pill">종료된 토론</a>
							</h4></li>
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

						<c:if test="${!empty searchList}">
							<c:forEach items="${searchList}" var="list">
								<div class="col-md-4">
									<div class="card" topic-no="${list.topic_no}">
										<div class="card-header">
											찬반 토론
											<h4>${list.topic_title}</h4>
										</div>
										<div class="card-body">${list.topic_short_cont}</div>
										<div class="card-footer">
											<p class="text-right">
												<span class="glyphicon glyphicon-thumbs-up"
													aria-hidden="true"></span> 
											</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane" id="ongoing">
					<div id="searchList" class="col-md-12">
						<c:if test="${empty searchList}">
							<center>
								<h2>등록된 게시물이 없습니다.</h2>
							</center>
						</c:if>

						<c:if test="${!empty searchList}">
							<c:forEach items="${searchList}" var="list">
								<c:if test="${list.topic_progress==3 }">
									<div class="col-md-4">
										<div class="card" topic-no="${list.topic_no}">
											<div class="card-header">
												찬반 토론
												<h4>${list.topic_title}</h4>
											</div>
											<div class="card-body">${list.topic_short_cont}</div>
											<div class="card-footer">
												<p class="text-right">
													<span class="glyphicon glyphicon-thumbs-up"
														aria-hidden="true"></span> 
												</p>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane" id="proposal">
					<div id="searchList" class="col-md-12">
						<c:if test="${empty searchList}">
							<center>
								<h2>등록된 게시물이 없습니다.</h2>
							</center>
						</c:if>

						<c:if test="${!empty searchList}">
							<c:forEach items="${searchList}" var="list">
								<c:if test="${list.topic_progress==1 }">

									<div class="col-md-4">

										<div class="card" topic-no="${list.topic_no}">
											<div class="card-header">
												찬반 토론
												<h4>${list.topic_title}</h4>
											</div>
											<div class="card-body">${list.topic_short_cont}</div>
											<div class="card-footer">
												<p class="text-right">
													<span class="glyphicon glyphicon-thumbs-up"
														aria-hidden="true"></span> 
												</p>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane" id="finished">
					<div id="searchList" class="col-md-12">
						<c:if test="${empty searchList}">
							<center>
								<h2>등록된 게시물이 없습니다.</h2>
							</center>
						</c:if>

						<c:if test="${!empty searchList}">
							<c:forEach items="${searchList}" var="list">
								<c:if test="${list.topic_progress==4 }">
									<div class="col-md-4">
										<div class="card" topic-no="${list.topic_no}">
											<div class="card-header">
												찬반 토론
												<h4>${list.topic_title}</h4>
											</div>
											<div class="card-body">${list.topic_short_cont}</div>
											<div class="card-footer">
												<p class="text-right">
													<span class="glyphicon glyphicon-thumbs-up"
														aria-hidden="true"></span> 
												</p>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
		</div>


	</div>
	<script src="/resources/search/js/search.js"></script>
</body>
</html>