<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>종료된 토론</title>
<link rel="stylesheet" href="/resources/finished/css/finished.css">
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
				<div id="category" class="col-md-offset-9">
				<ul class="nav nav-pills">
					<li class="all" role="presentation"><h4><strong>1.모든안건</strong></h4></li>
					<li class="pro-con" role="presentation" style="margin-left: 15px;"><h4>찬반토론</h4></li>
					<li class="free" role="presentation" style="margin-left: 15px;"><h4>자유의견</h4></li>
				</ul>
				</div>
			</div>
		</div>
		<hr/>
		<div class="row">
			<div id="List" class="col-md-12">
				<c:if test="${list.size() eq 0}">
					<center><h2>등록된 게시물이 없습니다.</h2></center>
				</c:if>
				<c:if test="${list.size() > 0}">
					<c:forEach items="${list}" var="list">
						<div class="item col-md-3 col-md-offset-1">
						<input type="hidden" name="topic_no" value="${list.topic_no}"/>
						<c:choose>
							<c:when test="${list.topic_type eq 0}">
								<h4><label class="label label-primary">찬반</label></h4>
								<center><h3>${list.topic_title}</h3></center>
								<hr/>
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
							</c:when>
							<c:when test="${list.topic_type eq 1}">
								<h3><label class="label label-danger">의견</label><br/></h3>
								<center><h3>${list.topic_title}</h3></center>
								<hr/>
								<p>${list.topic_short_cont}</p>
								<span class="glyphicon glyphicon-education"> ${list.op_cnt}</span>
							</c:when>
						</c:choose>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
<script src="/resources/finished/js/finished.js"></script>
</body>
</html>