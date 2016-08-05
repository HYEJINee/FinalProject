<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>

<div class="row">
	<div class="col-md-12">
		<div class="" style="float:right;">
			<ul id="topic-tab" class="nav nav-pills">
				<li role="presentation" class="active" data-filter="*"><a
					href="" data-toggle="pill" id="all-topics">모든 안건</a></li>
				<li role="presentation" data-filter=".progress_1"><a href=""
					data-toggle="pill" id="on-going">건의중</a></li>
				<li role="presentation" data-filter=".progress_3"><a href=""
					data-toggle="pill">토론중</a></li>
				<li role="presentation" data-filter=".progress_4"><a href=""
					data-toggle="pill">종료</a></li>
				<li role="presentation" data-filter=".progress_2"><a href=""
					data-toggle="pill">상정실패</a></li>
			</ul>
		</div>
	</div>
</div>
<hr />
<div class="row">
	<div class="grid col-md-12">
		<c:if test="${getMyList.size() eq 0}">
			<center>
				<h2>등록된 게시물이 없습니다.</h2>
			</center>
		</c:if>
		<c:if test="${getMyList.size() > 0}">
			<c:forEach items="${getMyList}" var="list">
				<div
					class="card card--big grid-item progress_${list.topic_progress}"
					style="padding-left: 0px; padding-right: 0px;"
					onClick="fnRead(this)">
					<input type="hidden" name="topic_no" value="${list.topic_no}" />
					<c:choose>
						<c:when test="${list.topic_type eq 0}">
							<!-- card_header -->
							<!-- 1) 커버이미지 있을 때 -->
							<c:if test="${list.img_file_name != null}">
								<div class="card_header">
									<div
										style="background-image: url(/resources/proposal/img/${list.img_file_name}.${list.img_ext_name})"
										class="card__image" id="coverImg"></div>
									<h4>
										<label class="label label-primary">찬반</label>
									</h4>
									<h2 class="card__title">${list.topic_title}</h2>
								</div>
							</c:if>
							<!-- 2) 커버이미지 없을 때 -->
							<c:if test="${list.img_file_name eq null}">
								<div class="card_header">
									<div
										style="background-image: url(/resources/proposal/img/${list.img_file_name}.${list.img_ext_name})"
										class="card__image" id="coverImg"></div>
									<h4>
										<label class="label label-primary">찬반</label>
									</h4>
									<h2 class="card__title">${list.topic_title}</h2>
								</div>
							</c:if>
							<div class="card_body">
								<p class="card__text">${list.topic_short_cont}</p>
							</div>
							<div class="card_footer  card__action-bar">
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
							</div>
						</c:when>
						<c:when test="${list.topic_type eq 1}">
							<!-- card_header -->
							<!-- 1) 커버이미지 있을 때 -->
							<c:if test="${list.img_file_name != null}">
								<div class="card_header">
									<div
										style="background-image: url(/resources/proposal/img/${list.img_file_name}.${list.img_ext_name})"
										class="card__image" id="coverImg"></div>
									<h4>
										<label class="label label-primary">찬반</label>
									</h4>
									<h2 class="card__title">${list.topic_title}</h2>
								</div>
							</c:if>
							<!-- 2) 커버이미지 없을 때 -->
							<c:if test="${list.img_file_name eq null}">
								<div class="card_header">
									<div
										style="background-image: url(/resources/proposal/img/${list.img_file_name}.${list.img_ext_name})"
										class="card__image" id="coverImg"></div>
									<h4>
										<label class="label label-primary">찬반</label>
									</h4>
									<h2 class="card__title">${list.topic_title}</h2>
								</div>
							</c:if>
							<div class="card_body">
								<p class="card__text">${list.topic_short_cont}</p>
							</div>
							<div class="card_footer card__action-bar">
								<p class="text-right">
									<span class="glyphicon glyphicon-comment">
										${list.op_cnt}</span>
								</p>
							</div>
						</c:when>
					</c:choose>
				</div>
			</c:forEach>
		</c:if>
	</div>
</div>
<div id="load"></div>

<nav id="page_nav" style="display: none;">
	<p>
		<a href="/mypage/list?pageNo=2"></a>
	</p>
</nav>
<script src="/resources/mypage/js/mypage_topic.js"></script>
</html>