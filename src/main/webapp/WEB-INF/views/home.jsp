<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">-->
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/main/css/main.css">
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<head>
	<title>TAWAR</title>
</head>
<body>
	<!-- pageInfo -->
	<c:set var="numPerPage" value="6"/>	<!-- 각 페이지마다 게시물의 수 -->
	<c:set var="pagePerBlock" value="5"/>	<!-- 페이지블럭 마다 페이지의 수 -->
	<c:set var="nowPage" value="${param.nowPage}"/>	<!-- 현재 페이지 위치 -->
	<c:set var="nowBlock" value="${param.nowBlock}"/>	<!-- 현재 블럭 위치 -->
	<c:set var="totalPage" value="${main.size()/numPerPage}"/>
	<fmt:formatNumber var="totalPage" value="${totalPage+(1-(totalPage%1))%1}" maxFractionDigits="0"/> <!-- ceiling -->
	<c:set var="totalBlock" value="${totalPage/pagePerBlock}"/>
	<fmt:formatNumber var="totalBlock" value="${totalBlock+(1-(totalBlock%1))%1}" maxFractionDigits="0"/> <!-- ceiling -->
	<c:set var="beginPerPage" value="${numPerPage * nowPage}"/>
	<!-- Header -->
	<%@ include file="include/header.jsp" %>
	<!-- Content Title -->
	<div class="container" id="main_title">
		<div class="row">
			<div class="main_title col-md-3">
				<h2>인권을<br>자유를<br/>논하다</h2>
			</div>
			<c:forEach items="${main}" var="mainList" begin="0" end="2">
				<div class="item header_item col-md-offset-8">
				<input type="hidden" name="topic_no" value="${mainList.topic_no}"/>
				<c:choose>
					<c:when test="${mainList.topic_type eq 0}">
							<label class="label label-primary">찬반</label>
					</c:when>
					<c:when test="${mainList.topic_type eq 1}">
							<label class="label label-danger">의견</label>
					</c:when>
				</c:choose>
				<span>${mainList.topic_title}</span><br/><br/>
				</div>
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
				<c:choose>
					<c:when test="${main.size() eq 0}">
						<center><h3>게시물이 없습니다.</h3></center>
					</c:when>
					<c:otherwise>
						<c:forEach items="${main}" var="mainList" begin="${beginPerPage}" end="${beginPerPage + numPerPage -1}">
							<c:choose>
								<c:when test="${mainList.topic_type eq 0}">
									<div class="card grid-item col-md-3 col-md-offset-1" style="padding-left: 0px; padding-right: 0px; width:31%; margin-left: 2%;">
										<input type="hidden" name="topic_no" value="${mainList.topic_no}"/>
										<!-- card_header -->
										<!-- 1) 커버이미지 있을 때 -->
										<c:if test="${mainList.img_file_name != null}">
									 		<div class="card_header">
												<h4><label class="label label-primary">찬반</label></h4>
												<center><h3>${mainList.topic_title}</h3></center>
												<img class="coverImg" src="/resources/proposal/img/${mainList.img_file_name}.${mainList.img_ext_name}">
											</div>
										</c:if>
										<!-- 2) 커버이미지 없을 때 -->
										<c:if test="${mainList.img_file_name eq null}">
											<div class="card_header_noneImg">
												<h4><label class="label label-primary">찬반</label></h4>
												<center><h3>${mainList.topic_title}</h3></center>
											</div>
										</c:if>
										<div class="card_body">
										<p>${mainList.topic_short_cont}</p>
										<span class="glyphicon glyphicon-user"> ${mainList.debate_tot_pro + mainList.debate_tot_con + mainList.debate_tot_neut}</span>
										<c:choose>
											<c:when test="${mainList.debate_tot_pro eq 0}">
												<span class="pro"> 찬 0%</span>
											</c:when>
											<c:otherwise>
												<span class="pro"> 찬 <fmt:formatNumber value="${mainList.debate_tot_pro/(mainList.debate_tot_pro + mainList.debate_tot_con + mainList.debate_tot_neut)*100}" pattern=".0"/>%</span>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${mainList.debate_tot_con eq 0}">
												<span class="con"> 반 0%</span>
											</c:when>
											<c:otherwise>
												<span class="con"> 반 <fmt:formatNumber value="${mainList.debate_tot_con/(mainList.debate_tot_pro + mainList.debate_tot_con + mainList.debate_tot_neut)*100}" pattern=".0"/>%</span>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${mainList.debate_tot_neut eq 0}">
												<span class="neut"> 중 0%</span>
											</c:when>
											<c:otherwise>
												<span class="neut"> 중 <fmt:formatNumber value="${mainList.debate_tot_neut/(mainList.debate_tot_pro + mainList.debate_tot_con + mainList.debate_tot_neut)*100}" pattern=".0"/>%</span>
											</c:otherwise>
										</c:choose>
										</div>
									</div>
								</c:when>
								<c:when test="${mainList.topic_type eq 1}">
									<div class="card grid-item col-md-3 col-md-offset-1" style="padding-left: 0px; padding-right: 0px; width:31%; margin-left: 2%;">
										<input type="hidden" name="topic_no" value="${mainList.topic_no}"/>
										<!-- card_header -->
										<!-- 1) 커버이미지 있을 때 -->
										<c:if test="${mainList.img_file_name != null}">
											<div class="card_header">
												<h4><label class="label label-danger">의견</label><br/></h4>
												<center><h3>${mainList.topic_title}</h3></center>
												<img class="coverImg" src="/resources/proposal/img/${mainList.img_file_name}.${mainList.img_ext_name}">
											</div>
										</c:if>
										<!-- 2) 커버이미지 없을 때 -->
										<c:if test="${mainList.img_file_name eq null}">
											<div class="card_header_noneImg">
												<h4><label class="label label-danger">의견</label><br/></h4>
												<center><h3>${mainList.topic_title}</h3></center>
											</div>
										</c:if>
										<div class="card_body" style="padding: 8px;">
											<p>${mainList.topic_short_cont}</p>
											<span class="glyphicon glyphicon-comment"> ${mainList.op_cnt}</span>
										</div>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<!-- Page -->
		<c:if test="${main.size() > 0}">
			<div class="row">
				<div class="col-md-offset-5">
					<nav>
					  <ul class="pagination">
					  	<c:if test="${nowBlock > 0}">
					  		<li>
						      <a href="/?nowBlock=${nowBlock-1}&nowPage=${(nowBlock-1)*pagePerBlock}" aria-label="Previous">
						        <span aria-hidden="true">&laquo; Prev</span>
						      </a>
						    </li>
					  	</c:if>
					  	<c:set var="doneLoop" value="false"/>
					  	<c:forEach begin="0" end="${pagePerBlock-1}" varStatus="status">
					  		<c:if test="${not doneLoop}">
					  			<c:choose>
					  				<c:when test="${nowPage eq null && status.current eq 0}">
					  					<li class="active"><a href="/?nowBlock=${nowBlock}&nowPage=${status.current + (nowBlock*pagePerBlock)}">${status.current+1 + (nowBlock*pagePerBlock)}</a></li>
						  			</c:when>
						  			<c:when test="${status.current + (nowBlock*pagePerBlock) eq nowPage && nowPage ne null}">
						  				<li class="active"><a href="/?nowBlock=${nowBlock}&nowPage=${status.current + (nowBlock*pagePerBlock)}">${status.current+1 + (nowBlock*pagePerBlock)}</a></li>
						  			</c:when>
						  			<c:otherwise>
						  				<li><a href="/?nowBlock=${nowBlock}&nowPage=${status.current + (nowBlock*pagePerBlock)}">${status.current+1 + (nowBlock*pagePerBlock)}</a></li>
						  			</c:otherwise>
					  			</c:choose>
					  		</c:if>
					  		<c:if test="${status.current+1 + (nowBlock*pagePerBlock) eq totalPage}">
					  			<c:set var="doneLoop" value="true"/>
					  		</c:if>
					  	</c:forEach>
					  	<c:if test="${nowBlock +1 < totalBlock}">
					  		<li>
						      <a href="/?nowBlock=${nowBlock+1}&nowPage=${(nowBlock+1)*pagePerBlock}" aria-label="Next">
						        <span aria-hidden="true">Next &raquo;</span>
						      </a>
						    </li>
					  	</c:if>
					  </ul>
					</nav>
				</div>
			</div>
		</c:if>
	</div>
	<hr/>
	<!-- Board -->
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="board_title col-md-10">
					<h3>안건 건의</h3>
					<a href="/proposal/list">전체 안건 보기</a>
				</div>
				<div class="col-md-10">
				<c:set var="recomnd_loop" value="false"/>
				<c:forEach items="${recmd}" var="recmdList" varStatus="status">
					<c:if test="${not recomnd_loop}">
						<div class="item on_item">
							<input type="hidden" name="topic_no" value="${recmdList.topic_no}"/>
							<c:choose>
								<c:when test="${recmdList.topic_type eq 0}">
									<label class="label label-primary">찬반</label>
								</c:when>
								<c:when test="${recmdList.topic_type eq 1}">
									<label class="label label-danger">의견</label>
								</c:when>
							</c:choose>
							<span id="board_title"">${recmdList.topic_title}</span>
							<span id="board_icon" class="glyphicon glyphicon-star">${recmdList.recomnd_cnt}</span>
						</div>
					</c:if>
					<c:if test="${status.count eq 7}">
						<c:set var="recomnd_loop" value="true"/>
					</c:if>
				</c:forEach>
				</div>
			</div>
			<div id="last" class="col-md-6"">
				<div class="board_title col-md-10">
					<h3>종료된 토론</h3>
					<a href="/finished/list">전체 토론 보기</a>
				</div>
				<div class="col-md-10">
				<c:set var="fin_loop" value="false"/> 
				<c:forEach items="${finish}" var="finishList" varStatus="status">
					<c:if test="${not fin_loop}">
						<div class="item fin_item ">
							<input type="hidden" name="topic_no" value="${finishList.topic_no}"/>
							<c:choose>
								<c:when test="${finishList.topic_type eq 0}">
									<label class="label label-primary">찬반</label>
								</c:when>
								<c:when test="${finishList.topic_type eq 1}">
									<label class="label label-danger">의견</label>
								</c:when>
							</c:choose>
							<span id="board_title">${finishList.topic_title}</span>
							<c:if test="${finishList.topic_type eq 0}">
								<c:choose>
										<c:when test="${finishList.debate_tot_pro eq 0}">
											<span id="pro_board"> 찬 0%</span>
										</c:when>
										<c:otherwise>
											<span id="pro_board"> 찬 <fmt:formatNumber value="${finishList.debate_tot_pro/(finishList.debate_tot_pro + finishList.debate_tot_con + finishList.debate_tot_neut)*100}" pattern=".0"/>%</span>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${finishList.debate_tot_con eq 0}">
											<span id="con"> 반 0%</span>
										</c:when>
										<c:otherwise>
											<span id="con"> 반 <fmt:formatNumber value="${finishList.debate_tot_con/(finishList.debate_tot_pro + finishList.debate_tot_con + finishList.debate_tot_neut)*100}" pattern=".0"/>%</span>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${finishList.debate_tot_neut eq 0}">
											<span id="neut"> 중 0%</span>
										</c:when>
										<c:otherwise>
											<span id="neut"> 중 <fmt:formatNumber value="${finishList.debate_tot_neut/(finishList.debate_tot_pro + finishList.debate_tot_con + finishList.debate_tot_neut)*100}" pattern=".0"/>%</span>
										</c:otherwise>
									</c:choose>
							</c:if>
							<c:if test="${finishList.topic_type eq 1}">
								<span id="board_icon" class="glyphicon glyphicon-comment"> ${finishList.op_cnt}</span>
							</c:if>
						</div>
					</c:if>
					<c:if test="${status.count eq 7}">
						<c:set var="fin_loop" value="true"/>
					</c:if>
				</c:forEach>
				</div>
			</div>
		</div>
	</div>
<script src="/resources/main/js/main.js"></script>
</body>
</html>
