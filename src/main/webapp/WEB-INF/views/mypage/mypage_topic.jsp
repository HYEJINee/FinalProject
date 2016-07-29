<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>

<div class="row">
	<div class="col-md-12">
		<center>
			<h3>토론중</h3>
		</center>
		<c:choose>
			<c:when test="${getMyList.size() eq 0}">
				<center>
					<h3>게시물이 없습니다.</h3>
				</center>
			</c:when>
			<c:otherwise>
				<c:forEach items="${getMyList}" var="myList">
					<!-- begin="${beginPerPage}" end="${beginPerPage + numPerPage -1}" -->
					<c:choose>
						<c:when test="${myList.topic_type eq 0}">
							<div class="item list_item col-md-3 col-md-offset-1">
								<input type="hidden" name="topic_no" value="${myList.topic_no}" />
								<label class="label label-primary">찬반</label> <br />
								<center>
									<h3>${myList.topic_title}</h3>
								</center>
								<hr />
								<p>${myList.topic_short_cont}</p>
								<span class="glyphicon glyphicon-user">
									${myList.debate_tot_pro + myList.debate_tot_con + myList.debate_tot_neut}</span>
								<c:choose>
									<c:when test="${myList.debate_tot_pro eq 0}">
										<span id="pro"> 찬 0%</span>
									</c:when>
									<c:otherwise>
										<span id="pro"> 찬 <fmt:formatNumber
												value="${myList.debate_tot_pro/(myList.debate_tot_pro + myList.debate_tot_con + myList.debate_tot_neut)*100}"
												pattern=".0" />%
										</span>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${myList.debate_tot_con eq 0}">
										<span id="con"> 반 0%</span>
									</c:when>
									<c:otherwise>
										<span id="con"> 반 <fmt:formatNumber
												value="${myList.debate_tot_con/(myList.debate_tot_pro + myList.debate_tot_con + myList.debate_tot_neut)*100}"
												pattern=".0" />%
										</span>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${myList.debate_tot_neut eq 0}">
										<span id="neut"> 중 0%</span>
									</c:when>
									<c:otherwise>
										<span id="neut"> 중 <fmt:formatNumber
												value="${myList.debate_tot_neut/(myList.debate_tot_pro + myList.debate_tot_con + myList.debate_tot_neut)*100}"
												pattern=".0" />%
										</span>
									</c:otherwise>
								</c:choose>
							</div>
						</c:when>
						<c:when test="${myList.topic_type eq 1}">
							<div class="item list_item type1 col-md-3 col-md-offset-1">
								<input type="hidden" name="topic_no" value="${myList.topic_no}" />
								<label class="label label-danger">의견</label><br />
								<center>
									<h3>${myList.topic_title}</h3>
								</center>
								<hr />
								<p>${myList.topic_short_cont}</p>
								<span class="glyphicon glyphicon-education">
									${myList.op_cnt}</span>
							</div>
						</c:when>
					</c:choose>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<hr />
<div class="row">
	<div class="col-md-12">
		<center>
			<h3>건의중</h3>
		</center>
		<c:choose>
			<c:when test="${getMyList.size() eq 0}">
				<center>
					<h3>게시물이 없습니다.</h3>
				</center>
			</c:when>
			<c:otherwise>
				<c:forEach items="${topicList}" var="topic">
					<div class="col-md-4">
						<div class="card" topic-no="${topic.topic_no}">
							<c:choose>
								<c:when
									test="${topic.img_file_name != '' && topic.img_file_name != null}">
									<div class="card-header">
										<c:choose>
											<c:when test="${topic.topic_type == 0}">찬반 토론</c:when>
											<c:when test="${topic.topic_type == 1}">자유 토론</c:when>
										</c:choose>
										<br>
										<h4>${topic.topic_title}</h4>
										<img
											src="/resources/proposal/img/${topic.img_file_name}.${topic.img_ext_name}"
											style="position: absolute; left: 0; top: -50%; width: 100%; height: auto; opacity: 0.5; z-index: -1;">
									</div>
								</c:when>
								<c:otherwise>
									<div class="card-header"
										style="background-color: rgba(230, 230, 230, 0.5);">
										<c:choose>
											<c:when test="${topic.topic_type == 0}">찬반 토론</c:when>
											<c:when test="${topic.topic_type == 1}">자유 토론</c:when>
										</c:choose>
										<br>
										<h4>${topic.topic_title}</h4>
									</div>
								</c:otherwise>
							</c:choose>
							<div class="card-body">${topic.topic_short_cont}</div>
							<div class="card-footer">
								<p class="text-right">
									<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
									${topic.recommend}
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<hr />
<div class="row">
	<div class="col-md-12">
		<center>
			<h3>토론을 종료한 안건</h3>
		</center>
		<c:choose>
			<c:when test="${getMyFinishList.size() eq 0}">
				<center>
					<h3>게시물이 없습니다.</h3>
				</center>
			</c:when>
			<c:otherwise>
				<c:forEach items="${getMyFinishList}" var="myList">
					<!-- begin="${beginPerPage}" end="${beginPerPage + numPerPage -1}" -->
					<c:choose>
						<c:when test="${myList.topic_type eq 0}">
							<div class="item list_item col-md-3 col-md-offset-1">
								<input type="hidden" name="topic_no" value="${myList.topic_no}" />
								<label class="label label-primary">찬반</label> <br />
								<center>
									<h3>${myList.topic_title}</h3>
								</center>
								<hr />
								<p>${myList.topic_short_cont}</p>
								<span class="glyphicon glyphicon-user">
									${myList.debate_tot_pro + myList.debate_tot_con + myList.debate_tot_neut}</span>
								<c:choose>
									<c:when test="${myList.debate_tot_pro eq 0}">
										<span id="pro"> 찬 0%</span>
									</c:when>
									<c:otherwise>
										<span id="pro"> 찬 <fmt:formatNumber
												value="${myList.debate_tot_pro/(myList.debate_tot_pro + myList.debate_tot_con + myList.debate_tot_neut)*100}"
												pattern=".0" />%
										</span>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${myList.debate_tot_con eq 0}">
										<span id="con"> 반 0%</span>
									</c:when>
									<c:otherwise>
										<span id="con"> 반 <fmt:formatNumber
												value="${myList.debate_tot_con/(myList.debate_tot_pro + myList.debate_tot_con + myList.debate_tot_neut)*100}"
												pattern=".0" />%
										</span>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${myList.debate_tot_neut eq 0}">
										<span id="neut"> 중 0%</span>
									</c:when>
									<c:otherwise>
										<span id="neut"> 중 <fmt:formatNumber
												value="${myList.debate_tot_neut/(myList.debate_tot_pro + myList.debate_tot_con + myList.debate_tot_neut)*100}"
												pattern=".0" />%
										</span>
									</c:otherwise>
								</c:choose>
							</div>
						</c:when>
						<c:when test="${myList.topic_type eq 1}">
							<div class="item list_item type1 col-md-3 col-md-offset-1">
								<input type="hidden" name="topic_no" value="${myList.topic_no}" />
								<label class="label label-danger">의견</label><br />
								<center>
									<h3>${myList.topic_title}</h3>
								</center>
								<hr />
								<p>${myList.topic_short_cont}</p>
								<span class="glyphicon glyphicon-education">
									${myList.op_cnt}</span>
							</div>
						</c:when>
					</c:choose>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</div>
</html>