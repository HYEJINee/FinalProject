<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">-->
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/main/css/main.css">
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<head>
	<title>Home</title>
</head>
<body>
	<!-- Header -->
	<%@ include file="include/header.jsp" %>
	<!-- Content Title -->
	<div class="container" id="main_title">
		<div class="row">
			<div class="col-md-3">
				<h2>인권을<br>자유를<br/>논하다</h2>
			</div>
			<c:forEach items="${main}" var="mainList" begin="0" end="2">
				<c:choose>
					<c:when test="${mainList.topic_type eq 0}">
						<div class="item header_item col-md-offset-9">
							<input type="hidden" name="topic_no" value="${mainList.topic_no}"/>
							<label class="label label-primary">찬반</label>
							<span>${mainList.topic_title}</span><br/><br/>
						</div>
					</c:when>
					<c:when test="${mainList.topic_type eq 1}">
						<div class="item header_item col-md-offset-9">
							<input type="hidden" name="topic_no" value="${mainList.topic_no}"/>
							<label class="label label-danger">의견</label>
							<span>${mainList.topic_title}</span><br/><br/>
						</div>
					</c:when>
				</c:choose>
			</c:forEach>
		</div>
	</div>
	<hr/>
	<!-- Content List -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<center><h3>토론중</h3></center>
				<hr/>
				<c:forEach items="${main}" var="mainList" begin="0" end="5">
					<c:choose>
						<c:when test="${mainList.topic_type eq 0}">
							<div class="item list_item col-md-3 col-md-offset-1">
								<input type="hidden" name="topic_no" value="${mainList.topic_no}"/>
								<label class="label label-primary">찬반</label><br/>
								<center><h3>${mainList.topic_title}</h3></center>
								<hr/>
								<p>${mainList.topic_short_cont}</p>
								<span class="glyphicon glyphicon-user"> ${mainList.debate_tot_pro + mainList.debate_tot_con + mainList.debate_tot_neut}</span>
								<c:choose>
									<c:when test="${mainList.debate_tot_pro eq 0}">
										<span id="pro"> 찬 0%</span>
									</c:when>
									<c:otherwise>
										<span id="pro"> 찬 <fmt:formatNumber value="${mainList.debate_tot_pro/(mainList.debate_tot_pro + mainList.debate_tot_con + mainList.debate_tot_neut)*100}" pattern=".0"/>%</span>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${mainList.debate_tot_con eq 0}">
										<span id="con"> 반 0%</span>
									</c:when>
									<c:otherwise>
										<span id="con"> 반 <fmt:formatNumber value="${mainList.debate_tot_con/(mainList.debate_tot_pro + mainList.debate_tot_con + mainList.debate_tot_neut)*100}" pattern=".0"/>%</span>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${mainList.debate_tot_neut eq 0}">
										<span id="neut"> 중 0%</span>
									</c:when>
									<c:otherwise>
										<span id="neut"> 중 <fmt:formatNumber value="${mainList.debate_tot_neut/(mainList.debate_tot_pro + mainList.debate_tot_con + mainList.debate_tot_neut)*100}" pattern=".0"/>%</span>
									</c:otherwise>
								</c:choose>
							</div>
						</c:when>
						<c:when test="${mainList.topic_type eq 1}">
							<div class="item list_item type1 col-md-3 col-md-offset-1">
								<input type="hidden" name="topic_no" value="${mainList.topic_no}"/>
								<label class="label label-danger">의견</label><br/>
								<center><h3>${mainList.topic_title}</h3></center>
								<hr/>
								<p>${mainList.topic_short_cont}</p>
								<span class="glyphicon glyphicon-education"> ${mainList.op_cnt}</span>
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
				<c:forEach items="${board}" var="boardList">
					<c:if test="${boardList.topic_progress eq 1}">
						<div class="item">
							<input type="hidden" name="topic_no" value="${boardList.topic_no}"/>
							<c:choose>
								<c:when test="${boardList.topic_type eq 0}">
									<label class="label label-primary">찬반</label>
								</c:when>
								<c:when test="${boardList.topic_type eq 1}">
									<label class="label label-danger">의견</label>
								</c:when>
							</c:choose>
							<span id="board_title"">${boardList.topic_title}</span>
							<span id="board_icon" class="glyphicon glyphicon-star">${boardList.recomnd_cnt}</span>
						</div>
					</c:if>
				</c:forEach>
				</div>
			</div>
			<div id="last" class="col-md-6"">
				<center><h3>종료된 토론</h3></center>
				<c:forEach items="${board}" var="boardList">
					<c:if test="${boardList.topic_progress eq 4}">
						<div class="item">
							<input type="hidden" name="topic_no" value="${boardList.topic_no}"/>
							<c:choose>
								<c:when test="${boardList.topic_type eq 0}">
									<label class="label label-primary">찬반</label>
								</c:when>
								<c:when test="${boardList.topic_type eq 1}">
									<label class="label label-danger">의견</label>
								</c:when>
							</c:choose>
							<span id="board_title">${boardList.topic_title}</span>
							<c:if test="${boardList.topic_type eq 0}">
								<c:choose>
										<c:when test="${boardList.debate_tot_pro eq 0}">
											<span id="pro_board"> 찬 0%</span>
										</c:when>
										<c:otherwise>
											<span id="pro_board"> 찬 <fmt:formatNumber value="${boardList.debate_tot_pro/(boardList.debate_tot_pro + boardList.debate_tot_con + boardList.debate_tot_neut)*100}" pattern=".0"/>%</span>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${boardList.debate_tot_con eq 0}">
											<span id="con"> 반 0%</span>
										</c:when>
										<c:otherwise>
											<span id="con"> 반 <fmt:formatNumber value="${boardList.debate_tot_con/(boardList.debate_tot_pro + boardList.debate_tot_con + boardList.debate_tot_neut)*100}" pattern=".0"/>%</span>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${boardList.debate_tot_neut eq 0}">
											<span id="neut"> 중 0%</span>
										</c:when>
										<c:otherwise>
											<span id="neut"> 중 <fmt:formatNumber value="${boardList.debate_tot_neut/(boardList.debate_tot_pro + boardList.debate_tot_con + boardList.debate_tot_neut)*100}" pattern=".0"/>%</span>
										</c:otherwise>
									</c:choose>
							</c:if>
							<c:if test="${boardList.topic_type eq 1}">
								<span id="board_icon" class="glyphicon glyphicon-education"> ${boardList.op_cnt}</span>
							</c:if>
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
