<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>

		<div class="row">
			<div class="col-md-12">
				<div class="col-md-offset-6">
					<ul id="topic-tab" class="nav nav-pills">
						<li role="presentation" class="active" data-filter="*"><a href="" data-toggle="pill">모든 안건</a></li>
			  			<li role="presentation" data-filter=".progress_1"><a href="" data-toggle="pill">건의중</a></li>
						<li role="presentation" data-filter=".progress_3"><a href="" data-toggle="pill">토론중</a></li>
						<li role="presentation" data-filter=".progress_4"><a href="" data-toggle="pill">종료</a></li>
						<li role="presentation" data-filter=".progress_2"><a href="" data-toggle="pill">상정실패</a></li>
					</ul>
				</div>
			</div>
		</div>
		<hr/>
		<div class="row">
			<div class="list col-md-12">
				<c:if test="${getMyList.size() eq 0}">
					<center><h2>등록된 게시물이 없습니다.</h2></center>
				</c:if>
				<c:if test="${getMyList.size() > 0}">
					<c:forEach items="${getMyList}" var="list">
					<div class="item col-md-3 topic_${list.topic_type} progress_${list.topic_progress}" style="padding-left: 0px; padding-right: 0px;">
					<input type="hidden" name="topic_no" value="${list.topic_no}"/>
					<c:choose>
						<c:when test="${list.topic_type eq 0}">
						<!-- card_header -->
							<!-- 1) 커버이미지 있을 때 -->
							<c:if test="${list.img_file_name != null}">
								<div id="card_header">
									<h4><label class="label label-primary">찬반</label></h4>
									<center><h3>${list.topic_title}</h3></center>
									<img id="coverImg" src="/resources/proposal/img/${list.img_file_name}.${list.img_ext_name}">
								</div>
							</c:if>
							<!-- 2) 커버이미지 없을 때 -->
							<c:if test="${list.img_file_name eq null}">
								<div id="card_header_noneImg">
									<h4><label class="label label-primary">찬반</label></h4>
									<center><h3>${list.topic_title}</h3></center>
								</div>
							</c:if>
							<div id="card_body">
								<p>${list.topic_short_cont}</p>
								<span class="glyphicon glyphicon-user"> ${list.debate_tot_pro + list.debate_tot_con + list.debate_tot_neut}</span>
								<c:choose>
									<c:when test="${list.debate_tot_pro eq 0}">
										<span id="pro"> 찬 0%</span>
									</c:when>
									<c:otherwise>
										<span id="pro"> 찬 <fmt:formatNumber value="${list.debate_tot_pro/(list.debate_tot_pro + list.debate_tot_con + list.debate_tot_neut)*100}" pattern="0"/>%</span>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${list.debate_tot_con eq 0}">
										<span id="con"> 반 0%</span>
									</c:when>
									<c:otherwise>
										<span id="con"> 반 <fmt:formatNumber value="${list.debate_tot_con/(list.debate_tot_pro + list.debate_tot_con + list.debate_tot_neut)*100}" pattern="0"/>%</span>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${list.debate_tot_neut eq 0}">
										<span id="neut"> 중 0%</span>
									</c:when>
									<c:otherwise>
										<span id="neut"> 중 <fmt:formatNumber value="${list.debate_tot_neut/(list.debate_tot_pro + list.debate_tot_con + list.debate_tot_neut)*100}" pattern="0"/>%</span>
									</c:otherwise>
								</c:choose>
							</div>
						</c:when>
						<c:when test="${list.topic_type eq 1}">
						<!-- card_header -->
							<!-- 1) 커버이미지 있을 때 -->
							<c:if test="${list.img_file_name != null}">
								<div id="card_header">
									<h4><label class="label label-danger">의견</label></h4>
									<center><h3>${list.topic_title}</h3></center>
									<img id="coverImg" src="/resources/proposal/img/${list.img_file_name}.${list.img_ext_name}">
								</div>
							</c:if>
							<!-- 2) 커버이미지 없을 때 -->
							<c:if test="${list.img_file_name eq null}">
								<div id="card_header_noneImg">
									<h4><label class="label label-danger">의견</label></h4>
									<center><h3>${list.topic_title}</h3></center>
								</div>
							</c:if>
							<div id="card_body">
								<p>${list.topic_short_cont}</p>
								<span class="glyphicon glyphicon-comment"> ${list.op_cnt}</span>
							</div>
						</c:when>
					</c:choose>
					</div>
					</c:forEach>
				</c:if>
			</div>
		</div>

	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<div id="load"></div>
		
	<nav id="page_nav" style="display:none;">
		<p><a href="/ongoing/list?pageNo=2"></a></p>
	</nav>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>


</html>