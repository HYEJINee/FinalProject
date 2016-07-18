<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">-->
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<head>
	<title>Home</title>
<style type="text/css">
	.item{
		margin-top: 30px;
	}
</style>
</head>
<body>
	<!-- Header -->
	<%@ include file="include/header.jsp" %>
	<!-- Content Title -->
	<div class="container" style="margin-top:50px;">
		<div class="row">
			<div class="col-md-3">
				<h2>인권을<br>자유를<br/>논하다</h2>
			</div>
			<div class="item col-md-offset-9">
				<label class="label label-primary">찬반</label>
				<span>의견논제1</span><br/><br/>
				<label class="label label-primary">찬반</label>
				<span>의견논제2</span><br/><br/>
				<label class="label label-primary">찬반</label>
				<span>의견논제3</span><br/><br/>
			</div>
		</div>
	</div>
	<hr/>
	<!-- Content List -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<center><h3>토론중</h3></center>
				<hr/>
				<c:forEach items="${list}" var="mainDto">
					<c:choose>
						<c:when test="${mainDto.topic_type eq 0}">
							<div class="item col-md-4">
								<input type="hidden" name="topic_no" value="${mainDto.topic_no}"/>
								<label class="label label-primary">찬반</label><br/>
								<h3>${mainDto.topic_title}</h3>
								<hr/>
								<p>${mainDto.topic_short_cont}</p>
								<span class="glyphicon glyphicon-user"> ${mainDto.debate_pro + mainDto.debate_con + mainDto.debate_neut}</span>
								<c:choose>
									<c:when test="${mainDto.debate_pro eq 0}">
										<span style="color:blue"> 찬 0%</span>
									</c:when>
									<c:otherwise>
										<span style="color:blue"> 찬 <fmt:formatNumber value="${mainDto.debate_pro/(mainDto.debate_pro + mainDto.debate_con + mainDto.debate_neut)*100}" pattern=".0"/>%</span>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${mainDto.debate_con eq 0}">
										<span style="color:red"> 반 0%</span>
									</c:when>
									<c:otherwise>
										<span style="color:red"> 반 <fmt:formatNumber value="${mainDto.debate_con/(mainDto.debate_pro + mainDto.debate_con + mainDto.debate_neut)*100}" pattern=".0"/>%</span>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${mainDto.debate_neut eq 0}">
										<span style="color:gray"> 중 0%</span>
									</c:when>
									<c:otherwise>
										<span style="color:gray"> 중 <fmt:formatNumber value="${mainDto.debate_neut/(mainDto.debate_pro + mainDto.debate_con + mainDto.debate_neut)*100}" pattern=".0"/>%</span>
									</c:otherwise>
								</c:choose>
							</div>
						</c:when>
						<c:when test="${mainDto.topic_type eq 1}">
							<div class="item col-md-4">
								<input type="hidden" name="topic_no" value="${mainDto.topic_no}"/>
								<label class="label label-danger">의견</label><br/>
								<h3>${mainDto.topic_title}</h3>
								<hr/>
								<p>${mainDto.topic_short_cont}</p>
								<span class="glyphicon glyphicon-education"> 27</span>
							</div>
						</c:when>	
					</c:choose>
				</c:forEach>
			</div>
		</div>
	</div>
	<hr/>
	<!-- Board -->
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<center><h3>안건 건의</h3></center>
				<div class="col-md-10">
				<c:forEach items="${list}" var="mainDto">
					<c:if test="${mainDto.topic_progress eq 0}">
						<div class="item">
							<input type="hidden" name="topic_no" value="${mainDto.topic_no}"/>
							<c:choose>
								<c:when test="${mainDto.topic_type eq 0}">
									<label class="label label-primary">찬반</label>
								</c:when>
								<c:when test="${mainDto.topic_type eq 1}">
									<label class="label label-danger">의견</label>
								</c:when>
							</c:choose>
							<span style="margin-left:20px;">${mainDto.topic_title}</span>
							<span class="glyphicon glyphicon-star" style="float:right"></span>
						</div>
					</c:if>
				</c:forEach>
				</div>
			</div>
			<div class="col-md-6">
				<center><h3>종료된 토론</h3></center>
				<c:forEach items="${list}" var="mainDto">
					<c:if test="${mainDto.topic_progress eq 2}">
						<div class="item">
							<input type="hidden" name="topic_no" value="${mainDto.topic_no}"/>
							<c:choose>
								<c:when test="${mainDto.topic_type eq 0}">
									<label class="label label-primary">찬반</label>
								</c:when>
								<c:when test="${mainDto.topic_type eq 1}">
									<label class="label label-danger">의견</label>
								</c:when>
							</c:choose>
							<span>${mainDto.topic_title}</span>
							<span class="glyphicon glyphicon-star"></span>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
<script type="text/javascript">
	$(document).ready(function(){
		$(".item").click(function(){
			var topic_no = $(this).children().filter("input").val();
			location.href = "/board/read?topic_no=" + topic_no;
		});
	});
	
</script>
</body>
</html>
