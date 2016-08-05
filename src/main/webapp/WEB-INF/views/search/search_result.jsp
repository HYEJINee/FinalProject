<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page pageEncoding="utf-8" contentType="text/html; charset=UTF-8"
	isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>TAWAR 검색 결과</title>
<link rel="stylesheet" href="/resources/proposal/css/list.css">
<link rel="stylesheet" href="/resources/css/list_item.css">
</head>
<body>
	<!-- Header -->
	<%@ include file="../include/header.jsp"%>
	<div class="container" id="content">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-6">
					<h2>검색 결과</h2>
				</div>
				<div role="tabpanel" class="col-md-offset-6">
					<ul class="nav nav-pills" id="topic-tab" role="tablist">
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
									<c:if test="${list.topic_progress != 2}">
										<div
											class="card card--big grid-item topic_${list.topic_progress}"
											topic_no="${list.topic_no}"
											onclick="goToRead(this, ${list.topic_progress})">
											<c:choose>
												<c:when
													test="${list.img_file_name != '' && list.img_file_name != null}">
													<div class="card_header">
														<div
															style="background-image: url(/resources/proposal/img/${list.img_file_name}.${list.img_ext_name})"
															class="card__image" id="coverImg"
															></div>
														<c:choose>
															<c:when test="${list.topic_type == 0}">
																<h4>
																	<label class="label label-primary">찬반</label>
																</h4>
															</c:when>
															<c:when test="${list.topic_type == 1}">
																<h4>
																	<label class="label label-info">자유</label>
																</h4>
															</c:when>
														</c:choose>
															<h3 class="card__title">${list.topic_title}</h3>
														<!-- img class="coverImg"
															src="/resources/proposal/img/${list.img_file_name}.${list.img_ext_name}"-->
													</div>
												</c:when>
												<c:otherwise>
													<div class="card_header">
														<div class="card__image" ></div>
														<c:choose>
															<c:when test="${list.topic_type == 0}">
																<h4>
																	<label class="label label-primary">찬반</label>
																</h4>
															</c:when>
															<c:when test="${list.topic_type == 1}">
																<h4>
																	<label class="label label-info">자유</label>
																</h4>
															</c:when>
														</c:choose>
															<h3 class="card__title">${list.topic_title}</h3>
													</div>
												</c:otherwise>
											</c:choose>
											<div class="card_body">
												<p class="card__text">${list.topic_short_cont}</p>
											</div>
											<div class="card-footer  card__action-bar">
												<c:choose>
													<c:when test="${list.topic_progress == 1}">
														<p class="text-right">
															<span class="glyphicon glyphicon-thumbs-up"
																aria-hidden="true"></span>
														</p>
													</c:when>
													<c:when
														test="${list.topic_progress != 1 && list.topic_type == 0}">
														<p class="text-right">
															<span class="glyphicon glyphicon-user">
																${list.debate_tot_pro + list.debate_tot_con + list.debate_tot_neut}</span>
															<c:choose>
																<c:when test="${list.debate_tot_pro eq 0}">
																	<span class="pro"> 찬 0%</span>
																</c:when>
																<c:otherwise>
																	<span class="pro"> 찬 <fmt:formatNumber
																			value="${list.debate_tot_pro/(list.debate_tot_pro + list.debate_tot_con + list.debate_tot_neut)*100}"
																			pattern="0" />%
																	</span>
																</c:otherwise>
															</c:choose>
															<c:choose>
																<c:when test="${list.debate_tot_con eq 0}">
																	<span class="con"> 반 0%</span>
																</c:when>
																<c:otherwise>
																	<span class="con"> 반 <fmt:formatNumber
																			value="${list.debate_tot_con/(list.debate_tot_pro + list.debate_tot_con + list.debate_tot_neut)*100}"
																			pattern="0" />%
																	</span>
																</c:otherwise>
															</c:choose>
															<c:choose>
																<c:when test="${list.debate_tot_neut eq 0}">
																	<span class="neut"> 중 0%</span>
																</c:when>
																<c:otherwise>
																	<span class="neut"> 중 <fmt:formatNumber
																			value="${list.debate_tot_neut/(list.debate_tot_pro + list.debate_tot_con + list.debate_tot_neut)*100}"
																			pattern="0" />%
																	</span>
																</c:otherwise>
															</c:choose>
														</p>
													</c:when>
													<c:when
														test="${list.topic_progress != 1 && list.topic_type == 1}">
														<p class="text-right">
															<span class="glyphicon glyphicon-comment">
																${list.op_cnt}</span>
														</p>
													</c:when>
												</c:choose>
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
		<div id="load"></div>
	</div>
	<nav id="page_nav" style="display: none;">
		<p>
			<a href="/search/search_result?search_word=${search_word}&pageNo=2"></a>
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
	<script src="/resources/search/js/search.js"></script>
</body>
</html>