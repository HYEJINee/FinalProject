<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>TAWAR</title>
<link rel="stylesheet" href="/resources/finished/css/finished.css">
<link rel="stylesheet" href="/resources/css/list_item.css">
<style>
</style>
</head>
<body>
	<!-- Header -->
	<%@ include file="../include/header.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-3">
					<h2>종료된 토론</h2>
				</div>
				<div class="col-md-offset-8">
					<ul id="topic-tab" class="nav nav-pills">
						<li role="presentation" class="active" data-filter="*"><a href="" data-toggle="pill">모든 안건</a></li>
			  			<li role="presentation" data-filter=".topic_0"><a href="" data-toggle="pill">찬반 토론</a></li>
						<li role="presentation" data-filter=".topic_1"><a href="" data-toggle="pill">자유 토론</a></li>
					</ul>
				</div>
			</div>
		</div>
		<hr/>
		<div class="grid">
			<c:if test="${list.size() eq 0}">
				<center><h2>등록된 게시물이 없습니다.</h2></center>
			</c:if>
			<c:if test="${list.size() > 0}">
				<c:forEach items="${list}" var="list">
					<div class="grid-item card topic_${list.topic_type}" style="padding-left: 0px; padding-right: 0px;" onClick="fnRead(this)">
					<input type="hidden" name="topic_no" value="${list.topic_no}"/>
					<c:choose>
						<c:when test="${list.topic_type eq 0}">
						<!-- card_header -->
							<!-- 1) 커버이미지 있을 때 -->
							<c:if test="${list.img_file_name != null}">
								<div class="card_header">
									<h4><label class="label label-primary">찬반</label></h4>
									<center><h3>${list.topic_title}</h3></center>
									<img class="coverImg" src="/resources/proposal/img/${list.img_file_name}.${list.img_ext_name}">
								</div>
							</c:if>
							<!-- 2) 커버이미지 없을 때 -->
							<c:if test="${list.img_file_name eq null}">
								<div class="card_header_noneImg">
									<h4><label class="label label-primary">찬반</label></h4>
									<center><h3>${list.topic_title}</h3></center>
								</div>
							</c:if>
							<div class="card_body">
								<p>${list.topic_short_cont}</p>
								<span class="glyphicon glyphicon-user"> ${list.debate_tot_pro + list.debate_tot_con + list.debate_tot_neut}</span>
								<c:choose>
									<c:when test="${list.debate_tot_pro eq 0}">
										<span class="pro"> 찬 0%</span>
									</c:when>
									<c:otherwise>
										<span class="pro"> 찬 <fmt:formatNumber value="${list.debate_tot_pro/(list.debate_tot_pro + list.debate_tot_con + list.debate_tot_neut)*100}" pattern="0"/>%</span>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${list.debate_tot_con eq 0}">
										<span class="con"> 반 0%</span>
									</c:when>
									<c:otherwise>
										<span class="con"> 반 <fmt:formatNumber value="${list.debate_tot_con/(list.debate_tot_pro + list.debate_tot_con + list.debate_tot_neut)*100}" pattern="0"/>%</span>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${list.debate_tot_neut eq 0}">
										<span class="neut"> 중 0%</span>
									</c:when>
									<c:otherwise>
										<span class="neut"> 중 <fmt:formatNumber value="${list.debate_tot_neut/(list.debate_tot_pro + list.debate_tot_con + list.debate_tot_neut)*100}" pattern="0"/>%</span>
									</c:otherwise>
								</c:choose>
							</div>
						</c:when>
						<c:when test="${list.topic_type eq 1}">
						<!-- card_header -->
							<!-- 1) 커버이미지 있을 때 -->
							<c:if test="${list.img_file_name != null}">
								<div class="card_header">
									<h4><label class="label label-danger">의견</label></h4>
									<center><h3>${list.topic_title}</h3></center>
									<img class="coverImg" src="/resources/proposal/img/${list.img_file_name}.${list.img_ext_name}">
								</div>
							</c:if>
							<!-- 2) 커버이미지 없을 때 -->
							<c:if test="${list.img_file_name eq null}">
								<div class="card_header_noneImg">
									<h4><label class="label label-danger">의견</label></h4>
									<center><h3>${list.topic_title}</h3></center>
								</div>
							</c:if>
							<div class="card_body">
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
<script src="/resources/finished/js/finished.js"></script>
<script src="https://npmcdn.com/masonry-layout@4.1/dist/masonry.pkgd.min.js"></script>
<script src="https://npmcdn.com/isotope-layout@3.0.1/dist/isotope.pkgd.min.js"></script>
<script src="/resources/proposal/js/jquery.infinitescroll.min.js"></script>
</body>
</html>